<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;

public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        // System.Threading.Thread.Sleep(5000);
        string username = context.Request.QueryString["username"];
        context.Response.ContentType = "text/plain";
        context.Response.Write(string.Format("Hello,{0}",username));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}