using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEEKPET.Info;

namespace SEEKPET.Module
{
    public partial class PersonalInfoEdit : EasySite.Entities.Modules.PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    BindInfo();
                }
            }
            catch (Exception exc)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, exc);
            }
        }


        protected void BindInfo()
        {
            //实体基类 
            See_PersonInfo objSee_PersonInfo = new See_PersonInfo();

            //以主键查询数据 
            objSee_PersonInfo = SqlDataProvider.SqlDataProvider.GetInfoSee_PersonInfoByUserID(this.UserId);
            if ((objSee_PersonInfo != null))
            {
                //加载绑定数
                //txtName.Text = objSee_PersonInfo.Name.ToString();
                txtAge.Text = objSee_PersonInfo.Age.ToString();
                ddlSex.SelectedValue = objSee_PersonInfo.Sex.ToString();
                txtProfession.Text = objSee_PersonInfo.Profession.ToString();
                txtAddress.Text = objSee_PersonInfo.Address.ToString();
                //if (objSee_PersonInfo.Code != "")
                //{
                //    chkHasCode.Checked = true;
                //    txtCode.Enabled = false;
                //}
                //txtCode.Text = objSee_PersonInfo.Code.ToString();

                //txtPar1.Text = objSee_PersonInfo.Par1.ToString();
                //txtPar2.Text = objSee_PersonInfo.Par2.ToString();
                //txtPar3.Text = objSee_PersonInfo.Par3.ToString();
                //txtPar4.Text = objSee_PersonInfo.Par4.ToString();
                //txtPar5.Text = objSee_PersonInfo.Par5.ToString();

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                {
                    return;
                }
                //if (chkHasCode.Checked)
                //{
                //    //判断code
                //    See_Code objcode = SqlDataProvider.SqlDataProvider.GetInfoSee_CodeByCode(txtCode.Text);
                //    if (objcode != null)
                //    {
                //        if (objcode.UserID > 0 && objcode.UserID != this.UserId)
                //        {
                //            Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('芯片编码已使用！');</script>");
                //            return;
                //        }
                //    }
                //    else
                //    {
                //        Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('芯片编码不存在！');</script>");
                //        return;
                //    }
                //}

                See_PersonInfo objSee_PersonInfo = new See_PersonInfo();
                EasySite.Common.Utilities.CBO.InitializeObject(objSee_PersonInfo, typeof(See_PersonInfo));

                //绑定更新数据信息

                objSee_PersonInfo.UserID = this.UserId;
                //objSee_PersonInfo.Name = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtName.Text);
                objSee_PersonInfo.Age = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtAge.Text);
                objSee_PersonInfo.Sex = ddlSex.SelectedValue;
                objSee_PersonInfo.Profession = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtProfession.Text);
                objSee_PersonInfo.Address = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtAddress.Text);
                //objSee_PersonInfo.Code = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtCode.Text);

                objSee_PersonInfo.CreateTime = DateTime.Now;
                //objSee_PersonInfo.Par1 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar1.Text);
                //objSee_PersonInfo.Par2 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar2.Text);
                //objSee_PersonInfo.Par3 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar3.Text);
                //objSee_PersonInfo.Par4 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar4.Text);
                //objSee_PersonInfo.Par5 = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtPar5.Text);
                SqlDataProvider.SqlDataProvider.InsertOrUpdateSee_PersonInfo(objSee_PersonInfo);
                //if (chkHasCode.Checked && txtCode.Text != "")
                //{
                //    SqlDataProvider.SqlDataProvider.UpdateSee_CodeInfoByCode(UserId, txtCode.Text);
                //}
                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('提交成功！');window.location.href=window.location.href;</script>");
            }
            catch (Exception exc)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
    }
}