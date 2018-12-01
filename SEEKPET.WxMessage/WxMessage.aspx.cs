using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Xml;
using System.Text;
using SEEKPET.Info;
using System.Net;
using Newtonsoft.Json.Linq;

namespace SEEKPET.WxMessage
{
    public partial class WxMessage : System.Web.UI.Page
    {
        public const string APPID = "wx3b219b6e49f93cd8";
        public const string APPSECRET = "38a89ae17856520d0f7fc3e7ad9fec24";
        protected void Page_Load(object sender, EventArgs e)
        {
            RenZheng();
            CreateWxMenu();
            wxmessage wx = GetWxMessage();
            if (wx == null)
            {
                WriteToTxt("参数错误:wxmessage为空");
                return;
            }
            string res = "";
            switch (wx.Event)
            {
                case "subscribe":
                    {
                        string content = "";
                        content = "欢迎关注SeekPetM（觅宠）:" + wx.EventKey;
                        res = sendTextMessage(wx, content);
                        break;
                    }
                case "SCAN":
                    {
                        string content = "";
                        //content = "扫描订单ID :" + wx.EventKey;
                        //订单核销
                        //订单号
                        string tradeno = "XP" + wx.EventKey;
                        See_Pay pay = SqlDataProvider.SqlDataProvider.GetInfoSee_PayByTradeNo(tradeno);
                        if (pay != null)
                        {
                            int count = SqlDataProvider.SqlDataProvider.GetTableInfoCount(string.Format("select count(*) from Lists where ListName='SeekPetQrCodeCheck' and Value='{0}'", wx.FromUserName));
                            //限制核销人
                            //if (wx.FromUserName != "zhaob")
                            if (count <= 0)
                            {
                                content = "您没有核销的权限";
                            }
                            else
                            {
                                if (pay.IsVerify)
                                {
                                    content = "订单:" + tradeno + "已经核销";
                                }
                                else
                                {
                                    pay.IsVerify = true;
                                    SqlDataProvider.SqlDataProvider.UpdateSee_Pay(pay);
                                    content = "订单:" + tradeno + "核销成功";
                                }
                            }
                        }
                        else
                        {
                            content = "订单:" + tradeno + "不存在";
                        }
                        content += "[" + wx.FromUserName + "]";
                        res = sendTextMessage(wx, content);

                        break;
                    }
                default:
                    string output = "";
                    output = "欢迎关注SeekPetM（觅宠）" + wx.EventKey;
                    res = sendTextMessage(wx, output);
                    break;
            }

            //using (StreamWriter sw = new StreamWriter(Server.MapPath("wx.txt")))
            //{
            //    sw.Write(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + ",参数错误" + res);
            //}
            //WriteToTxt("res:"+res);
            Response.Write(res);
        }

        /// <summary>
        /// 发送文字消息
        /// </summary>
        /// <param name="wx">获取的收发者信息</param>
        /// <param name="content">笑话内容</param>
        /// <returns></returns>
        private string sendTextMessage(wxmessage wx, string content)
        {
            string res = string.Format("<xml><ToUserName><![CDATA[{0}]]></ToUserName><FromUserName><![CDATA[{1}]]></FromUserName><CreateTime>{2}</CreateTime><MsgType><![CDATA[text]]></MsgType><Content><![CDATA[{3}]]></Content><FuncFlag>0</FuncFlag></xml>",
                wx.FromUserName, wx.ToUserName, DateTime.Now, content);
            return res;
        }
        /// <summary>
        /// 获取请求过来的微信信息
        /// </summary>
        /// <returns></returns>
        private wxmessage GetWxMessage()
        {
            try
            {
                wxmessage wx = new wxmessage();
                //StreamReader str = new StreamReader(Request.InputStream, System.Text.Encoding.UTF8);
                Stream s = System.Web.HttpContext.Current.Request.InputStream;
                byte[] b = new byte[s.Length];
                s.Read(b, 0, (int)s.Length);
                string get = Encoding.UTF8.GetString(b);
                if (get == "")
                {
                    return null;
                }
                WriteToTxt("get：" + get);
                XmlDocument xml = new XmlDocument();
                xml.LoadXml(get);
                wx.ToUserName = xml.SelectSingleNode("xml").SelectSingleNode("ToUserName").InnerText;
                wx.FromUserName = xml.SelectSingleNode("xml").SelectSingleNode("FromUserName").InnerText;
                wx.MsgType = xml.SelectSingleNode("xml").SelectSingleNode("MsgType").InnerText;
                wx.CreateTime = int.Parse(xml.SelectSingleNode("xml").SelectSingleNode("CreateTime").InnerText);
                if (xml.SelectSingleNode("xml").SelectSingleNode("EventKey") != null)
                {
                    wx.EventKey = xml.SelectSingleNode("xml").SelectSingleNode("EventKey").InnerText;
                }
                else
                {
                    wx.EventKey = "";
                }
                if (xml.SelectSingleNode("xml").SelectSingleNode("Event") != null)
                {
                    wx.Event = xml.SelectSingleNode("xml").SelectSingleNode("Event").InnerText;
                }
                else
                {
                    wx.Event = "";
                }
                if (xml.SelectSingleNode("xml").SelectSingleNode("Ticket") != null)
                {
                    wx.Ticket = xml.SelectSingleNode("xml").SelectSingleNode("Ticket").InnerText;
                }
                else
                {
                    wx.Ticket = "";
                }
                return wx;
            }
            catch (Exception e)
            {
                WriteToTxt("getmessage异常：" + e.Message);
                return null;
            }
        }

        /// <summary>
        /// 微信认证
        /// </summary>
        private void RenZheng()
        {
            #region 微信认证
            string res = "";
            string token = "52seekpetmi";
            string signature = Request["signature"];
            string timestamp = Request["timestamp"];
            string nonce = Request["nonce"];
            string echostr = Request["echostr"];
            //using (StreamWriter sw = new StreamWriter(Server.MapPath("wx.txt")))
            //{
            //    sw.Write("signature" + signature + ",timestamp" + timestamp + ",nonce" + nonce + ",echostr" + echostr);
            //}
            if (string.IsNullOrEmpty(token) || string.IsNullOrEmpty(signature) || string.IsNullOrEmpty(timestamp) || string.IsNullOrEmpty(nonce) || string.IsNullOrEmpty(echostr))
            {
                WriteToTxt("请求地址：" + Request.Url);
            }
            else
            {
                ArrayList arr = new ArrayList() { token, timestamp, nonce };
                arr.Sort();
                string signature1 = GetSHA1(arr[0].ToString() + arr[1].ToString() + arr[2].ToString());
                if (signature == signature1.ToLower())
                {
                    res = echostr;
                }
                else
                {
                    res = "error";
                }
                WriteToTxt("签名信息：" + res);
                Response.Write(res);
                Response.End();
            }
            #endregion
        }

        /// <summary>
        /// 加密字符串
        /// </summary>
        /// <param name="password"></param>
        /// <returns></returns>
        private string GetSHA1(string password)
        {
            string shh1string = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
            return shh1string;
        }

        /// <summary>
        /// 截取字符串
        /// </summary>
        /// <param name="content"></param>
        /// <param name="length"></param>
        /// <returns></returns>
        private string GetSubString(string content, int length)
        {
            if (content.Length >= length)
            {
                return content.Substring(0, length);
            }
            else
            {
                return content;
            }
        }

        //创建自定义菜单
        public void CreateWxMenu()
        {
            FileStream fs1 = new FileStream(Server.MapPath("\\DesktopModules\\SEEKPET.WxMessage") + "\\menu.txt", FileMode.Open);
            StreamReader sr = new StreamReader(fs1, Encoding.GetEncoding("UTF-8"));
            string menu = sr.ReadToEnd();
            sr.Close();
            fs1.Close();
            WriteToTxt(menu);
            string str = GetPage(string.Format("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={0}&secret={1}",APPID,APPSECRET),"");
            WriteToTxt(str);
            JObject jo = JObject.Parse(str);
            string access_token = jo["access_token"].ToString();
            WriteToTxt(access_token);
            string output=GetPage("https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + access_token + "", menu);
            Response.Write(output);
        }

        private string GetPage(string posturl, string postData)
        {
            Stream outstream = null;
            Stream instream = null;
            StreamReader sr = null;
            HttpWebResponse response = null;
            HttpWebRequest request = null;
            Encoding encoding = Encoding.UTF8;
            byte[] data = encoding.GetBytes(postData);
            // 准备请求...
            try
            {
                // 设置参数
                request = WebRequest.Create(posturl) as HttpWebRequest;
                CookieContainer cookieContainer = new CookieContainer();
                request.CookieContainer = cookieContainer;
                request.AllowAutoRedirect = true;
                request.Method = "POST";
                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = data.Length;
                outstream = request.GetRequestStream();
                outstream.Write(data, 0, data.Length);
                outstream.Close();
                //发送请求并获取相应回应数据
                response = request.GetResponse() as HttpWebResponse;
                //直到request.GetResponse()程序才开始向目标网页发送Post请求
                instream = response.GetResponseStream();
                sr = new StreamReader(instream, encoding);
                //返回结果网页（html）代码
                string content = sr.ReadToEnd();
                string err = string.Empty;
                //Response.Write(content);
                return content;
            }
            catch (Exception ex)
            {
                string err = ex.Message;
                return string.Empty;
            }
        }

        private void WriteToTxt(string text)
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
    //自定义一个微信消息实体类
    class wxmessage
    {
        public string FromUserName { get; set; }
        public string ToUserName { get; set; }
        public int CreateTime { get; set; }
        public string MsgType { get; set; }
        public string Event { get; set; }
        public string EventKey { get; set; }
        public string Ticket { get; set; }
    }
}