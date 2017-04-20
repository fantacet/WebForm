<%@ WebHandler Language="C#" Class="CategoryHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Collections.Generic;


public class CategoryHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString))
        {
            string strCmd = "select categoryid, categoryname from categories";
            using (SqlCommand cmd = new SqlCommand(strCmd, conn))
            {
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                List<Category> catList = new List<Category>();
                while (dr.Read())
                {
                    //Category cat1 = < Category >{ cate}
                    Category cat = new Category();
                    cat.categoryID = Convert.ToInt16(dr["CategoryID"]);
                    cat.categoryName = dr["CategoryName"].ToString();
                    catList.Add(cat);
                }

                conn.Close();

                context.Response.ContentType = "text/plain";
                //context.Response.ContentType = "application/json";
                context.Response.Write(JsonConvert.SerializeObject(catList));


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