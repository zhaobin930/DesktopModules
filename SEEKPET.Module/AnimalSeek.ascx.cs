using SEEKPET.Info;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEEKPET.Module
{
    public partial class AnimalSeek : EasySite.Entities.Modules.PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                See_Seek objSee_Seek = new See_Seek();
                EasySite.Common.Utilities.CBO.InitializeObject(objSee_Seek, typeof(See_Seek));

                //绑定更新数据信息
                objSee_Seek.Kind = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtKind.Text);
                objSee_Seek.Feature = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtFeature.Text);
                objSee_Seek.LossPlace = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtLossPlace.Text);
                objSee_Seek.Pay = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPay.Text);
                objSee_Seek.Contract = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtContract.Text);
                if (chkHasCode.Checked)
                {
                    objSee_Seek.XinNo = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtCode.Text);
                }
                else
                {
                    objSee_Seek.XinNo = "";
                }
                if (Request.Cookies["city"] != null)
                {
                    objSee_Seek.City =Server.UrlDecode(Request.Cookies["city"].Value).Trim();
                }
                else
                {
                    objSee_Seek.City = "北京市";
                }
                objSee_Seek.Par1 = hidImgName.Value;
                objSee_Seek.CreateTime = DateTime.Now;

                //objSee_Seek.Par1 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar1.Text);
                //objSee_Seek.Par2 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar2.Text);
                SqlDataProvider.SqlDataProvider.InsertSee_Seek(objSee_Seek);
                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('提交成功！');window.location.href=window.location.href;</script>");

            }
            catch (Exception exc)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
    }
}