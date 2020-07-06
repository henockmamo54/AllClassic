using BusinessLogic;
using BusinessLogic.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = inputEmail.Text;
            string password = inputPassword.Text;
            if (username.Length > 0 && password.Length > 0)
            {
                var users = UserLogic.checkUserLoginInfo(username, password);
                if (users.Count > 0)
                {
                    Session["User"] = users[0];
                    Response.Redirect("~/Default.aspx");
                }
                else Label1_warnningmessage.Visible = true;
            }
        }

        protected void Button1_signin_Click1(object sender, EventArgs e)
        {
            string username = inputEmail.Text;
            string password = inputPassword.Text;
            var users = UserLogic.checkUserLoginInfo(username, password);
            if (users.Count > 0)
            {
                Session["User"] = users[0];
                Response.Redirect("~/Default.aspx");
            }
            else Label1_warnningmessage.Visible = true;
        }

        

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool SendPasswordResetEmail(string email)
        {
            new Thread(() =>
            {
                EmailSender.sendPasswordResetEmail(UserLogic.getusertByEmail(email));
            }).Start();

            //HttpContext.Current.Session["User"] = null;
            //Response.Redirect("~/Views/PerformanceDb.aspx");
            return true;
        }

    }

}