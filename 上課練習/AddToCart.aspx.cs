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
        string ProductID = "";
        if (Request.QueryString["ProductID"] != null)
        {
            ProductID = Request.QueryString["ProductID"];
        }
        else
        {
            Response.Redirect("~/ProductList.aspx");
        }

        if (Session["CartID"] == null)
        {
            Session["CartID"] = Guid.NewGuid().ToString();
        }

        //string CartID = "";
        //if (Request.Cookies["CartID"] != null)
        //{
        //    CartID = Request.Cookies["CartID"].Value;
        //}
        //else
        //{
        //    CartID = Guid.NewGuid().ToString();
        //    Response.Cookies["CartID"].Value = CartID;
        //}

        string connStr = ConfigurationManager.ConnectionStrings["storeConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            //string cmdStr = "insert into ShoppingCart (CartID, ProductID, Quantity) values (@CartID,@ProductID, @Quantity)";
            using (SqlCommand cmd = new SqlCommand("ShoppingCartAddItem", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"]);
                cmd.Parameters.AddWithValue("@ProductID",ProductID);
                cmd.Parameters.AddWithValue("@Quantity", 1);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
         }
        Response.Redirect("~/Cart.aspx");
     }
}