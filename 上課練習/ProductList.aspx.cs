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
        if (Request.QueryString["CategoryID"] !=null)
        {
            id = Request.QueryString["CategoryID"];
        }
        Label1.Text = "您看到的是第" + id + "類產品。";
    }

    protected void DataList1_Load(object sender, EventArgs e)
    {
       
    }
}