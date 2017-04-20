using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = "1";
        if (Request.QueryString["id"] != null)
        {
            id = Request.QueryString["id"];
        }
        Label1.Text = string.Format("分類編號{0}的產品", id);
      //  Label2.Text = Request.Url.AbsolutePath.ToString();

    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}