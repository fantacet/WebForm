using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestCookie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Cookies["name"].Value = "John";
        //Response.Cookies["name"].Expires = DateTime.Now.AddHours(1);

        //Response.Cookies["Name"].Value = "Mary";
        //Response.Cookies["Name"].Expires = DateTime.Now.AddHours(1);



        //if (Request.Cookies["Name"] != null)
        //{
        //    Response.Write(Request.Cookies["Name"].Value);
        //}
        //else
        //{
        //    Response.Write("No Name");
        //}

        Response.Write(Session.SessionID);
    }
}