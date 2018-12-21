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
        static int PerformanceGroupID;
        string homepageurl;
        static UserTbl user;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];

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

                if (user != null)
                {
                    if (user.UserID == pg.UserID || user.IsMasterUser == 1) { btn_editpg.Visible = true; btn_delete.Visible = true; }
                    else { btn_editpg.Visible = false; btn_delete.Visible = false; }
                }
                else { btn_editpg.Visible = false; btn_delete.Visible = false; }

            }
        }


        protected void LinkButton_Click(Object sender, CommandEventArgs e)
        {

            string strURL = homepageurl;
            if (strURL.Length != 0)
            {
                var b = new UriBuilder(strURL);
                var s = "openInNewTab('" + b.ToString() + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", s, true);
            }
            else showMsg("Homepage is not available!!");

            //Response.Redirect(b.ToString());
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
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
        
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeletePerfromanceGroup(int n)
        {
            return PerformanceGroupLogic.deletePerformanceGroup(PerformanceGroupID);
        }



    }
}