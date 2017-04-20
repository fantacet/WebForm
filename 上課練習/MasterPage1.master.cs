using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (ContentPlaceHolder1.FindControl("PageTitle")!=null)
        {
            Literal1.Text = ((HiddenField)ContentPlaceHolder1.FindControl("PageTitle")).Value;
        }

        if (Request.Cookies["name"] != null)
        {
            lkLogin.Text = Request.Cookies["name"].Value + "登出";
            lkLogin.NavigateUrl = "~/Logout.aspx";
        }
        else
        {
            lkLogin.Text = "登入";
            lkLogin.NavigateUrl = "~/Login.aspx";
        }

    }
}
