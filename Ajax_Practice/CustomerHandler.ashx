<%@ WebHandler Language="C#" Class="CustomerHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Collections.Generic;

public class CustomerHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string CustomerID = "a";
        if (context.Request.QueryString["CustomerID"] != null)
        {
            CustomerID = context.Request.QueryString["CustomerID"];
        }
        

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString))
        {
            string strCmd = "select customerID from customers where customerid like @name";
            using (SqlCommand cmd = new SqlCommand(strCmd, conn))
            {
                cmd.Parameters.AddWithValue("@name", CustomerID+"%");

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                List<string> customerList = new List<string>();
                while (dr.Read())
                {
                    customerList.Add(dr[0].ToString());
                }

                conn.Close();

                context.Response.ContentType = "text/plain";
                //context.Response.ContentType = "application/json";
                context.Response.Write(JsonConvert.SerializeObject(customerList));


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