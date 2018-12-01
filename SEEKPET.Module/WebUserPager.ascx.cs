using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace SEEKPET.Module
{

    ///---------------------------------------------------------------------------
    /// 列表自定义分页通用编码。2010-6-9 14:44:20
    ///---------------------------------------------------------------------------
    public partial class WebUserPager : System.Web.UI.UserControl
    {
        #region Designer Generate Code

        protected System.Web.UI.WebControls.RequiredFieldValidator reqValPageNum;

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitializeComponent();
        }

        private void InitializeComponent()
        {

        }

        #endregion

        #region Properties
        public string LocalResourceFile
        {
            get { return this.TemplateSourceDirectory + "/" + EasySite.Services.Localization.Localization.LocalResourceDirectory + "/WebUserPager.ascx"; }
        }

        public string DataGridAttached
        {
            set { ViewState["DataGridAttached"] = value; }
            get { return ViewState["DataGridAttached"].ToString(); }
        }
        public PeoNormalControl.CustomPagingDataGrid grdInternal
        {
            get { return (PeoNormalControl.CustomPagingDataGrid)this.Parent.FindControl(DataGridAttached); }
        }
        #endregion

        #region Events

        #endregion

        #region Event Handler
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                RefreshUI();
            }
        }
        protected void PagerButton_Click(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "FirstPage":
                    grdInternal.CurrentPageIndex = 0;
                    break;
                case "PreviousPage":
                    grdInternal.CurrentPageIndex--;
                    break;
                case "NextPage":
                    grdInternal.CurrentPageIndex++;
                    break;
                case "LastPage":
                    grdInternal.CurrentPageIndex = Int32.MaxValue - 1;
                    break;
                case "Go":
                    if (this.txtPageNum.Text.Length > 0) grdInternal.CurrentPageIndex = Int32.Parse(txtPageNum.Text) - 1;
                    else return;
                    break;
            }
            grdInternal.BindData();
            RefreshUI();
        }

        public void RefreshUI()
        {
            if (grdInternal.PageCount < 2)
            {
                this.lbtnFirstPage.Enabled = false;
                this.lbtnNextPage.Enabled = false;
                this.lbtnPreviousPage.Enabled = false;
                this.lbtnLastPage.Enabled = false;
                this.lbtnGoto.Enabled = false;
                this.txtPageNum.Enabled = false;
            }
            else
            {
                this.lbtnFirstPage.Enabled = true;
                this.lbtnNextPage.Enabled = true;
                this.lbtnPreviousPage.Enabled = true;
                this.lbtnLastPage.Enabled = true;
                this.lbtnGoto.Enabled = true;
                this.txtPageNum.Enabled = true;
                if (grdInternal.CurrentPageIndex == 0)
                {

                    this.lbtnFirstPage.Enabled = false;
                    this.lbtnPreviousPage.Enabled = false;
                }
                else if (grdInternal.CurrentPageIndex == grdInternal.PageCount - 1)
                {
                    this.lbtnNextPage.Enabled = false;
                    this.lbtnLastPage.Enabled = false;
                }

            }
            this.lblPageInfo.Text = grdInternal.PageSummaryInfo;
        }
        #endregion
    }
}