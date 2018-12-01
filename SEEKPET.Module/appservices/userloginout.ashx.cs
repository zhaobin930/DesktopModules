using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEEKPET.Module.appservices
{
    /// <summary>
    /// userloginout 的摘要说明
    /// </summary>
    public class userloginout : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //context.Request.Cookies.Remove(".EASYSITE4");
            EasySite.Security.PortalSecurity PortalSecurity = new EasySite.Security.PortalSecurity();
            PortalSecurity.SignOut();
            context.Response.Write("1");

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}