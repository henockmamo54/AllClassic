using BusinessLogic;
using DataAccessP;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class Mypage : System.Web.UI.Page
    {
        public static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);

            if (!IsPostBack)
            {
                user = (UserTbl)Session["User"];
                if (user != null) loaduserdata(user);
            }
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeleteUserByID(int userID) {

            HttpContext.Current.Session["User"] = null;
            //Response.Redirect("~/Views/PerformanceDb.aspx");
            return UserLogic.DeactiveUser(user);
        }

        public void loaduserdata(UserTbl user)
        {
            user= UserLogic.getusertByID(user.UserID);

            txt_email.Text = user.EmailID;
            txt_password.Text = user.Password;
            txt_name.Text = user.FullName;
            txt_nickname.Text = user.NickName;
            txt_mobile.Text = user.MobileNo;
            txt_facebookurl.Text = user.Facebook;
            txt_twitterurl.Text = user.Twitter;
            txt_kakaotalkid.Text = user.KakaoTalk;
            txt_othersns.Text = user.OtherSNS;
            txt_affilation.Text = user.Affliation;
            if (user.Birthday != null) txt_birthday.Text = ((DateTime)user.Birthday).ToShortDateString();
            txt_zipcode.Text = user.ZipCode;
            txt_address.Text = user.Address;


            uemail.Text = user.EmailID;
            upassword.Text = user.Password;
            uname.Text = user.FullName;
            unickname.Text = user.NickName;
            umobile.Text = user.MobileNo;
            ufacebookurl.Text = user.Facebook;
            utwitterurl.Text = user.Twitter;
            ukakaotalkid.Text = user.KakaoTalk;
            uothersns.Text = user.OtherSNS;
            uaffilation.Text = user.Affliation;
            if (user.Birthday != null) userBirthDate.Value = ((DateTime)user.Birthday).ToShortDateString();
            uzipcode.Text = user.ZipCode;
            uaddress.Text = user.Address;

            var usertypes = user.UserUserTypes.ToList();
            var usertypesconcatinated = "";

            foreach (var usertype in usertypes)
            {
                if (usertype.UserTypeTbl.TypeName == "Composer") { chk_composer.Checked = true; usertypesconcatinated += Resources.DisplayText.Composer+", "; }
                if (usertype.UserTypeTbl.TypeName == "Conductor") { chk_conductor.Checked = true; usertypesconcatinated += Resources.DisplayText.Conductor + ", "; }
                if (usertype.UserTypeTbl.TypeName == "TeacherProfessor") { chk_professor.Checked = true; usertypesconcatinated += Resources.DisplayText.TeacherProfessor + ", "; }
                if (usertype.UserTypeTbl.TypeName == "ProMusician") { chk_promusician.Checked = true; usertypesconcatinated += Resources.DisplayText.ProMusician + ", "; }
                if (usertype.UserTypeTbl.TypeName == "Student") { chk_student.Checked = true; usertypesconcatinated += Resources.DisplayText.Student + ", "; }
                if (usertype.UserTypeTbl.TypeName == "AmatureMusician") { chk_amaturemusician.Checked = true; usertypesconcatinated += Resources.DisplayText.AmatureMusician + ", "; }
                if (usertype.UserTypeTbl.TypeName == "Reporter") { chk_reporter.Checked = true; usertypesconcatinated += Resources.DisplayText.Reporter + ", "; }
                if (usertype.UserTypeTbl.TypeName == "ClassicMania") { chk_classicmani.Checked = true; usertypesconcatinated += Resources.DisplayText.ClassicMania + ", "; }
                if (usertype.UserTypeTbl.TypeName == "Blogger") { chk_blogger.Checked = true; usertypesconcatinated += Resources.DisplayText.Blogger + ", "; }
                if (usertype.UserTypeTbl.TypeName == "AdmistraterOfPerformanceGroup") { chk_adminofPerformanceGroup.Checked = true; usertypesconcatinated += Resources.DisplayText.AdmistraterOfPerformanceGroup + ", "; }
                if (usertype.UserTypeTbl.TypeName == "AdmistraterOfPromoter") { chk_adminofpromotor.Checked = true; usertypesconcatinated += Resources.DisplayText.AdmistraterOfPromoter + ", "; }
                if (usertype.UserTypeTbl.TypeName == "AdmistraterOfAgent") { chk_adminofagent.Checked = true; usertypesconcatinated += Resources.DisplayText.AdmistraterOfAgent + ", "; }
                if (usertype.UserTypeTbl.TypeName == "AdmistraterOfOrganizer") { chk_adminoforganizer.Checked = true; usertypesconcatinated += Resources.DisplayText.AdmistraterOfOrganizer + ", "; }
                if (usertype.UserTypeTbl.TypeName == "ShopOwner") { chk_shopowner.Checked = true; usertypesconcatinated += Resources.DisplayText.ShopOwner + ", "; }
                if (usertype.UserTypeTbl.TypeName == "Others") { chk_other.Checked = true; usertypesconcatinated += Resources.DisplayText.Other + ", "; }
            }
            txt_usertype.Text = usertypesconcatinated.Substring(0,usertypesconcatinated.Length-2);


        }



        public void btn_cancel_click(object sender, EventArgs e)
        {
            loaduserdata(user);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "activaTab2", "activaTab('menu2');", true);
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        public void cleanUserTextBoxs()
        {
            uemail.Text = "";
            upassword.Text = "";
            uname.Text = "";
            unickname.Text = "";
            umobile.Text = "";
            ufacebookurl.Text = "";
            utwitterurl.Text = "";
            ukakaotalkid.Text = "";
            uothersns.Text = "";
            uaffilation.Text = "";
            uzipcode.Text = "";
            uaddress.Text = "";
        }

        //=============================================================================================

        protected void btn_reguserInfo_click(object sender, EventArgs e)
        {
            //get all user types
            List<int> usertypes = new List<int>();
            if (chk_composer.Checked) usertypes.Add(1);
            if (chk_conductor.Checked) usertypes.Add(2);
            if (chk_professor.Checked) usertypes.Add(3);
            if (chk_promusician.Checked) usertypes.Add(4);
            if (chk_student.Checked) usertypes.Add(5);
            if (chk_amaturemusician.Checked) usertypes.Add(6);
            if (chk_reporter.Checked) usertypes.Add(8);
            if (chk_classicmani.Checked) usertypes.Add(7);
            if (chk_adminofPerformanceGroup.Checked) usertypes.Add(10);
            if (chk_adminofpromotor.Checked) usertypes.Add(11);
            if (chk_adminofagent.Checked) usertypes.Add(12);
            if (chk_adminoforganizer.Checked) usertypes.Add(13);
            if (chk_shopowner.Checked) usertypes.Add(14);
            if (chk_blogger.Checked) usertypes.Add(9);
            if (chk_other.Checked) usertypes.Add(15);

            if (usertypes.Count == 0)
            {
                showMsg("Please Select User Type!!");
                return;
            }

            /////// first insert user email and password into user common table
            /////// insert user types into userusertable 
            /////// 

            //update user
            UserTbl u = new UserTbl();
            u.UserID = user.UserID;
            u.PosterEmailID = uemail.Text;
            u.UpdateTimeStamp = DateTime.Now;
            u.EmailID = uemail.Text;
            u.Password = upassword.Text;
            u.FullName = uname.Text;
            u.NickName = unickname.Text;
            u.MobileNo = umobile.Text;
            u.Facebook = ufacebookurl.Text;
            u.Twitter = utwitterurl.Text;
            u.KakaoTalk = ukakaotalkid.Text;
            u.OtherSNS = uothersns.Text;
            u.Affliation = uaffilation.Text;

            try
            {
                u.Birthday = DateTime.ParseExact(userBirthDate.Value, "mm/dd/yyyy", CultureInfo.InvariantCulture);
            }
            catch (Exception eeee) { }
            u.ZipCode = uzipcode.Text;
            u.Address = uaddress.Text;

            //login in the user
            UserLogic.Result result = UserLogic.updateUser(usertypes, u);
            bool issuccess = result.user != null;
            if (issuccess)
            {
                showMsg("data inserted succssfuly");
                Session["user"] = result.user;
                loaduserdata(result.user);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "activaTab1", "activaTab('menu1');", true);
            }
            else
            {
                showMsg(result.exception.Message.Substring(0, 30));

                ScriptManager.RegisterStartupScript(this, this.GetType(), "activaTab1", "activaTab('menu2');", true);
            }
        }



        //===================================================================================


    }
}