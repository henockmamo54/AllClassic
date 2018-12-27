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
    public partial class PasswordReset : System.Web.UI.Page
    {
        int ID;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void submitButton_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
                ID = int.Parse(Request.QueryString["ID"]);
            AllClassicDBEntities entities = new AllClassicDBEntities();
            UserTbl user = entities.UserTbls.Where(x => x.UserID == ID).FirstOrDefault();

            if (user != null)
            {
                try
                {
                    user.Password = passwordTextBox.Text;
                    entities.SaveChanges();
                    Session["User"] = user;
                    showMsg_withredirect("Password reseted successfully");

                    //Response.Redirect("~/Views/PerformanceDB.aspx");
                }
                catch (Exception ee)
                {
                    showMsg("Password not reseted.Please Contact the admins.");
                }
            }
            else showMsg("Password not reseted.Please Contact the admins.");

        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        public void showMsg_withredirect(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "'); location.href='PerformanceDB.aspx'", true);
        }
    }
}