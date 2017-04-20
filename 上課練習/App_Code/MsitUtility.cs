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

	}
    public static void LoginCheck()
    {
        if (HttpContext.Current.Request.Cookies["name"] == null)
        {
            string sourceURL = HttpContext.Current.Request.Url.PathAndQuery;
            HttpContext.Current.Response.Redirect("~/Login.aspx?SourcePage=" + sourceURL);
        }
    }

}