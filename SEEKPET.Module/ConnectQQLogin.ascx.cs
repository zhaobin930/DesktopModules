using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasySite.Security.Membership;
using EasySite.Entities.Users;
using SEEKPET.Info;

namespace SEEKPET.Module
{
    public partial class ConnectQQLogin : EasySite.Entities.Modules.PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    if (Request.QueryString["o"] != null && Request.QueryString["a"] != null && Request.QueryString["n"] != null)
            //    {
            //        string openid = Request.QueryString["o"].ToString();
            //        string accesstoken = Request.QueryString["a"].ToString();
            //        string nickname = Request.QueryString["n"].ToString();
            //        int logintype = 1;//qq登录
            //        //是否存在信息
            //        string str = string.Format("select top 1 userid from See_user where openid='{0}' and accesstoken='{1}' and logintype='{2}'", openid, accesstoken, logintype);
            //        string result = SqlDataProvider.SqlDataProvider.GetSQLValue(str);
            //        if (result == "")//不存在
            //        {
            //            //注册
            //            string msg = UserRegister(openid, logintype.ToString(), accesstoken, nickname);
            //            if (msg == "1")
            //            {
            //                Response.Redirect("/");
            //            }
            //            else
            //            {
            //                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('" + msg + "');</script>");
            //            }

            //        }
            //        else//存在
            //        {
            //            string username = GenerUserName(openid, logintype.ToString());
            //            //登录
            //            //EasySite.Entities.Users.UserController.SetAuthCookie(username, true);
            //            UserLoginStatus status = new UserLoginStatus();
            //            UserInfo objUser = UserController.UserLogin(0, username, "1qaz2wsx", "", "觅宠", HttpContext.Current.Request.UserHostAddress, ref status, false);
            //            if (status == UserLoginStatus.LOGIN_SUCCESS)
            //            {
            //                Response.Redirect("/");
            //            }
            //            else
            //            {
            //                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('登陆失败');</script>");
            //            }
            //        }
            //    }
            //    else
            //    {
            //        Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('参数错误');</script>");
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('" + ex.Message + "');</script>");
            //}
        }

        protected string GenerUserName(string openid, string logintype)
        {
            return logintype + "_" + openid;
        }

        protected string UserRegister(string openid, string logintype, string accesstoken, string nickname)
        {
            //注册用户
            UserInfo objUser = new UserInfo();
            EasySite.Security.Membership.UserCreateStatus Status = EasySite.Security.Membership.UserCreateStatus.AddUser;

            objUser.Username = GenerUserName(openid, logintype.ToString());
            objUser.DisplayName = nickname;
            objUser.FirstName = nickname;
            objUser.LastName = nickname;
            objUser.Membership.Password = "1qaz2wsx";//存储一个随机密码
            objUser.Email = "123@123.com";
            objUser.PortalID = 0;

            Status = EasySite.Entities.Users.UserController.CreateUser(ref objUser);
            string msg;
            if (Status == EasySite.Security.Membership.UserCreateStatus.Success)
            {
                string ipAddress = GetClientIpAddress();
                EasySite.Entities.Users.UserController.UserLogin(objUser.PortalID, objUser, "", ipAddress, false);
                //See_user
                See_User u = new See_User();
                u.UserID = objUser.UserID;
                u.OpenID = openid;
                u.AccessToken = accesstoken;
                u.CreateTime = DateTime.Now;
                u.LoginType = logintype;
                SqlDataProvider.SqlDataProvider.InsertSee_User(u);
                msg = "1";
            }
            else if (Status == EasySite.Security.Membership.UserCreateStatus.DuplicateEmail)
            {
                msg = "重复的注册邮件";
            }
            else if (Status == EasySite.Security.Membership.UserCreateStatus.DuplicateUserName)
            {
                msg = "重复的注册用户名";
            }
            else if (Status == EasySite.Security.Membership.UserCreateStatus.InvalidEmail)
            {
                msg = "不合法的注册邮件";
            }
            else if (Status == EasySite.Security.Membership.UserCreateStatus.InvalidPassword)
            {
                msg = "不合法的注册密码";
            }
            else if (Status == EasySite.Security.Membership.UserCreateStatus.InvalidUserName)
            {
                msg = "不合法的注册用户名";
            }
            else if (Status == EasySite.Security.Membership.UserCreateStatus.PasswordMismatch)
            {
                msg = "密码不匹配";
            }
            else if (Status == EasySite.Security.Membership.UserCreateStatus.UnexpectedError)
            {
                msg = "未预知的错误";
            }
            else if (Status == EasySite.Security.Membership.UserCreateStatus.UserAlreadyRegistered)
            {
                msg = "用户已经注册过";
            }
            else if (Status == EasySite.Security.Membership.UserCreateStatus.UsernameAlreadyExists)
            {
                msg = "用户名已经存在";
            }
            else
            {
                msg = "注册失败";
            }
            return msg;
        }

        /// <summary>
        /// 获取客户端IP地址
        /// </summary>
        /// <returns></returns>
        public static string GetClientIpAddress()
        {
            string ipAddress = "";
            HttpContext context = HttpContext.Current;
            if (context.Request.UserHostAddress != null)
                ipAddress = context.Request.UserHostAddress;

            return ipAddress;
        }
    }
}