using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["storeConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            //string cmdStr = "select FullName from Customers where EmailAddress = @email and Password = @password";
            string cmdStr = "ShoppingCartIDUpdate";
            using (SqlCommand cmd = new SqlCommand(cmdStr, conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@EmailAddress", tbEmail.Text);
                cmd.Parameters.AddWithValue("@Password", tbPassword.Text);
                if (Session["CartID"]==null)
                {
                    Session["CartID"] = Guid.NewGuid().ToString();
                }
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"].ToString());
                cmd.Parameters.Add("@FullName", SqlDbType.NVarChar, 50);
                cmd.Parameters["@FullName"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@CustomerID", SqlDbType.Int);
                cmd.Parameters["@CustomerID"].Direction = ParameterDirection.Output;

                conn.Open();
               
                object userName = cmd.ExecuteNonQuery();
                
                if (cmd.Parameters["@FullName"] != null)
                {
                    Response.Cookies["name"].Value = cmd.Parameters["@FullName"].Value.ToString();
                    Session["CartID"] = cmd.Parameters["@CustomerID"].Value.ToString();
                    if (cbRememberMe.Checked)
                    {
                        Response.Cookies["name"].Expires = DateTime.Now.AddDays(7);
                    }

                    string jsStr = "alert('登入成功');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "", jsStr, true);

                    if (Request.QueryString["SourcePage"]!=null)
                    {
                        Response.Redirect(Request.QueryString["SourcePage"]);
                    }
                    else
                    {
                        string jsRedirect = "location.href='ProductList.aspx';";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "", jsRedirect, true);
                    }
                }
                else
                {
                    string jsStr = "alert('你誰?');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "", jsStr, true);
                }

                conn.Close();
            }
        }
    }
}