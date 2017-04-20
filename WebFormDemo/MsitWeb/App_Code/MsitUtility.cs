using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// MsitUtility 的摘要描述
/// </summary>
public class MsitUtility
{
    public MsitUtility()
    {
        //
        // TODO: 在這裡新增建構函式邏輯
        //
    }
    public void LoginCheck()
    {
        if (HttpContext.Current.Request.Cookies["name"] == null)
        {
            string strPath = HttpContext.Current.Request.Url.PathAndQuery;
            HttpContext.Current.Response.Redirect("~/Login.aspx?returnUrl=" + strPath);
        }
    }
}