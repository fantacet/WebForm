<%@ WebHandler Language="C#" Class="ProductHandler" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;

public class ProductHandler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
            string CatID = "1";
                if (context.Request.QueryString["CategoryID"] != null)
                {
                    CatID = context.Request.QueryString["CategoryID"].ToString();
                }

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString))
        {
            string strCmd = "select * from products where categoryID = @categoryID";
            using (SqlDataAdapter da = new SqlDataAdapter(strCmd, conn))
            {
                
                

                da.SelectCommand.Parameters.AddWithValue("@categoryID", CatID);
                DataSet ds = new DataSet();
                da.Fill(ds);

                context.Response.ContentType = "application/json";
                context.Response.Write(JsonConvert.SerializeObject(ds.Tables[0]));

                //context.Response.ContentType = "text/plain";
                //context.Response.Write(ds);
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}