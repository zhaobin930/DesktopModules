using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EasySite.Entities.Modules;

namespace SEEKPET.Module
{
    public partial class HospitalListSettings : EasySite.Entities.Modules.ModuleSettingsBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public override void UpdateSettings()
        {
            try
            {

                ModuleController objModules = new ModuleController();
                objModules.UpdateTabModuleSetting(TabModuleId, "SuccessURL", txtSuccessURL.Text);
            }
            catch (Exception ex)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);
            }
        }

        public override void LoadSettings()
        {
            try
            {
                if ((string)TabModuleSettings["SuccessURL"] != null)
                {
                    if ((string)TabModuleSettings["SuccessURL"].ToString() != "")
                    {
                        txtSuccessURL.Text = TabModuleSettings["SuccessURL"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                EasySite.Services.Exceptions.Exceptions.ProcessModuleLoadException(this, ex);
            }
        }
    }

}