using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Data.SqlClient;
using SEEKPET.Info;
using WxPayAPI;

namespace SEEKPET.Module
{
    public partial class HospitalList : EasySite.Entities.Modules.PortalModuleBase
    {
        private string SuccessURL
        {
            get
            {
                object obj = Settings["SuccessURL"];
                if (obj != null && !obj.ToString().Trim().Equals(""))
                {
                    return obj.ToString();
                }
                else
                {
                    return "http://www.seekpetm.xin/tabid/80/default.aspx";
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            string city = "北京市";
            if (Request.Cookies["city"] != null)
            {
                city = Server.UrlDecode(Request.Cookies["city"].Value).Trim();
            }
            string filter = " par1='" + city + "'";
            int page = 1;
            if (Request.QueryString["page"] != null)
                page = int.Parse(Request.QueryString["page"].ToString());

            DataTable dt = SqlHelper.ExecuteDataset(EasySite.Common.Utilities.Config.GetConnectionString(), CommandType.StoredProcedure, "Pager_List",
         new SqlParameter("@Tables", "See_Hospital"),
         new SqlParameter("@PK", "ID"),
         new SqlParameter("@Sort", ""),
         new SqlParameter("@isAscending", "1"),
         new SqlParameter("@PageNumber", page),
         new SqlParameter("@PageSize", AspNetPager1.PageSize),
         new SqlParameter("@Fields", "*"),
         new SqlParameter("@Filter", filter),
         new SqlParameter("@Group", "")).Tables[0];

            AspNetPager1.RecordCount = SqlDataProvider.SqlDataProvider.GetSee_HospitalCount(filter);
            AspNetPager1.CurrentPageIndex = page;

            reList.DataSource = dt;
            reList.DataBind();

        }

        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            BindData();
        }

        protected void btnVxPay_Click(object sender, EventArgs e)
        {
            if (hidhospital.Value != "" && this.UserId > 0)
            {
                pa1.Visible = false;
                pa2.Visible = true;
                //绑定支付条目
                string sql = "select * from lists where listname='SeekPetPayItem' order by sortorder";
                DataTable da = SqlDataProvider.SqlDataProvider.GetSQLTable(sql);
                rePayList.DataSource = da;
                rePayList.DataBind();
                //int sumprice = 100;
                //int sumprice = int.Parse((float.Parse(da.Compute("sum([cast([value] as float)])", "1=1").ToString()) * 100).ToString());
                var p = (from DataRow record in da.Rows
                         select double.Parse(record["value"].ToString())).Sum();
                int sumprice = Convert.ToInt32(p*100);
                lblSumPrice.Text = p.ToString();

                int hospitalid = int.Parse(hidhospital.Value);
                string returnurl = SuccessURL;
                //订单号
                string tradeno = "XP" + DateTime.Now.ToString("yyyyMMddHHmmssfff");
                returnurl += "?tradeno=" + tradeno;

                int cost = sumprice;
                //插入订单支付数据,生成订单
                See_Pay pay = new See_Pay();
                pay.UserID = this.UserId;
                pay.UserSign = "";
                pay.IsPay = false;
                pay.TradeNo = tradeno;
                pay.HospitalID = hospitalid;
                pay.CostMoney = cost;
                pay.CreateTime = DateTime.Now;
                pay.IsVerify = false;
                SqlDataProvider.SqlDataProvider.InsertSee_Pay(pay);
                //支付链接
                H5Pay h5pay = new H5Pay(Page);
                h5pay.total_fee = pay.CostMoney;
                WxPayData data= h5pay.GetUnifiedOrderResult(pay.TradeNo);
                lblresult.Text = data.ToPrintStr();
                hyFinishPay.NavigateUrl = returnurl;
                btnsubmit.NavigateUrl = data.GetValue("mweb_url").ToString() + "&redirect_url=" + Server.UrlEncode(returnurl) ;
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('支付出错！');</script>");
            }
            
        }
    }
}