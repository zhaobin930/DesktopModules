using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEEKPET.Info;

namespace SEEKPET.Module
{
    public partial class AnimalDetail : EasySite.Entities.Modules.PortalModuleBase
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
            //根据UserID获取宠物信息
            See_AnimalInfo info = SqlDataProvider.SqlDataProvider.GetInfoSee_AnimalInfoByUserID(this.UserId);
            if (info != null)
            {
                lblNo.Text = info.No;
                lblName.Text = info.Name;
                lblSex.Text = info.Sex;
                lblKind.Text = info.Kind;
                lblAge.Text = info.Age;
                lblColor.Text = info.Color;
                lblDescription.Text = info.Description;
                imPicture.ImageUrl="/Portals/SEEKPETInfo/"+info.Picture;
            }
        }
    }
}