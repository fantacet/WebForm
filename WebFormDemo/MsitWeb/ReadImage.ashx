<%@ WebHandler Language="C#" Class="ReadImage" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;


public class ReadImage : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string ProductID = "1";
        if(context.Request.QueryString["ProductID"] != null)
        {
            ProductID = context.Request.QueryString["ProductID"];
        }
        string strConn = ConfigurationManager.ConnectionStrings["StoreConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(strConn))
        {
            string strCmd = "select BytesImage from Products where ProductID=@ProductID";
            using(SqlCommand cmd = new SqlCommand(strCmd,conn))
            {
                cmd.Parameters.AddWithValue("@ProductID", ProductID);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                     context.Response.ContentType = "image/jpeg";
                     context.Response.BinaryWrite((Byte[])dr[0]);
                }
                conn.Close();
            }
        }
      
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}