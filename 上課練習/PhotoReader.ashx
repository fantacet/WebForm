<%@ WebHandler Language="C#" Class="PhotoReader" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;



public class PhotoReader : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        string ProductID = "1";
        if (context.Request.QueryString["ProductID"] != null)
        {
                ProductID = context.Request.QueryString["ProductID"];
        }
        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["storeConnectionString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("select BytesImage from Products Where ProductID = @ProductID", conn);
            cmd.Parameters.AddWithValue("@ProductID", ProductID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                context.Response.ContentType = "image/jpeg";
                context.Response.BinaryWrite((Byte[])dr[0]);

            }
        }
    }







    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
