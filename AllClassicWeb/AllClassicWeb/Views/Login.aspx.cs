using BusinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
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

    }

}