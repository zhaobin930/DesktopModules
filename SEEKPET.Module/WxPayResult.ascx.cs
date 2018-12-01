using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WxPayAPI;

namespace SEEKPET.Module
{
    public partial class WxPayResult :EasySite.Entities.Modules.PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string tradeno = "";
                if (Request.QueryString["tradeno"] != null && Request.QueryString["tradeno"].ToString() != "")
                {
                    tradeno = Request.QueryString["tradeno"].ToString();
                }
                if (tradeno != "")
                {
                    if (IsSuccess(tradeno))
                    {
                        lblmessage.Text = "恭喜您支付已成功！";
                        pa1.Visible = true;
                        //string appid = "wx6c838884c52b8bfc";
                        //string appsecret = "3eb854b47e09d3f12400cb5e116b2281";
                        string appid = WxPayConfig.APPID;
                        string appsecret = WxPayConfig.APPSECRET;
                        QrCode code = new QrCode(Page);
                        code.GetAccessToken(appid, appsecret);
                        string ticket = code.GetQrcode(appid, appsecret, tradeno.Replace("XP",""));
                        string url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + ticket;
                        imgCode.ImageUrl = url;
                        //修改支付状态
                        //根据订单号查询订单
                        string sql = string.Format("update See_Pay set ispay=1,ticket='{0}' where Tradeno='{1}'",ticket, tradeno);
                        SqlDataProvider.SqlDataProvider.ExecSQL(sql);
                    }
                    else
                    {
                        pa1.Visible = false;
                        lblmessage.Text = "正在支付中，请前往个人中心查看支付结果";
                    }
                }
                else
                {
                    pa1.Visible = false;
                    lblmessage.Text = "正在支付中，请前往个人中心查看支付结果";
                }

            }
        }

        protected bool IsSuccess(string tradeno)
        {
            #region 测试，直接成功
            //return true;
            #endregion
            bool issuccess = false;
            //根据订单查询是否支付成功
            int succCode=0;
            WxPayData result = H5Pay.Query(tradeno, out succCode);
            

            if (succCode == 1)
            {
                issuccess = true;
            }
            else
            {
                issuccess = false;
            }
            return issuccess;
        }
    }
}