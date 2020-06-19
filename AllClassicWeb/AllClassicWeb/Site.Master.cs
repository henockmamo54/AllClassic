using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessP;

namespace AllClassicWeb
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageName = this.MainContent.Page.GetType().FullName;
#if DEBUG
            Console.WriteLine("pageName:" + pageName);
#endif

            var user = Session["User"];
            if (user == null) { signinLink.Visible = true; signupLink.Visible = true; signoutLink.Visible = false; mypagetab.Visible = false; }
            if (user != null)
            {
                signinLink.Visible = false; signupLink.Visible = false; signoutLink.Visible = true; mypagetab.Visible = true;

                try { if (((UserTbl)user).IsMasterUser == 1) lookupmanagementtab.Visible = true; }
                catch (Exception ee)
                {

                }
                //mypageLink.Visible = true;
            }

        }

        public void searchClicked(object sender, EventArgs e)
        {
            var endcodestring = encodedSearchvalue.Value;
            Response.Redirect("~/Views/SearchEngineResult.aspx?query=" + searchbox.Text);
        }

        protected void changecolor(object sender, CommandEventArgs e)
        {
            Session["Theme"] = e.CommandArgument;
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
            Response.Redirect("~/Views/PerformanceDB.aspx");
        }

    }
}