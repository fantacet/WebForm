using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Cart : System.Web.UI.Page
{
    private MsitUtility utility = new MsitUtility();
    string strConn = ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CartID"] == null)
        {
            // Response.Redirect("~/ProductList.aspx");
            string strJS = "alert('請先購物!!');location.href='ProductList.aspx'";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", strJS, true);

        }else
        {
            GetTotal();
        }
    }

    protected void GetTotal()
    {
        using (SqlConnection conn = new SqlConnection(strConn))
        {
            using (SqlCommand cmd = new SqlCommand("ShoppingCartTotal", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                //輸入的參數
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"].ToString());
                //輸出的參數
                cmd.Parameters.Add("@TotalCost", SqlDbType.Money);
                cmd.Parameters["@TotalCost"].Direction = ParameterDirection.Output;

                conn.Open();
                cmd.ExecuteNonQuery();
                LabelTotal.Text = String.Format("總計：{0:c0}", cmd.Parameters["@TotalCost"].Value);
                conn.Close();
            }
        }
    }
    
    //購物車更新
    protected void Button1_Click(object sender, EventArgs e)
    {

        foreach(GridViewRow theRow in GridView1.Rows)
        {
            TextBox TextBoxQty = (TextBox)theRow.FindControl("TextBox2");
            CheckBox CheckBoxDel = (CheckBox)theRow.FindControl("CheckBox1");
            HiddenField HiddenId = (HiddenField)theRow.FindControl("HiddenField1");
          //  Response.Write("Num：" + theRow.Cells[1].Text + "<br>");
            //Response.Write("Id：" + HiddenId.Value + "<br>");
            //Response.Write("Qty：" + TextBoxQty.Text + "<br>");
            //Response.Write("Del：" + CheckBoxDel.Checked.ToString() + "<br>");

            UpdateItem(HiddenId.Value, TextBoxQty.Text, CheckBoxDel.Checked);
            //if (CheckBoxDel.Checked)
            //{ //connection
            //    //command 資料刪除  Where CartID=@CartID and ProductID=@ProductID
            //}else
            //{
            //    //conection
            //  //command 數量更新 set Quantity=@Quantity  Where CartID=@CartID and ProductID=@ProductID
            //}       
            
        }

        GridView1.DataBind();
        GetTotal();

    }

    protected void UpdateItem(string ProductID,string Qty, bool isDel)
    {
        using (SqlConnection conn =  new SqlConnection(strConn))
        {
            using (SqlCommand cmd = new SqlCommand("ShoppingCartUpdate", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID",Session["CartID"].ToString());
                cmd.Parameters.AddWithValue("@ProductID", ProductID);
                cmd.Parameters.AddWithValue("@Quantity", Qty);
                cmd.Parameters.AddWithValue("@isDelete", isDel);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }

    protected void ButtonCheckout_Click(object sender, EventArgs e)
    {
        utility.LoginCheck();

        //1.將shoppingcart 的資料轉到order orderdetails資料表
        //2.將shoppingcart的資料清除
        //3.告知使用者訂單編號，轉到訂單頁面
     
        using (SqlConnection conn = new SqlConnection(strConn))
        {
              using (SqlCommand cmd = new SqlCommand("OrderCreate", conn))
            {
                cmd.CommandType =CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"].ToString());
                cmd.Parameters.AddWithValue("@CustomerID", Convert.ToInt32(Session["CartID"]));
                cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now.ToShortDateString());
                cmd.Parameters.AddWithValue("@ShipDate", DateTime.Now.AddDays(1));

                cmd.Parameters.AddWithValue("@OrderID", SqlDbType.Int);
                cmd.Parameters["@OrderID"].Direction = ParameterDirection.Output;

                conn.Open();
                cmd.ExecuteNonQuery();
                string orderID = cmd.Parameters["@OrderID"].Value.ToString();

                string strJS = "alert('訂單編號" + orderID + " !!');location.href='Order.aspx?OrderID=" + orderID + "'";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", strJS, true);
            conn.Close();
            }
        }
    }
}