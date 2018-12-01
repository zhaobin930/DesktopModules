using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEEKPET.Module
{
    public partial class HospitalManage : EasySite.Entities.Modules.PortalModuleBase, EasySite.Entities.Modules.IActionable
    {

        #region  --------------- 设置活动按钮 ---------------
        public EasySite.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                EasySite.Entities.Modules.Actions.ModuleActionCollection Actions = new EasySite.Entities.Modules.Actions.ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), EasySite.Services.Localization.Localization.GetString(EasySite.Entities.Modules.Actions.ModuleActionType.AddContent, this.LocalResourceFile), EasySite.Entities.Modules.Actions.ModuleActionType.AddContent, "", "", this.EditUrl("Edit"), false, EasySite.Security.SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
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
                //新增链接
                this.cmdAdd.NavigateUrl = EditUrl();

                if (!IsPostBack)
                {
                    //绑定主键
                    this.grdList.DataKeyField = this.grdList.SqlPK;
                }
            }
            catch (Exception ex)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);
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
        /// 搜索
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        #region protected void cmdSearch_Click(object sender, ImageClickEventArgs e)
        protected void cmdSearch_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                //如果要设置日期搜索范围，如下示例
                string strOtherFilter = "1=1";
                if (txtHospitalName.Text != "") strOtherFilter += " And HospitalName like '%" + txtHospitalName.Text + "%'";
                this.grdList.SqlFilterString = strOtherFilter;
                this.grdList.BindData();
                wuPager.RefreshUI();
            }
            catch (Exception exc)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
        #endregion

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        #region protected void cmdDelete_Click(object sender, EventArgs e)
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sbIDs = new System.Text.StringBuilder();
            System.Web.UI.HtmlControls.HtmlInputCheckBox chk;
            foreach (DataGridItem item in this.grdList.Items)
            {
                chk = item.Cells[0].Controls[1] as System.Web.UI.HtmlControls.HtmlInputCheckBox;
                if (chk != null && chk.Checked)
                {
                    if (sbIDs.Length > 0) sbIDs.Append(",");
                    sbIDs.Append(this.grdList.DataKeys[item.ItemIndex]);
                }
            }
            if (sbIDs.Length > 0)
            {
                SqlDataProvider.SqlDataProvider.DeleteSee_Hospitals(sbIDs.ToString());
                //EasySite.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("DeleteSuccess"), EasySite.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);

                grdList.BindData();
                wuPager.RefreshUI();
            }
        }
        #endregion

        /// <summary>
        /// 列表项选择删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        #region protected void grdList_ItemDataBound(object sender, DataGridItemEventArgs e)
        protected void grdList_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.EditItem)
            {
                ((LinkButton)e.Item.FindControl("lbnDelInfo")).Attributes.Add("onclick", String.Format("javascript:return confirm('{0}');", EasySite.Services.Localization.Localization.GetString("DeleteItem")));
            }
        }
        #endregion

        /// <summary>
        /// DataGridItem事件。
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        #region protected void grdList_ItemCommand(object source, DataGridCommandEventArgs e)
        protected void grdList_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            switch (e.CommandName.ToLower())
            {
                case "commanddelete":
                    SqlDataProvider.SqlDataProvider.DeleteSee_Hospitals(grdList.DataKeys[e.Item.ItemIndex].ToString());
                    break;
            }
            grdList.BindData();
            wuPager.RefreshUI();
        }
        #endregion

        #endregion
    }
}