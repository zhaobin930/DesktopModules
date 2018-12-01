using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WxPayAPI;
using System.Net;
using System.IO;
using System.Text;

namespace SEEKPET.Module
{
    public partial class VxPayQrCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string appid = "wx6c838884c52b8bfc";
                //string appsecret = "3eb854b47e09d3f12400cb5e116b2281";
                string appid = WxPayConfig.APPID;
                string appsecret = WxPayConfig.APPSECRET;
                QrCode code = new QrCode(Page);
                code.GetAccessToken(appid, appsecret);
                string ticket = code.GetQrcode(appid, appsecret, "20171231165549331");
                string url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + ticket;
                imgCode.ImageUrl = url;

            }
        }
    }
}