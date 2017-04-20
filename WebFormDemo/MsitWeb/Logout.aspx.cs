using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //清除購物車

        //清除session
        Session.Abandon();

        //清除cookie
        Response.Cookies["name"].Expires = DateTime.Now.AddSeconds(-1);

        Response.Redirect("~/ProductList.aspx");

    }
}