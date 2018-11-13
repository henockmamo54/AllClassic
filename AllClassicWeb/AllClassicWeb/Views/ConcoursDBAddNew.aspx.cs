using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessP;
using BusinessLogic;
using System.Globalization;

namespace AllClassicWeb.Views
{
    public partial class ConcoursDBAddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);
        }


        public void btn_concours_cancel_Click(object sender, EventArgs e)
        {
           
        }

        public void btn_concours_save_Click(object sender, EventArgs e)
        {

        }

        public void btn_concours_add_Click(object sender, EventArgs e)
        {
            try {
                ConcourTbl c = new ConcourTbl();
                c.Organizer = txt_organizer.Text;
                c.Title = txt_title.Text;
                c.FromDate= DateTime.ParseExact(datetimepicker2.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                c.ToDate= DateTime.ParseExact(datetimepicker3.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                c.ConcourOutline = txt_outline.Text;
                c.UpdateTimeStamp = DateTime.Now;
                c.UserID = 5;

                c = BusinessLogic.ConcoursLogic.registerConcours(c);
                if (c != null)
                {
                    showMsg("Data inserted succssfuly");
                    //issuccess = true;
                }
                else
                {
                    showMsg("Please check your inputs");
                }
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }

        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }





    }
}