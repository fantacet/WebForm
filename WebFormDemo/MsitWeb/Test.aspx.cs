using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.Cookies["name2"] != null)
        //{
        //    Response.Write(Request.Cookies["name2"].Value);
        //}else
        //{
        //    Response.Cookies["name2"].Value = "Tom";
        //    Response.Cookies["name2"].Expires = DateTime.Now.AddDays(365);
        //}

        Label1.Text = "SessionID：" + Session.SessionID.ToString();
        Label2.Text = "SessionTimeout：" + Session.Timeout.ToString();
    }
}