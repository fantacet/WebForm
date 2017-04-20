using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Page1 : System.Web.UI.Page
{
    private MsitUtility utility = new MsitUtility();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.Cookies["name"] == null)
        //{
        //    string strPath = Request.Url.PathAndQuery;
        //    Response.Redirect("~/Login.aspx?returnUrl=" + strPath);
        //}
        utility.LoginCheck();
    }
}