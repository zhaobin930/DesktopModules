using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEEKPET.Info;

namespace SEEKPET.Module
{
    public partial class HelpDetail : EasySite.Entities.Modules.PortalModuleBase
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
        private void Page_Load(object sender, System.EventArgs e)
        {
            try
            {
                if (!IsPostBack)
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

            //数据访问层 
            See_Help objSee_Help = new See_Help();
            //实体基类 

            //以主键查询数据 
            objSee_Help = SqlDataProvider.SqlDataProvider.GetInfoSee_Help(PKID);
            if ((objSee_Help != null))
            {
                //加载绑定数据 
                lblFeature.Text = objSee_Help.Feature.ToString();
                lblAddress.Text = objSee_Help.Address.ToString();
                lblPay.Text = objSee_Help.Pay.ToString();
                lblDescription.Text = objSee_Help.Description.ToString();
                imgPicture.ImageUrl = "/Portals/SEEKPETInfo/" + objSee_Help.Picture.ToString();
                if (!EasySite.Common.Utilities.Null.IsNull(objSee_Help.CreateTime))
                {
                    lblCreateTime.Text = Convert.ToDateTime(objSee_Help.CreateTime).ToShortDateString();
                }
            }
            else
            {
                //错误主键 
                isReturl = false;
            }

            return isReturl;
        }
        #endregion

        #endregion
    }
}