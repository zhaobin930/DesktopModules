using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEEKPET.Info;

namespace SEEKPET.Module
{
    public partial class HospitalEdit : EasySite.Entities.Modules.PortalModuleBase
    {
        #region " --------------- 常用变量 --------------- "
        //主键ID 
        private Int32 ItemID
        {
            get { return Convert.ToInt32(ViewState["ItemID"]); }
            set { ViewState["ItemID"] = value; }
        }
        #endregion

        string _filedir = "/Portals/SEEKPETInfo/";
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
            See_Hospital objSee_Hospital = new See_Hospital();

            //以主键查询数据 
            objSee_Hospital = SqlDataProvider.SqlDataProvider.GetInfoSee_Hospital(PKID);
            if ((objSee_Hospital != null))
            {
                //加载绑定数
                txtHospitalName.Text = objSee_Hospital.HospitalName.ToString();
                txtAddress.Text = objSee_Hospital.Address.ToString();
                //txtCoorX.Text = objSee_Hospital.CoorX.ToString();
                //txtCoorY.Text = objSee_Hospital.CoorY.ToString();
                imgShow.Src = _filedir + objSee_Hospital.Picture.ToString();
                hidImgName.Value = objSee_Hospital.Picture.ToString();
                txtDescription.Text = objSee_Hospital.Description.ToString();
                //绑定城市
                Page.ClientScript.RegisterStartupScript(Page.ClientScript.GetType(), "myscript", "<script>setvalue('"+objSee_Hospital.Par1+"');</script>");
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
        /// 保存
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        #region protected void cmdCommand_Click(object sender, EventArgs e)
        protected void cmdCommand_Click(object sender, EventArgs e)
        {
            try
            {
                See_Hospital objSee_Hospital = new See_Hospital();
                EasySite.Common.Utilities.CBO.InitializeObject(objSee_Hospital, typeof(See_Hospital));

                //绑定更新数据信息
                objSee_Hospital.ID = ItemID;
                objSee_Hospital.HospitalName = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtHospitalName.Text);
                objSee_Hospital.Address = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtAddress.Text);
                objSee_Hospital.Picture = hidImgName.Value;
                objSee_Hospital.Description = PeoNormalControl.CommonClass.Utility.ReplaceSepChars(txtDescription.Text);
                objSee_Hospital.Par1 = hidcity.Value;
                if (!EasySite.Common.Utilities.Null.IsNull(ItemID))
                {
                    SqlDataProvider.SqlDataProvider.UpdateSee_Hospital(objSee_Hospital);
                    //EasySite.UI.Skins.Skin.AddModuleMessage(this, "更新成功", EasySite.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
                }
                else
                {
                    SqlDataProvider.SqlDataProvider.InsertSee_Hospital(objSee_Hospital);
                    //EasySite.UI.Skins.Skin.AddModuleMessage(this, "添加成功", EasySite.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
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