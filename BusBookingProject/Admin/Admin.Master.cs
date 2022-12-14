using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.LocalPath;

            if (url == "/Admin/AdminLogin.aspx") return;
            if (!String.IsNullOrEmpty((string)Session["AdminUserName"])) return;

            Response.Redirect("/Admin/AdminLogin.aspx");
        }
        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            Session.Remove("AdminUserName");
            Response.Redirect("/Admin/AdminLogin.aspx");
        }
    }
}