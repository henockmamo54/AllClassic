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
    public partial class AuditionDBAddNew : System.Web.UI.Page
    {
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "loadCkEditor", "loadCkEditor();", true);

            //if (Session["txt_auditionoutline"] != null)
            //{
            //    txt_auditionoutline.InnerText = Session["txt_auditionoutline"].ToString();
            //}

            if (!IsPostBack)
            {
                handleButtons(true);
                if (Session["updateAudition"] != null)
                {
                    if (Boolean.Parse(Session["updateAudition"].ToString()) == true)
                    {
                        handleButtons(false);
                        var audition = AuditionLogic.getAuditonByID(int.Parse(Session["AuditionID"].ToString()));
                        Session["selectedAudition"] = audition;
                        txt_title.Text = audition.Title;
                        txt_organizer.Text = audition.Organizer;

                        txt_auditionoutline.InnerText = Server.HtmlDecode(audition.AuditionOutline);
                        Session["txt_auditionoutline"] = Server.HtmlDecode(audition.AuditionOutline);

                        datetimepicker2.Value = audition.FromDate.ToString("dd/MM/yyyy");
                        datetimepicker3.Value = audition.ToDate.ToString("dd/MM/yyyy");
                    }
                }
            }

        }

        public void onclick_btn_addnewAudition(object sender, EventArgs e)
        {
            try
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "getValueFromHtmlEditor", "getValueFromHtmlEditor();", true);

                AuditionTbl audition = new AuditionTbl();
                audition.Organizer = txt_organizer.Text;
                audition.Title = txt_title.Text;
                audition.FromDate = DateTime.ParseExact(datetimepicker2.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                audition.ToDate = DateTime.ParseExact(datetimepicker3.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                audition.UpdateTimeStamp = DateTime.Now;

                var msg = (HiddenField2.Value);
                Session["txt_auditionoutline"] = msg;
                //audition.AuditionOutline = txt_auditionoutline.InnerHtml;
                if (msg.Length > 999)
                {
                    showMsg("The ouline content is more than the specified limit. please  minimize the content of the the outline.");
                    if (Session["txt_auditionoutline"] != null)
                    {
                        txt_auditionoutline.InnerText = Server.HtmlDecode(Session["txt_auditionoutline"].ToString());
                    }
                    return;
                }
                audition.AuditionOutline = msg;
                audition.UserID = user.UserID;

                audition = BusinessLogic.AuditionLogic.regesterAudtionTbl(audition);
                if (audition != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");

                    //Response.Redirect("~/Views/AuditionDB");
                }
                else
                {
                    showMsg("Please check your inputs");
                }
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
                if (Session["txt_auditionoutline"] != null)
                {
                    txt_auditionoutline.InnerText = Server.HtmlDecode(Session["txt_auditionoutline"].ToString());
                }
            }
        }


        public void handleButtons(Boolean value)
        {
            btn_addnewAudition.Visible = value;
            btn_saveAudition.Visible = !value;
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }
        public void showMsg_withredirect(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "ShowMessage()", true);
        }

        public void onclick_btn_UpdatenewAudition(object sender, EventArgs e)
        {

            try
            {


                AuditionTbl audition = new AuditionTbl();
                audition.AuditionID = int.Parse(Session["AuditionID"].ToString());
                audition.Organizer = txt_organizer.Text;
                audition.Title = txt_title.Text;
                audition.FromDate = DateTime.ParseExact(datetimepicker2.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                audition.ToDate = DateTime.ParseExact(datetimepicker3.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                audition.UpdateTimeStamp = DateTime.Now;

                var msg = (HiddenField2.Value);
                Session["txt_auditionoutline"] = msg;
                //audition.AuditionOutline = txt_auditionoutline.InnerHtml;
                if (msg.Length > 999) {
                    showMsg("The ouline content is more than the specified limit. please  minimize the content of the the outline.");
                    if (Session["txt_auditionoutline"] != null)
                    {
                        txt_auditionoutline.InnerText = Server.HtmlDecode(Session["txt_auditionoutline"].ToString());
                    }
                    return;
                }
                audition.AuditionOutline = msg;
                audition.UserID = user.UserID;
                audition = BusinessLogic.AuditionLogic.updateAudtionTbl(audition);
                if (audition != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");

                }
                else
                {
                    showMsg("Please check your inputs");
                    if (Session["txt_auditionoutline"] != null)
                    {
                        txt_auditionoutline.InnerText = Server.HtmlDecode(Session["txt_auditionoutline"].ToString());
                    }
                }
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }

        }

        public void btn_cancelclicked(object sender, EventArgs e)
        {
            txt_organizer.Text = "";
            txt_title.Text = "";
            datetimepicker2.Value = null;
            datetimepicker3.Value = null;
            txt_auditionoutline.InnerText = "";
            Session["updateAudition"] = null;
            handleButtons(true);
        }

    }
}