using System;
using System.Web.UI;
using DataAccessP;
using BusinessLogic;
using System.Globalization;

namespace AllClassicWeb.Views
{
    public partial class PeopleAndJobDBAddNew : System.Web.UI.Page
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
                if (Session["updatePeopleAndJob"] != null)
                {
                    if (Boolean.Parse(Session["updatePeopleAndJob"].ToString()) == true)
                    {
                        handleButtons(false);
                        PeopleAndJobTbl p = PeopleAndJobLogic.GetPeopleAndJobByID(int.Parse(Session["PeopleAndJobID"].ToString()));
                        Session["selectedPeopleAndJobTbl"] = p;

                        datetimefilter.Value = ((DateTime)p.ValidDate).ToString("dd/MM/yyyy");
                        txt_title.Text = p.Title;
                        txt_email.Text = p.EmailID;
                        txt_telno.Text = p.TelNo;
                        txt_contactname.Text = p.ContactName;
                        //txt_description.Text = p.Description;
                        txt_description.InnerText = Server.HtmlDecode(p.Description);
                        Session["txt_description"] = Server.HtmlDecode(p.Description);
                        DropDownList1_type.Items.FindByValue(p.PeopleOrJob.ToString()).Selected = true;
                    }
                }
            }
        }

        protected void btn_PeopleAndJob_cancel_Click(object sender, EventArgs e)
        {
            datetimefilter.Value = null;
            txt_title.Text = "";
            txt_email.Text = "";
            txt_telno.Text = "";
            txt_description.InnerHtml = "";

            Session["updatePeopleAndJob"] = null;
            handleButtons(true);

            Response.Redirect("~/Views/PeopleAndJobDB.aspx");
        }
        protected void btn_PeopleAndJob_save_Click(object sender, EventArgs e)
        {

            try
            {
                PeopleAndJobTbl r = (PeopleAndJobTbl)Session["selectedPeopleAndJobTbl"];
                r.PeopleOrJob = DropDownList1_type.SelectedItem.Value;
                r.ValidDate = DateTime.ParseExact(datetimefilter.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                r.City = int.Parse(DropDownList3_city.SelectedItem.Value);
                r.Title = txt_title.Text;
                r.ContactName = txt_contactname.Text;
                r.EmailID = txt_email.Text;
                r.TelNo = txt_telno.Text;

                var msg = (HiddenField2.Value);
                Session["txt_description"] = msg; 
                if (msg.Length > 399)
                {
                    showMsg("The description content is more than the specified limit. please  minimize the content of the the outline.");
                    if (Session["txt_auditionoutline"] != null)
                    {
                        txt_description.InnerText = Server.HtmlDecode(Session["txt_description"].ToString());
                    }
                    return;
                }

                r.Description = msg;
                r.UpdateTimeStamp = DateTime.Now;
                r.UserID = user.UserID;

                r = BusinessLogic.PeopleAndJobLogic.updatePeopleAndLogic(r);
                if (r != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");
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

        protected void btn_PeopleAndJob_add_Click(object sender, EventArgs e)
        {
            try
            {
                PeopleAndJobTbl r = new PeopleAndJobTbl();
                r.PeopleOrJob = DropDownList1_type.SelectedItem.Value;
                r.ValidDate = DateTime.ParseExact(datetimefilter.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);                
                r.City = int.Parse(DropDownList3_city.SelectedItem.Value);
                r.Title = txt_title.Text;
                r.ContactName = txt_contactname.Text;
                r.EmailID = txt_email.Text;
                r.TelNo = txt_telno.Text;
                var msg = (HiddenField2.Value);
                Session["txt_description"] = msg;
                if (msg.Length > 399)
                {
                    showMsg("The description content is more than the specified limit. please  minimize the content of the the outline.");
                    if (Session["txt_auditionoutline"] != null)
                    {
                        txt_description.InnerText = Server.HtmlDecode(Session["txt_description"].ToString());
                    }
                    return;
                }

                r.Description = msg;
                r.UpdateTimeStamp = DateTime.Now;
                r.UserID = user.UserID;

                r = BusinessLogic.PeopleAndJobLogic.registerPeopleAndLogic(r);
                if (r != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");
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



        public void handleButtons(Boolean value)
        {
            btn_PeopleAndJob_add.Visible = value;
            btn_PeopleAndJob_save.Visible = !value;
        }



        public void showMsg_withredirect(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "ShowMessage()", true);
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

        protected void DropDownList3_city_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePeopleAndJob"] != null && Boolean.Parse(Session["updatePeopleAndJob"].ToString()) == true)
            {
                try
                {
                    PeopleAndJobTbl p = (PeopleAndJobTbl)Session["selectedPeopleAndJobTbl"];
                    DropDownList3_city.Items.FindByValue(p.City.ToString()).Selected = true;
                }
                catch (Exception ee) { }
            }
        }

        protected void DropDownList1_type_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePeopleAndJob"] != null && Boolean.Parse(Session["updatePeopleAndJob"].ToString()) == true)
            {
                try
                {
                    PeopleAndJobTbl p = (PeopleAndJobTbl)Session["selectedPeopleAndJobTbl"];
                    DropDownList1_type.Items.FindByValue(p.PeopleOrJob.ToString()).Selected = true;
                }
                catch (Exception ee) { }
            }
        }
    }
}