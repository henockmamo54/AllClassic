using DataAccessP;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class MusicCollegeDB : System.Web.UI.Page
    {
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];

        }

        protected void onclick_btn_addMusicCollege(object sender, EventArgs e)
        {
            if (user != null)
            {
                Session["MusicCollegeID"] = null;
                Session["updateMusicCollege"] = false;
                Response.Redirect("MusicCollegeDBAddNew.aspx");
            }
            else showMsg(Resources.DisplayText.Pleasesignintocontinue);
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

        public void CollegeDBClicked(object sender, CommandEventArgs e)
        {
            var collegeID = e.CommandArgument.ToString();
            Response.Redirect("MusicCollegeDBDetail?ID=" + collegeID);
        }

        public void onclick_headertableItem(object sender, CommandEventArgs e)
        {
            var collegeID = e.CommandArgument.ToString();
            Response.Redirect("MusicCollegeDBDetail?ID=" + collegeID);
        }

        public void selectedFilterChanged(object sender, EventArgs e)
        {
            var filterQuery = "";
            if (DropDownList1_countryfilter.SelectedIndex != 0) filterQuery += " where country like N'%" + DropDownList1_countryfilter.SelectedItem.Value + "%'";
            if (txtbox_namefilter.Text.ToString().Length > 0)
            {
                if (DropDownList1_countryfilter.SelectedIndex != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " Name like N'%" + txtbox_namefilter.Text.ToString() + "%'";
            }
            if (txtbox_shortnamefilter.Text.ToString().Length > 0)
            {
                if (DropDownList1_countryfilter.SelectedIndex != 0 || txtbox_namefilter.Text.ToString().Length > 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " ShortName like N'%" + txtbox_shortnamefilter.Text + "%'";
            }

            SqlDataSource1_Collegelist.SelectCommand = string.Format(@"select * from Main.CollegeTbl" + filterQuery + @"
                order by UpdateTimeStamp desc");

            collegeListContainer.DataBind();
        }
    }
}