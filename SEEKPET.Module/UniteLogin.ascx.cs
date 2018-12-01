using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEEKPET.Module.Component;

namespace SEEKPET.Module
{
    public partial class UniteLogin :EasySite.Entities.Modules.PortalModuleBase
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linVx_Click(object sender, EventArgs e)
        {
            string url = string.Format("https://open.weixin.qq.com/connect/oauth2/authorize?appid={0}&redirect_uri={1}&response_type=code&scope={2}&state={3}#wechat_redirect", CommonConfig.APPID, Server.UrlEncode(CommonConfig.WxRedirect_uri), CommonConfig.SCOPE, CommonConfig.STATE);
            //string url = string.Format("https://open.weixin.qq.com/connect/qrconnect?appid={0}&redirect_uri={1}&response_type=code&scope={2}&state={3}#wechat_redirect", CommonConfig.APPID, Server.UrlEncode(CommonConfig.WxRedirect_uri), CommonConfig.SCOPE, CommonConfig.STATE);
            //string url = string.Format("https://open.weixin.qq.com/sns/explorer_broker?appid={0}&redirect_uri={1}&response_type=code&scope={2}&state={3}&connect_redirect=1#wechat_redirect", CommonConfig.APPID, Server.UrlEncode(CommonConfig.WxRedirect_uri), CommonConfig.SCOPE, CommonConfig.STATE);
            Response.Redirect(url);
        }
    }
}