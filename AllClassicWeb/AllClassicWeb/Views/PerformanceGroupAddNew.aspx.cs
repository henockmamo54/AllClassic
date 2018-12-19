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
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            if (!IsPostBack)
            {
                if (Session["updatePerformanceGroup"] != null)
                {
                    handleButtons(true);
                    if (Boolean.Parse(Session["updatePerformanceGroup"].ToString()) == true)
                    {
                        try
                        {
                            handleButtons(false);
                            loadPerformanceGroupInfo(int.Parse(Session["PerformanceGroupID"].ToString()));
                        }
                        catch (Exception loaingexception) { }
                    }
                }
            }
        }

        private void loadPerformanceGroupInfo(int id)
        {
            PerformanceGroupTbl pg = BusinessLogic.PerformanceGroupLogic.getPerformanceGroupByID(id);
            if (pg != null)
            {
                txt_pgname.Text = pg.Name;
                txt_alias.Text = pg.Alias;
                //pg.GroupType = int.Parse(DropDownList1_grouptype.SelectedValue.ToString());
                //pg.City = int.Parse(DropDownList1_city.SelectedValue.ToString());
                txt_coductor.Text = pg.Conductor;
                txt_sinceyear.Text = pg.SinceYear;
                txt_email.Text = pg.EmailID;
                txt_address.Text = pg.Address;
                txt_zipcode.Text = pg.ZipCode;
                txt_telno.Text = pg.TelNo;
                txt_faxno.Text = pg.FaxNo;
                txt_homepage.Text = pg.HomePage;
            }
        }

        private void handleButtons(bool value)
        {
            btn_pg_add.Visible = value;
            btn_pg_save.Visible = !value;
        }

        public void btn_pg_cancel_Click(object sender, EventArgs e)
        {
            txt_pgname.Text = "";
            txt_alias.Text = "";
            //pg.GroupType = int.Parse(DropDownList1_grouptype.SelectedValue.ToString());
            //pg.City = int.Parse(DropDownList1_city.SelectedValue.ToString());
            txt_coductor.Text = "";
            txt_sinceyear.Text = "";
            txt_email.Text = "";
            txt_address.Text = "";
            txt_zipcode.Text = "";
            txt_telno.Text = "";
            txt_faxno.Text = "";
            txt_homepage.Text = "";

            handleButtons(true);
        }
        public void btn_pg_save_Click(object sender, EventArgs e)
        {
            int PGID = int.Parse(Session["PerformanceGroupID"].ToString());
            PerformanceGroupTbl pg = BusinessLogic.PerformanceGroupLogic.getPerformanceGroupByID(PGID);

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
            pg.UserID = user.UserID;
            pg.UpdateTimeStamp = DateTime.Now;

            pg = BusinessLogic.PerformanceGroupLogic.UpdatePerformanceGroupTbl(pg);
            if (pg != null)
            {
                showMsg_withredirect("Data Saved succssfuly");
                //cleanPGTextBoxs();
                //Response.Redirect("PerformanceGroupDetail?PGID=" + pg.PerformanceGroupID);
            }
            else showMsg("Please check your inputs");
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
                pg.UserID = user.UserID;
                pg.UpdateTimeStamp = DateTime.Now;

                pg = BusinessLogic.PerformanceGroupLogic.addPerformanceGroup(pg);
                if (pg != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");
                    cleanPGTextBoxs();
                }
                else showMsg("Please check your inputs");
            }
            catch (Exception ee)
            {

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
            handleButtons(true);
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        public void showMsg_withredirect(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "ShowMessage()", true);
        }

        protected void DropDownList1_grouptype_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePerformanceGroup"] != null && Boolean.Parse(Session["updatePerformanceGroup"].ToString()) == true)
            {
                int id = int.Parse(Session["PerformanceGroupID"].ToString());
                PerformanceGroupTbl pg = pg = PerformanceGroupLogic.getPerformanceGroupByID(id);
                if (pg != null)
                    DropDownList1_grouptype.Items.FindByValue(pg.GroupType.ToString()).Selected = true;
            }
        }

        protected void DropDownList1_city_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePerformanceGroup"] != null && Boolean.Parse(Session["updatePerformanceGroup"].ToString()) == true)
            {
                int id = int.Parse(Session["PerformanceGroupID"].ToString());
                PerformanceGroupTbl pg = pg = PerformanceGroupLogic.getPerformanceGroupByID(id);
                if (pg != null)
                    DropDownList1_city.Items.FindByValue(pg.City.ToString()).Selected = true;
            }
        }
    }
}