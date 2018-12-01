using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEEKPET.Info;

namespace SEEKPET.Module
{
    public partial class AnimalLoss :EasySite.Entities.Modules.PortalModuleBase
    {
        private Int32 AnmialID
        {
            get { return Convert.ToInt32(ViewState["AnmialID"]); }
            set { ViewState["AnmialID"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (AnmialID > 0)
            {
                See_Loss obj = new See_Loss();
                obj.AnmialID = AnmialID;
                obj.LossContent = txtLossInfo.Text;
                SqlDataProvider.SqlDataProvider.InsertSee_Loss(obj);
                Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('提交成功！');window.location.href=window.location.href;</script>");
            }
        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            if (txtCode.Text != "")
            {
                AnmialID = 0;
                See_Code info = SqlDataProvider.SqlDataProvider.GetInfoSee_CodeByCode(txtCode.Text);
                if (info != null)
                {
                    int userid = info.UserID;
                    See_AnimalInfo objSee_AnimalInfo = SqlDataProvider.SqlDataProvider.GetInfoSee_AnimalInfoByUserID(userid);
                    if (objSee_AnimalInfo != null)
                    {
                        paDetail.Visible = true;
                        paSeach.Visible = false;
                        AnmialID = objSee_AnimalInfo.ID;
                        lblNo.Text = objSee_AnimalInfo.No.ToString();
                        lblName.Text = objSee_AnimalInfo.Name.ToString();
                        lblSex.Text = objSee_AnimalInfo.Sex.ToString();
                        lblKind.Text = objSee_AnimalInfo.Kind.ToString();
                        lblAge.Text = objSee_AnimalInfo.Age.ToString();
                        lblColor.Text = objSee_AnimalInfo.Color.ToString();
                        lblDescription.Text = objSee_AnimalInfo.Description.ToString();
                        lblIsImmune.Text = objSee_AnimalInfo.IsImmune ? "已绝育" : "未绝育";
                        imgPicture.ImageUrl = "/Portals/SEEKPETInfo/" + objSee_AnimalInfo.Picture.ToString();
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('未绑定！');</script>");
                    }
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "resultTip", "<script>alert('信息不存在！');</script>");
                }
            }
        }
    }
}