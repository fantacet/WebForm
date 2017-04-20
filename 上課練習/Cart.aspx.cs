using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CartID"]==null)
        {
            string jsStr = "alert('沒買東西是要看什麼?'); location.href='ProductList.aspx';";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", jsStr, true);
        }
        else
        {
            GetCartTotal();
        }
        
    }

    string connStr = ConfigurationManager.ConnectionStrings["storeConnectionString"].ConnectionString;

    private void GetCartTotal()
    {
        
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            using (SqlCommand cmd = new SqlCommand("ShoppingCartTotal", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"]);
                cmd.Parameters.Add("@TotalCost", SqlDbType.Money);
                cmd.Parameters["@TotalCost"].Direction = System.Data.ParameterDirection.Output;

                conn.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = String.Format("總計:{0:c0}元", cmd.Parameters["@TotalCost"].Value);
                conn.Close();
            }
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow r in GridView1.Rows)
        {
            TextBox tbQuantity = (TextBox)r.FindControl("TextBox2");
            CheckBox cbDel = (CheckBox)r.FindControl("CheckBox1");

            Response.Write(tbQuantity.Text + "<br>");
            Response.Write(cbDel.Checked.ToString() + "<br>");

        }

        GridView1.DataBind();
        GetCartTotal();
    }

    public void UpdateItem(string ProductID, string Qty, bool IsDel)
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            using (SqlCommand cmd = new SqlCommand("ShoppingCartUpdate", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"].ToString());
                cmd.Parameters.AddWithValue("@ProductID", ProductID);
                cmd.Parameters.AddWithValue("@Quantity", Qty);
                cmd.Parameters.AddWithValue("@IsDelete", IsDel);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        MsitUtility.LoginCheck();

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            using (SqlCommand cmd = new SqlCommand("OrderCreate", conn))
            {

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"].ToString());
                cmd.Parameters.AddWithValue("@CustomerID", Convert.ToInt32( Session["CartID"]));
                cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now.ToShortDateString());
                cmd.Parameters.AddWithValue("@ShipDate", DateTime.Now.AddHours(6).ToShortDateString());
                cmd.Parameters.Add("@OrderID", SqlDbType.Int);
                cmd.Parameters["@OrderID"].Direction = ParameterDirection.Output;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("~/Orders.aspx?OrderID=" + cmd.Parameters["@OrderID"].Value);

            }
        }

    }
}