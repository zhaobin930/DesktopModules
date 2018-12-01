using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EasySite.Entities.Users;

namespace SEEKPET.Module.appservices
{
    /// <summary>
    /// IsUserLogin 的摘要说明
    /// </summary>
    public class isuserlogin : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            //UserInfo info = UserController.GetCurrentUserInfo();
            //if (info != null && info.UserID > 0)
            //{
            //    context.Response.Write("1");
            //}
            //else
            //{
            //    context.Response.Write("0");
            //}
            if (context.Request.Cookies[".EASYSITE4"] != null)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }

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