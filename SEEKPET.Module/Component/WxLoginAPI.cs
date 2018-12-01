using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.IO;
using System.Text;
using Newtonsoft.Json.Linq;

namespace SEEKPET.Module.Component
{
    public class WxLoginAPI
    {
        public string code;
        public string access_token;
        public string openid;
        public string nickname;
        public WxLoginAPI()
        {
        }

        public bool GetAccessToken()
        {
            string url = CommonConfig.WxLoginAccessTokenUrl + "?appId=" + CommonConfig.APPID + "&secret=" + CommonConfig.SECRET + "&code="+code+"&grant_type=authorization_code";
            HttpWebResponse response = null;
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "GET";
            request.ContentType = "application/stream";
            response = (HttpWebResponse)request.GetResponse();
            Stream myResponseStream = response.GetResponseStream();
            StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.UTF8);
            string retString = myStreamReader.ReadToEnd();
            myStreamReader.Close();
            myResponseStream.Close();
            CommonConfig.WriteToTxt(retString);
            JObject jo = JObject.Parse(retString);
            bool success = jo.Properties().Any(p => p.Name == "access_token");//
            if (success)
            {
                access_token= jo.Property("access_token").Value.ToString();//成功
                openid = jo.Property("openid").Value.ToString();
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool GetUserInfo()
        {
            string url = CommonConfig.WxUserinfoUrl + "?access_token=" + access_token + "&openid=" + openid;
            HttpWebResponse response = null;
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
            request.Method = "GET";
            request.ContentType = "application/stream";
            response = (HttpWebResponse)request.GetResponse();
            Stream myResponseStream = response.GetResponseStream();
            StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.UTF8);
            string retString = myStreamReader.ReadToEnd();
            myStreamReader.Close();
            myResponseStream.Close();
            JObject jo = JObject.Parse(retString);
            bool success = jo.Properties().Any(p => p.Name == "nickname");//
            if (success)
            {
                nickname = jo.Property("nickname").Value.ToString();//成功
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}