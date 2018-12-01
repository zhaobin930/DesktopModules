using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEEKPET.Info;

namespace SEEKPET.Module
{
    public partial class PersonalDetail : EasySite.Entities.Modules.PortalModuleBase
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
            //根据用户UserID获取主人资料
            See_PersonInfo info = SqlDataProvider.SqlDataProvider.GetInfoSee_PersonInfoByUserID(this.UserId);
            if (info != null)
            {
                lblAge.Text = info.Age;
                lblSex.Text = info.Sex;
                lblProfession.Text = info.Profession;
                lblAddress.Text = info.Address;
            }
        }
    }
}