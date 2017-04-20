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
    string strConn = ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //登入
    protected void Button1_Click(object sender, EventArgs e)
    {
        //判斷帳號密碼是否正確
        //1. 不正確 > 提示使用者密碼錯誤
        //2. 正確 
        //2.1要將登入帳號寫進cookie
        //2.2要判斷記住我有沒有勾選>有>就把帳號保留7天
        //2.3轉回使用者原來要看的頁面

        //2.4將Session["CartId"]換成customer id
        //2.5將shoppingcart table裡面的cartid換成customer id


        if (Session["CartID"] == null)
        {
            Session["CartID"] = Guid.NewGuid().ToString();
        }


        using (SqlConnection conn = new SqlConnection(strConn))
        {
            // string strCmd = "select fullName from Customers where EmailAddress=@EmailAddress and Password=@Password";
            string strCmd = "ShoppingCartIDUpdate";
            using (SqlCommand cmd = new SqlCommand(strCmd, conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmailAddress", inputEmail.Text);
                cmd.Parameters.AddWithValue("@Password", inputPassword.Text);
               
                cmd.Parameters.AddWithValue("@CartID", Session["CartID"].ToString());

                cmd.Parameters.Add("@FullName", SqlDbType.NVarChar, 50);
                cmd.Parameters["@FullName"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@CustomerID", SqlDbType.Int);
                cmd.Parameters["@CustomerID"].Direction = ParameterDirection.Output;



                conn.Open();
               cmd.ExecuteNonQuery();
                string userName = cmd.Parameters["@FullName"].Value.ToString();
                string strJS = "alert('密碼錯誤，請重新輸入!!');";
                if (!string.IsNullOrEmpty(userName))
                {
                    //2.4
                    
                    Session["CartID"] = cmd.Parameters["@CustomerID"].Value.ToString();
                    //2.1將登入帳號存到cookie中
                    Response.Cookies["name"].Value = userName.ToString();
                    //2.2
                    if (CheckBoxRemember.Checked)
                    {
                        Response.Cookies["name"].Expires = DateTime.Now.AddDays(7);
                    }

                    //2.3
                    string strUrl = "ProductList.aspx";
                    if(Request.QueryString["returnUrl"] != null)
                    {
                        strUrl = Request.QueryString["returnUrl"];
                    }

                    strJS = "alert('" + userName.ToString() + " 登入成功!!');location.href='" + strUrl + "'";
                }
                 Page.ClientScript.RegisterStartupScript(this.GetType(), "", strJS, true);
                conn.Close();
            }
        }
    }
}