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
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "loadCkEditor", "loadCkEditor();", true);

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
                        datetimepicker2.Value = Concour.FromDate.ToString("MM/dd/yyyy");
                        datetimepicker3.Value = Concour.ToDate.ToString("MM/dd/yyyy");
                        txt_outline.InnerText = Server.HtmlDecode(Concour.ConcourOutline);
                    }
                }
            }
        }


        public void btn_concours_cancel_Click(object sender, EventArgs e)
        {
            Session["updateConcours"] = null;
            txt_title.Text = "";
            txt_organizer.Text = "";
            txt_outline.InnerHtml = "";

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
                //c.ConcourOutline = txt_outline.Text;
                var msg = Server.HtmlEncode(HiddenField2.Value);
                Session["txt_outline"] = msg;
                if (msg.Length > 399)
                {
                    showMsg("The ouline content is more than the specified limit. please  minimize the content of the the outline.");
                    if (Session["txt_outline"] != null)
                    {
                        txt_outline.InnerText = Server.HtmlDecode(Session["txt_outline"].ToString());
                    }
                    return;
                }
                c.ConcourOutline = msg;

                c.UpdateTimeStamp = DateTime.Now;
                c.UserID = user.UserID;

                c = BusinessLogic.ConcoursLogic.updateConcours(c);
                if (c != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");
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
                if (Session["txt_outline"] != null)
                {
                    txt_outline.InnerText = Server.HtmlDecode(Session["txt_outline"].ToString());
                }
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
                //c.ConcourOutline = txt_outline.Text;
                var msg = Server.HtmlEncode(HiddenField2.Value);
                Session["txt_outline"] = msg;
                if (msg.Length > 399)
                {
                    showMsg("The ouline content is more than the specified limit. please  minimize the content of the the outline.");
                    if (Session["txt_outline"] != null)
                    {
                        txt_outline.InnerText = Server.HtmlDecode(Session["txt_outline"].ToString());
                    }
                    return;
                }
                c.ConcourOutline = msg;

                c.UpdateTimeStamp = DateTime.Now;
                c.UserID = user.UserID;

                c = BusinessLogic.ConcoursLogic.registerConcours(c);
                if (c != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");
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
                if (Session["txt_outline"] != null)
                {
                    txt_outline.InnerText = Server.HtmlDecode(Session["txt_outline"].ToString());
                }
            }

        }


        public void showMsg_withredirect(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "ShowMessage()", true);
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