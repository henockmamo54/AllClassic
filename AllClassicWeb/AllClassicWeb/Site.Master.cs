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

            updateActivePageLink(pageName);

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

        private void updateActivePageLink(string pagename)
        {
            // clean all tabs 
            hometab.Style.Add("color", "#0a1621");
            hometab.Style.Add("font-weight", "400");

            artisttab.Style.Add("color", "#0a1621");
            artisttab.Style.Add("font-weight", "400");

            performancetab.Style.Add("color", "#0a1621");
            performancetab.Style.Add("font-weight", "400");

            performancegrouptab.Style.Add("color", "#0a1621");
            performancegrouptab.Style.Add("font-weight", "400");

            agoratab.Style.Add("color", "#0a1621");
            agoratab.Style.Add("font-weight", "400");

            ClassicCointab.Style.Add("color", "#0a1621");
            ClassicCointab.Style.Add("font-weight", "400");

            performanceArchivetab.Style.Add("color", "#0a1621");
            performanceArchivetab.Style.Add("font-weight", "400");

            aboutustab.Style.Add("color", "#0a1621");
            aboutustab.Style.Add("font-weight", "400");

            switch (pagename)
            {
                case "ASP.default_aspx":
                    hometab.Style.Add("color", "#f2c852");
                    hometab.Style.Add("font-weight", "bold");
                    break;

                case "ASP.views_musiciandb_aspx":
                    artisttab.Style.Add("color", "#f2c852");
                    artisttab.Style.Add("font-weight", "bold");
                    break;

                case "ASP.views_performancedb_aspx":
                    performancetab.Style.Add("color", "#f2c852");
                    performancetab.Style.Add("font-weight", "bold");
                    break;

                case "ASP.views_performancegroup_aspx":
                    performancegrouptab.Style.Add("color", "#f2c852");
                    performancegrouptab.Style.Add("font-weight", "bold");
                    break;

                #region agora links
                // agora pages 
                case "ASP.views_auditiondb_aspx":
                    agoratab.Style.Add("color", "#f2c852");
                    agoratab.Style.Add("font-weight", "bold");
                    break;
                case "ASP.views_concoursdb_aspx":
                    agoratab.Style.Add("color", "#f2c852");
                    agoratab.Style.Add("font-weight", "bold");
                    break;
                case "ASP.views_repairshopdb_aspx":
                    agoratab.Style.Add("color", "#f2c852");
                    agoratab.Style.Add("font-weight", "bold");
                    break;
                case "ASP.views_musicshopdb_aspx":
                    agoratab.Style.Add("color", "#f2c852");
                    agoratab.Style.Add("font-weight", "bold");
                    break;
                case "ASP.views_concertvenudb_aspx":
                    agoratab.Style.Add("color", "#f2c852");
                    agoratab.Style.Add("font-weight", "bold");
                    break;
                case "ASP.views_peopleandjobdb_aspx":
                    agoratab.Style.Add("color", "#f2c852");
                    agoratab.Style.Add("font-weight", "bold");
                    break;
                case "ASP.views_qadbnew_aspx":
                    agoratab.Style.Add("color", "#f2c852");
                    agoratab.Style.Add("font-weight", "bold");
                    break;
                // agora pages end 
                #endregion

                case "ASP.views_classiccoindb_aspx":
                    ClassicCointab.Style.Add("color", "#f2c852");
                    ClassicCointab.Style.Add("font-weight", "bold");
                    break;
                case "ASP.views_performancearchivedb_aspx":
                    performanceArchivetab.Style.Add("color", "#f2c852");
                    performanceArchivetab.Style.Add("font-weight", "bold");
                    break;

                case "ASP.views_aboutus_aspx":
                    aboutustab.Style.Add("color", "#f2c852");
                    aboutustab.Style.Add("font-weight", "bold");
                    break;


            }



            if (pagename == "") { }
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