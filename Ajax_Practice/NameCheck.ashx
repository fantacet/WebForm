<%@ WebHandler Language="C#" Class="NameCheck" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class NameCheck : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
            string username = context.Request.QueryString["username"];
        context.Response.ContentType = "text/plain";
        context.Response.Write(IsExist(username));
    }


    public string IsExist (string name){
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("select count(firstname) from employees Where firstname = @username", conn);
            cmd.Parameters.AddWithValue("@username", name);

            conn.Open();
            int dr = Convert.ToInt16( cmd.ExecuteScalar());
            if (dr >= 1)
            {
                return "帳號存在";
            }
            else
            {
                return "帳號不存在";
            }
        }



    }
        public bool IsReusable {
        get {
            return false;
        }
    }

}