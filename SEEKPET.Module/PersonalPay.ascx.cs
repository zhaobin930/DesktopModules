using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEEKPET.Module
{
    public partial class PersonalPay : EasySite.Entities.Modules.PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.grdList.SqlFilterString = "IsPay=1 and UserID="+this.UserId;
                this.grdList.BindData();
            }
        }

        protected string GetQrCodeURL(string ticket)
        {
            return String.Format("https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket={0}", ticket);
        }

        protected void grdList_ItemCommand(object source, DataGridCommandEventArgs e)
        {

        }

        protected void grdList_ItemDataBound(object sender, DataGridItemEventArgs e)
        {

        }
    }
}