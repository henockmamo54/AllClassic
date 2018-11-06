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
    public partial class PerformanceGroupDetail : System.Web.UI.Page
    {
        int PerformanceGroupID;
        string homepageurl;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PGID"] != null)
                PerformanceGroupID = int.Parse(Request.QueryString["PGID"]);
            PerformanceGroupTbl pg = BusinessLogic.PerformanceGroupLogic.getPerformanceGroupByID(PerformanceGroupID);

            if (pg != null)
            {
                txt_name.Text = pg.Name;
                txt_alias.Text = pg.Alias;
                txt_grouptype.Text = pg.LookUpTbl.SubCode;
                txt_city.Text = pg.LookUpTbl1.SubCode;
                txt_conductor.Text = pg.Conductor;
                txt_sinceyear.Text = pg.SinceYear;
                txt_email.Text = pg.EmailID;
                txt_address.Text = pg.Address;
                txt_zipcode.Text = pg.ZipCode;
                txt_telno.Text = pg.TelNo;
                txt_fax.Text = pg.FaxNo;
                //txt_homepageurl.Text = pg.HomePage;
                homepageurl = pg.HomePage;
            }
        }


        public void onclick_btn_editpg(object sender, EventArgs e)
        {
            if (Request.QueryString["PGID"] != null)
            {
                PerformanceGroupID = int.Parse(Request.QueryString["PGID"]);
                Session["PerformanceGroupID"] = PerformanceGroupID;
                Session["updatePerformanceGroup"] = true;
                Response.Redirect("PerformanceGroupAddNew.aspx");
            }
        }

    }
}