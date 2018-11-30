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

            if (!IsPostBack)
            {
                handleButtons(true);
                if (Session["updateConcours"] != null)
                {
                    if (Boolean.Parse(Session["updateConcours"].ToString()) == true)
                    {
                        handleButtons(false);
                        var Concour = ConcoursLogic.getConcourByID(int.Parse(Session["ConcoursID"].ToString()));
                        Session["selectedConcour"] = Concour;
                        txt_title.Text = Concour.Title;
                        txt_organizer.Text = Concour.Organizer;
                        //txt_auditionoutline.Text = Concour.AuditionOutline;
                        datetimepicker2.Value = Concour.FromDate.ToShortDateString();
                        datetimepicker3.Value = Concour.ToDate.ToShortDateString();
                        txt_outline.Text = Concour.ConcourOutline;
                    }
                }
            }
        }


        public void btn_concours_cancel_Click(object sender, EventArgs e)
        {
            Session["updateConcours"] = null;
            txt_title.Text = "";
            txt_organizer.Text = "";
            txt_outline.Text = "";

            datetimepicker2.Value = null;
            datetimepicker3.Value = null;
            handleButtons(true);
        }

        public void btn_concours_save_Click(object sender, EventArgs e)
        {
            try
            {
                ConcourTbl c = (ConcourTbl)Session["selectedConcour"];
                c.Organizer = txt_organizer.Text;
                c.Title = txt_title.Text;
                c.FromDate = DateTime.ParseExact(datetimepicker2.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                c.ToDate = DateTime.ParseExact(datetimepicker3.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                c.ConcourOutline = txt_outline.Text;
                c.UpdateTimeStamp = DateTime.Now;
                c.UserID = 5;

                c = BusinessLogic.ConcoursLogic.updateConcours(c);
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
        
        public void handleButtons(Boolean value)
        {
            btn_concours_add.Visible = value;
            btn_concours_save.Visible = !value;
        }




    }
}