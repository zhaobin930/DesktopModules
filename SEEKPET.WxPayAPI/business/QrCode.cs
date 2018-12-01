using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.IO;
using System.Text;
using System.Web.UI;
using LitJson;
using Newtonsoft.Json.Linq;

namespace WxPayAPI
{
    public class QrCode
    {
        /// <summary>
        /// 保存页面对象，因为要在类的方法中使用Page的Request对象
        /// </summary>
        private Page page { get; set; }

        /// <summary>
        /// openid用于调用统一下单接口
        /// </summary>
        public string openid { get; set; }

        /// <summary>
        /// access_token用于获取收货地址js函数入口参数
        /// </summary>
        public string access_token { get; set; }
        public QrCode(Page page)
        {
            this.page = page;
        }

        /// <summary>
        /// 获取AccessToken
        /// </summary>
        /// <returns>AccessToken</returns>
        public string GetAccessToken(string appid, string appsecret)
        {
            string accessToken = "";
            string respText = "";
            string url = string.Format("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={0}&secret={1}", appid, appsecret);

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();

            using (Stream resStream = response.GetResponseStream())
            {
                StreamReader reader = new StreamReader(resStream, Encoding.Default);
                respText = reader.ReadToEnd();
                resStream.Close();
            }
            //保存access_token，用于收货地址获取
            JsonData jd = JsonMapper.ToObject(respText);
            access_token = (string)jd["access_token"];
            //Dictionary<string, object> respDic = (Dictionary<string, object>)Jss.DeserializeObject(respText);
            //accessToken = respDic["access_token"].ToString();
            return accessToken;
        }

        /// <summary>
        /// 调用微信接口获取带参数临时二维码的ticket
        /// 使用方法：https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=TICKET
        /// </summary>
        /// <param name="scene_id">二维码带的参数</param>
        /// <returns>json:ticket:换取二维码的凭证，expire_seconds:凭证有效时间，url:二维码解析后的地址。此处返回ticket 否则返回错误码</returns>
        public string GetQrcode(string appid, string appsecret, Int32 scene_id)
        {
            string QrcodeUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token={0}";//WxQrcodeAPI接口
            string AccessToken = access_token;//拉取AccessToken
            QrcodeUrl = string.Format(QrcodeUrl, AccessToken);
            string PostJson = "{\"expire_seconds\": 1800, \"action_name\": \"QR_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": " + scene_id + "}}}";
            string ReText = HttpService.Post(PostJson, QrcodeUrl, false, 6000);//post提交
            JsonData jd = JsonMapper.ToObject(ReText);
            if (jd["ticket"] != null)
            {
                return jd["ticket"].ToString();//成功
            }
            else
            {
                return jd["errcode"].ToString();//返回错误码
            }
        }

        /// <summary>
        /// 调用微信接口获取带参数永久二维码的ticket
        /// 使用方法：https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=TICKET
        /// </summary>
        /// <param name="scene_id">二维码带的参数</param>
        /// <returns>json:ticket:换取二维码的凭证，expire_seconds:凭证有效时间，url:二维码解析后的地址。此处返回ticket 否则返回错误码</returns>
        public string GetQrcode(string appid, string appsecret, string scene_str)
        {
            string QrcodeUrl = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token={0}";//WxQrcodeAPI接口
            string AccessToken = access_token;//拉取AccessToken
            QrcodeUrl = string.Format(QrcodeUrl, AccessToken);
            string PostJson = "{\"action_name\": \"QR_LIMIT_STR_SCENE\", \"action_info\": {\"scene\": {\"scene_str\": " + scene_str + "}}}";
            string response = HttpService.Post(PostJson, QrcodeUrl, false, 6000);//post提交
            Log.Debug("code", "code response : " + response);
            JObject jo = JObject.Parse(response);
            bool success = jo.Properties().Any(p => p.Name == "ticket");//
            if (success)
            {
                return jo.Property("ticket").Value.ToString();//成功
            }
            else
            {
                return jo.Property("errcode").Value.ToString();//返回错误码
            }
        }
    }

}