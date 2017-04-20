using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Msit : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (ContentPlaceHolder1.FindControl("HiddenTitle") != null)
            {
                LiteralTitle.Text = ((HiddenField)ContentPlaceHolder1.FindControl("HiddenTitle")).Value;
            }
            else
            {
                LiteralTitle.Text = "";
            }



            //登入 登出切換
            if (Request.Cookies["name"] != null)
            {
                HyperLinkLogin.Text = "<span class='glyphicon glyphicon-user'></span> " + Request.Cookies["name"].Value + " 登出";
                HyperLinkLogin.NavigateUrl = "~/Logout.aspx";

            }else
            {
                HyperLinkLogin.Text = "登入";
                HyperLinkLogin.NavigateUrl = "~/Login.aspx";
            }
        }
    }
}
