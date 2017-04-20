using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddToCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //先判斷產品是否已經購買過
        //是 > 數量加1
        //否 > 新增此產品

        string ProductID = "";
        if(Request.QueryString["ProductID"] != null)
        {
            ProductID = Request.QueryString["ProductID"];
        }
        else
        {
            Response.Redirect("~/ProductList.aspx");
        }

        if(Session["CartID"] == null)
        {
            Session["CartID"] = Guid.NewGuid().ToString();
        }

        //if (Request.Cookies["CartID"] != null)
        //{
        //    CartID = Request.Cookies["CartID"].Value;
        //}else
        //{
        //    CartID = Guid.NewGuid().ToString();
        //    Response.Cookies["CartID"].Value = CartID;
        //}

        //Response.Write("ID" + ProductID + "<br>");
        //Response.Write(Guid.NewGuid().ToString());
        string strConn = ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(strConn))
        {
           // string strCmd = "Insert into ShoppingCart(CartID,Quantity,ProductID)values(@CartID,@Quantity,@ProductID)";
            using (SqlCommand cmd = new SqlCommand("ShoppingCartAddItem", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"].ToString());
                cmd.Parameters.AddWithValue("@Quantity", 1);
                cmd.Parameters.AddWithValue("@ProductID", ProductID);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        Response.Redirect("~/Cart.aspx");
    }
}