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
    public partial class PerformanceGroupAddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void btn_pg_cancel_Click(object sender, EventArgs e)
        {

        }
        public void btn_pg_save_Click(object sender, EventArgs e)
        {

        }

        public void btn_pg_add_Click(object sender, EventArgs e)
        {
            try
            {
                PerformanceGroupTbl pg = new PerformanceGroupTbl();
                pg.Name = txt_pgname.Text;
                pg.Alias = txt_alias.Text;
                pg.GroupType = int.Parse(DropDownList1_grouptype.SelectedValue.ToString());
                pg.City = int.Parse(DropDownList1_city.SelectedValue.ToString());
                pg.Conductor = txt_coductor.Text;
                pg.SinceYear = txt_sinceyear.Text;
                pg.EmailID = txt_email.Text;
                pg.Address = txt_address.Text;
                pg.ZipCode = txt_zipcode.Text;
                pg.TelNo = txt_telno.Text;
                pg.FaxNo = txt_faxno.Text;
                pg.HomePage = txt_homepage.Text;
                pg.UserID = 5;
                pg.UpdateTimeStamp = DateTime.Now;

                pg =BusinessLogic.PerformanceGroupLogic.addPerformanceGroup(pg);
                if (pg != null)
                {
                    showMsg("Data inserted succssfuly");
                    cleanPGTextBoxs();                    
                }
                else showMsg("Please check your inputs");
            }
            catch (Exception ee) {

            }
        }

        private void cleanPGTextBoxs()
        {
            txt_pgname.Text = "";
            txt_alias.Text = "";
            txt_coductor.Text = "";
            txt_sinceyear.Text = "";
            txt_email.Text = "";
            txt_address.Text = "";
            txt_zipcode.Text = "";
            txt_telno.Text = "";
            txt_faxno.Text = "";
            txt_homepage.Text = "";
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

    }
}