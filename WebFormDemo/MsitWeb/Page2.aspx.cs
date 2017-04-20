using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Page2 : System.Web.UI.Page
{
    private MsitUtility utility = new MsitUtility();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(Request.Url.AbsolutePath + "<br>");
        //Response.Write(Request.Url.PathAndQuery + "<br>");
        //Response.Write(Request.Url.LocalPath + "<br>");
        //Response.Write(Request.Url.AbsoluteUri + "<br>");

        //if (Request.Cookies["name"] == null)
        //{
        //    string strPath = Request.Url.PathAndQuery;
        //    Response.Redirect("~/Login.aspx?returnUrl=" + strPath);
        //}
        utility.LoginCheck();
    }
}