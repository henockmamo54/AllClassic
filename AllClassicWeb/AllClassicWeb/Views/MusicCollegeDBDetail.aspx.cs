using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessP;
using BusinessLogic;

namespace AllClassicWeb.Views
{
    public partial class MusicCollegeDBDetail : Page
    {
        static int collegeID;
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            if (Request.QueryString["ID"] != null)
                collegeID = int.Parse(Request.QueryString["ID"]);
            CollegeTbl college = BusinessLogic.CollegeLogic.getCollegeByID(collegeID);

            if (college != null)
            {
                profileImage.ImageUrl = "../Doc/College/" + college.CollegePhoto;
                txt_name.Text = college.Name;
                txt_shortname.Text = college.ShortName;
                txt_homepage.CommandArgument = college.HomePage;
                txt_homepage.Text = college.HomePage;
                txt_country.Text = college.Country;
                txt_introduction.Text = college.Introduction;
                txt_locationmap.Text = college.LocationMap;
                txt_locationmap.CommandArgument = college.LocationMap;


                if (user != null)
                {
                    if (user.UserID == college.UserID || user.IsMasterUser == 1) { btn_editcollege.Visible = true; btn_deletecollege.Visible = true; }
                    else { btn_editcollege.Visible = false; btn_deletecollege.Visible = false; }
                }
                else
                {
                    btn_editcollege.Visible = false; btn_deletecollege.Visible = false;
                }

                //var b = new UriBuilder(college.HomePage);
                //txt_homepage.PostBackUrl = b.ToString();
            }
        }

        public void onclick_btn_editcollege(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                collegeID = int.Parse(Request.QueryString["ID"]);
                Session["MusicCollegeID"] = collegeID;
                Session["updateMusicCollege"] = true;
                Response.Redirect("MusicCollegeDBAddNew.aspx");

            }
        }

        protected void LinkButton_Click(Object sender, CommandEventArgs e)
        {

            string strURL = e.CommandArgument.ToString();
            var b = new UriBuilder(strURL);
            var s = "openInNewTab('" + b.ToString() + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", s, true);

            //Response.Redirect(b.ToString());
        }


        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeleteMusicCollege(int n)
        {
            return CollegeLogic.DeleteMusician(collegeID);
        }


    }
}