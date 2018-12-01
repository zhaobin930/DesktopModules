using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEEKPET.Info;

namespace SEEKPET.Module
{
    public partial class CodeEdit : EasySite.Entities.Modules.PortalModuleBase
    {

        #region " --------------- 常用变量 --------------- "
        //主键ID 
        private Int32 ItemID
        {
            get { return Convert.ToInt32(ViewState["ItemID"]); }
            set { ViewState["ItemID"] = value; }
        }
        #endregion

        #region " --------------- 基本方法 --------------- "
        /// <summary>
        /// 页面加载事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        #region protected void Page_Load(object sender, EventArgs e)
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsPostBack == false)
                {
                    //返回上级页面链接 
                    if ((Request.UrlReferrer != null))
                    {
                        hlkExit.NavigateUrl = Request.UrlReferrer.ToString();
                    }
                    else
                    {
                        hlkExit.NavigateUrl = EasySite.Common.Globals.NavigateURL();
                    }

                    //当前信息主键ID 
                    ItemID = EasySite.Common.Utilities.Null.NullInteger;
                    if ((Request.Params["ItemId"] != null))
                    {
                        ItemID = Int32.Parse(Request.Params["ItemId"]);
                    }

                    //编辑操作判断处理 
                    if (ItemID > 0)
                    {
                        if (BindInfo(ItemID) == false)
                        {
                            //主键错误返回上级页面 
                            Response.Redirect(hlkExit.NavigateUrl, true);
                        }
                    }
                }
            }
            catch (Exception exc)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
        #endregion

        /// <summary>
        /// 绑定数据
        /// </summary>
        /// <param name="PKID"></param>
        /// <returns></returns>
        #region private bool BindInfo(int PKID)
        private bool BindInfo(int PKID)
        {
            bool isReturl = true;

            //实体基类 
            See_Code objSee_Code = new See_Code();

            //以主键查询数据 
            objSee_Code = SqlDataProvider.SqlDataProvider.GetInfoSee_Code(PKID);
            if ((objSee_Code != null))
            {
                //加载绑定数
                txtCode.Text = objSee_Code.Code.ToString();
            }
            else
            {
                //错误主键 
                isReturl = false;
            }

            return isReturl;
        }
        #endregion

        /// <summary>
        /// 日期判断函数
        /// </summary>
        /// <param name="strDate"></param>
        /// <returns></returns>
        #region public static bool IsDate(string strDate)
        public static bool IsDate(string strDate)
        {
            DateTime dtDate;
            bool bValid = true;
            try
            {
                dtDate = DateTime.Parse(strDate);
            }
            catch (FormatException)
            {
                bValid = false;
            }
            return bValid;
        }
        #endregion

        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        #region protected void cmdCommand_Click(object sender, EventArgs e)
        protected void cmdCommand_Click(object sender, EventArgs e)
        {
            try
            {
                See_Code objSee_Code = new See_Code();
                if (ItemID > 0)
                {
                    objSee_Code = SqlDataProvider.SqlDataProvider.GetInfoSee_Code(ItemID);
                }
                //绑定更新数据信息
                objSee_Code.Code = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtCode.Text);
                if (!EasySite.Common.Utilities.Null.IsNull(ItemID))
                {
                    SqlDataProvider.SqlDataProvider.UpdateSee_Code(objSee_Code);
                }
                else
                {
                    SqlDataProvider.SqlDataProvider.InsertSee_Code(objSee_Code);
                }
                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('提交成功！');window.location.href='" + hlkExit.NavigateUrl + "';</script>");
            }
            catch (Exception exc)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
        #endregion
        #endregion
    }
}
	