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
    public partial class PeopleAndJobDBAddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);
        }

        protected void btn_PeopleAndJob_cancel_Click(object sender, EventArgs e)
        {

        }

        protected void btn_PeopleAndJob_add_Click(object sender, EventArgs e)
        {
            try
            {
                PeopleAndJobTbl r = new PeopleAndJobTbl();
                r.PeopleOrJob = DropDownList1_type.SelectedItem.Text;
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


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }
    }
}