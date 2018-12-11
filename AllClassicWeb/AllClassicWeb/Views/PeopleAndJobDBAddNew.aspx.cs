using System;
using System.Web.UI;
using DataAccessP;
using BusinessLogic;
using System.Globalization;

namespace AllClassicWeb.Views
{
    public partial class PeopleAndJobDBAddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);
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

                        datetimefilter.Value = ((DateTime)p.ValidDate).ToShortDateString();
                        txt_title.Text = p.Title;
                        txt_email.Text = p.EmailID;
                        txt_telno.Text = p.TelNo;
                        txt_description.Text = p.Description;
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
            txt_description.Text = "";

            Session["updatePeopleAndJob"] = null;
            handleButtons(true);
        }
        protected void btn_PeopleAndJob_save_Click(object sender, EventArgs e)
        {

            try
            {
                PeopleAndJobTbl r = (PeopleAndJobTbl)Session["selectedPeopleAndJobTbl"];
                r.PeopleOrJob = DropDownList1_type.SelectedItem.Value;
                r.ValidDate = DateTime.ParseExact(datetimefilter.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                r.City = int.Parse(DropDownList3_city.SelectedItem.Value);
                r.Title = txt_title.Text;
                r.ContactName = txt_contactname.Text;
                r.EmailID = txt_email.Text;
                r.TelNo = txt_telno.Text;
                r.Description = txt_description.Text;
                r.UpdateTimeStamp = DateTime.Now;
                r.UserID = 5;

                r = BusinessLogic.PeopleAndJobLogic.updatePeopleAndLogic(r);
                if (r != null)
                {
                    showMsg("Data inserted succssfuly");
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
                r.ValidDate = DateTime.ParseExact(datetimefilter.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);                
                r.City = int.Parse(DropDownList3_city.SelectedItem.Value);
                r.Title = txt_title.Text;
                r.ContactName = txt_contactname.Text;
                r.EmailID = txt_email.Text;
                r.TelNo = txt_telno.Text;
                r.Description = txt_description.Text;                
                r.UpdateTimeStamp = DateTime.Now;
                r.UserID = 5;

                r = BusinessLogic.PeopleAndJobLogic.registerPeopleAndLogic(r);
                if (r != null)
                {
                    showMsg("Data inserted succssfuly");
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