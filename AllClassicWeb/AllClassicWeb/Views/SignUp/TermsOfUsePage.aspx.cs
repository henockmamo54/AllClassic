using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views.SignUp
{
    public partial class TermsOfUsePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btn_continueclicked(object sender, EventArgs e)
        {

            bool termsofUse = CheckBox1_terms.Checked;
            bool privacy = CheckBox1_privacy.Checked;

            if (termsofUse && privacy) Response.Redirect("UserInformationRegistrationPage.aspx");
            else showMsg("Please check the terms of use and privacy policy");
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

    }
}