using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEEKPET.Module
{
    public partial class SeekMap : EasySite.Entities.Modules.PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string city = "";
            //if (Request.QueryString["city"] != null && Request.QueryString["city"].ToString() != "")
            //{
            //    HttpCookie cookie = new HttpCookie("city");
            //    cookie.Value = Request.QueryString["city"].ToString();
            //    //cookie.Expires = DateTime.Now.AddHours(1);
            //    cookie.HttpOnly = false;
            //    Response.Cookies.Add(cookie);
            //}
            //if (Request.Cookies["city"] != null)
            //{
            //    city = Request.Cookies["city"].Value;
            //    city = Server.HtmlEncode(city);
            //}
            //if (city != "")
            //{
            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "setcity", "<script>setCity('" + city + "')</script>");
            //}
        }
    }
}