using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string pid = "1";
        if (Request.QueryString["ProductID"]!=null)
        {
            pid = Request.QueryString["ProductID"];
        }

        Label1.Text = "這是第"+ pid + "項產品。";
    }
}