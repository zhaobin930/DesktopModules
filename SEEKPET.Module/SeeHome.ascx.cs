using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Data.SqlClient;

namespace SEEKPET.Module
{
    public partial class SeeHome : EasySite.Entities.Modules.PortalModuleBase
    {
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
            string filter = " city='" + city + "'";
            int page = 1;
            if (Request.QueryString["page"] != null)
                page = int.Parse(Request.QueryString["page"].ToString());

            DataTable dt = SqlHelper.ExecuteDataset(EasySite.Common.Utilities.Config.GetConnectionString(), CommandType.StoredProcedure, "Pager_List",
         new SqlParameter("@Tables", "See_Seek"),
         new SqlParameter("@PK", "ID"),
         new SqlParameter("@Sort", "createtime"),
         new SqlParameter("@isAscending", "1"),
         new SqlParameter("@PageNumber", page),
         new SqlParameter("@PageSize", AspNetPager1.PageSize),
         new SqlParameter("@Fields", "*"),
         new SqlParameter("@Filter", filter),
         new SqlParameter("@Group", "")).Tables[0];

            AspNetPager1.RecordCount = SqlDataProvider.SqlDataProvider.GetSee_SeekCount(filter);
            AspNetPager1.CurrentPageIndex = page;

            reList.DataSource = dt;
            reList.DataBind();
            if (AspNetPager1.RecordCount == 0)
            {
                AspNetPager1.Visible = false;
            }

        }

        protected void AspNetPager1_PageChanged(object src, EventArgs e)
        {
            BindData();
        }
    }
}