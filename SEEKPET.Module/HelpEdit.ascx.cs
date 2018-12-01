using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEEKPET.Info;

namespace SEEKPET.Module
{
    public partial class HelpEdit : EasySite.Entities.Modules.PortalModuleBase
    {
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

                }
            }
            catch (Exception exc)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, exc);
            }
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
                See_Help objSee_Help = new See_Help();
                objSee_Help.Feature = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtFeature.Text);
                objSee_Help.Address = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtAddress.Text);
                //objSee_Help.Pay = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPay.Text);
                objSee_Help.Description = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtDescription.Text);
                objSee_Help.Picture = hidImgName.Value;
                objSee_Help.CreateTime = DateTime.Now;
                SqlDataProvider.SqlDataProvider.InsertSee_Help(objSee_Help);
                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('提交成功！');window.location.href=window.location.href;</script>");
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