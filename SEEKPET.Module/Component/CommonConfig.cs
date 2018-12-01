using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Text;

namespace SEEKPET.Module.Component
{
    public class CommonConfig
    {
        //open.qq.com
        //public const string APPID = "wx2760ab1db0635822";
        //public const string SECRET = "fe37418e2456f82f374d92eed26510e4";
        //public const string SCOPE = "snsapi_login";
        //mp.weixin.qq.com
        public const string APPID = "wx3b219b6e49f93cd8";
        public const string SECRET = "38a89ae17856520d0f7fc3e7ad9fec24";
        public const string SCOPE = "snsapi_userinfo";
        public const string WxLoginAccessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token";
        public const string STATE = "sdk_demo";
        public const string WxRedirect_uri = "http://www.seekpetm.xin/tabid/84/Default.aspx";
        
        public const string WxUserinfoUrl = "https://api.weixin.qq.com/sns/userinfo";

        public static void WriteToTxt(string text)
        {
            string Path = "/wxmessage/";
            string FilePath = Path + DateTime.Now.ToString("yyyy-MM-dd") + ".log";
            if (!Directory.Exists(System.Web.HttpContext.Current.Server.MapPath(Path)))
            {
                Directory.CreateDirectory(System.Web.HttpContext.Current.Server.MapPath(Path));
            }
            FileStream fs = new FileStream(System.Web.HttpContext.Current.Server.MapPath(FilePath), FileMode.Append);
            StreamWriter sw = new StreamWriter(fs, Encoding.Default);
            sw.WriteLine(text + "  " + DateTime.Now.ToString());
            sw.WriteLine("");
            sw.Close();
            fs.Close();
        }
    }
}