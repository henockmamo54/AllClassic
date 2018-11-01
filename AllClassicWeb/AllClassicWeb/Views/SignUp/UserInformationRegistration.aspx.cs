using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace AllClassicWeb.Views.SignUp
{
    public partial class UserInformationRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btn_cancel_click(object sender, EventArgs e)
        {
            //Response.Redirect("~/Views/HomeView.aspx");
            cleanUserTextBoxs();
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

            /////// first insert user email and password into user common table
            /////// insert user types into userusertable
            /////// finally insert company info
            /////// 

            bool isSuccess = false;
            using (var context = new AllClassicDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        //register user
                        UserTbl user = new UserTbl();
                        user.EmailID = uemail.Text;
                        user.Password = upassword.Text;
                        user.FullName = uname.Text;
                        user.NickName = unickname.Text;
                        user.MobileNo = umobile.Text;
                        user.Facebook = ufacebookurl.Text;
                        user.Twitter = utwitterurl.Text;
                        user.KakaoTalk = ukakaotalkid.Text;
                        user.OtherSNS = uothersns.Text;
                        if (DropDownList1_youraffilation.SelectedValue==null || int.Parse(DropDownList1_youraffilation.SelectedValue) == -1)
                            user.Affliation = uaffilation.Text;
                        else user.Affliation = DropDownList1_youraffilation.SelectedItem.Text;
                        user.Birthday = DateTime.ParseExact(userBirthDate.Value, "dd/mm/yyyy", CultureInfo.InvariantCulture);
                        user.ZipCode = uzipcode.Text;
                        user.Address = uaddress.Text;

                        context.UserTbls.Add(user);
                        context.SaveChanges();

                        // register  user types
                        foreach (int i in usertypes)
                        {
                            DataAccess.UserUserType type = new UserUserType();
                            type.UserID = user.UserID;
                            type.UserTypeID = i;

                            context.UserUserTypes.Add(type);
                            context.SaveChanges();
                        }

                        dbContextTransaction.Commit();
                        isSuccess = true;
                        //login in the user
                        Session["User"] = user;

                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();

                    }

                    if (isSuccess)
                    {
                        showMsg("Data inserted succssfuly");
                        //Response.Redirect("~/Views/HomeView.aspx");
                    }
                    else showMsg("Please check your inputs");
                }
            }

        }

        //===================================================================================

    }
}