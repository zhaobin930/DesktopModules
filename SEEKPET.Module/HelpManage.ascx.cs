using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEEKPET.Module
{
    public partial class HelpManage : EasySite.Entities.Modules.PortalModuleBase
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
                string strOtherFilter = "1=1";
                if (IsDate(txtStartDate.Text)) strOtherFilter += " And CreateTime>='" + Convert.ToDateTime(txtStartDate.Text).ToShortDateString() + "'";
                if (IsDate(txtEndDate.Text)) strOtherFilter += " And CreateTime<='" + Convert.ToDateTime(txtEndDate.Text).ToShortDateString() + "'";
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
                    SqlDataProvider.SqlDataProvider.DeleteSee_Helps(grdList.DataKeys[e.Item.ItemIndex].ToString());
                    break;
            }
            grdList.BindData();
            wuPager.RefreshUI();
        }
        #endregion

        #endregion
    }
}