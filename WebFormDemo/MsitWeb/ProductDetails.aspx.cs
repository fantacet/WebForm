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
        string ProductID = "1";
        if (Request.QueryString["ProductID"] != null)
        {
            ProductID = Request.QueryString["ProductID"];
        }

        Label1.Text = "產品編號" + ProductID + "的詳細資料";
    }
}