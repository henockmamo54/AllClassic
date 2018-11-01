using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = Session["User"];
            if (user == null) { signinLink.Visible = true; signoutLink.Visible = false; }
            if (user != null)
            {
                signinLink.Visible = false; signoutLink.Visible = true;
                //mypageLink.Visible = true;
            }

        }

        protected void changeLanguageToKr(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["CultureInfo"];

            if (cookie != null && cookie.Value != null)
            {
                cookie.Value = "ko-KR";

            }
            else
            {
                cookie = new HttpCookie("CultureInfo");
                cookie.Value = "ko-KR";

            }

            Response.Cookies.Add(cookie);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(cookie.Value);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(cookie.Value);
            CultureInfo.CurrentCulture = CultureInfo.CreateSpecificCulture(cookie.Value);
            Response.Redirect(Request.RawUrl);

        }
        protected void changeLanguageToEng(object sender, EventArgs e)
        {

            HttpCookie cookie = Request.Cookies["CultureInfo"];

            if (cookie != null && cookie.Value != null)
            {
                cookie.Value = "en-US";
            }
            else
            {
                cookie = new HttpCookie("CultureInfo");
                cookie.Value = "ko-KR";

            }

            Response.Cookies.Add(cookie);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(cookie.Value);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(cookie.Value);
            CultureInfo.CurrentCulture = CultureInfo.CreateSpecificCulture(cookie.Value);
            Response.Redirect(Request.RawUrl);
        }

        protected void changeLanguage(object sender, EventArgs e)
        {

            HttpCookie cookie = Request.Cookies["CultureInfo"];

            if (cookie != null && cookie.Value != null)
            {
                if (cookie.Value == "ko-KR") cookie.Value = "en-US";
                else if (cookie.Value == "en-US") cookie.Value = "ko-KR";

            }
            else
            {
                cookie = new HttpCookie("CultureInfo");
                cookie.Value = "ko-KR";

            }

            Response.Cookies.Add(cookie);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(cookie.Value);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(cookie.Value);
            CultureInfo.CurrentCulture = CultureInfo.CreateSpecificCulture(cookie.Value);
            Response.Redirect(Request.RawUrl);
        }


        protected void signoutClicked(object sender, EventArgs e)
        {
            Session.Clear();
            Session["User"] = null;
            Response.Redirect("~/Views/HomeView.aspx");
        }

    }
}