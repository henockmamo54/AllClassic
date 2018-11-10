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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void onclick_btn_addMusicCollege(object sender, EventArgs e)
        {
            Session["MusicCollegeID"] = null;
            Session["updateMusicCollege"] = false;
            Response.Redirect("MusicCollegeDBAddNew.aspx");
        }

        public void CollegeDBClicked(object sender, CommandEventArgs e) {

        }

        public void onclick_headertableItem(object sender, CommandEventArgs e) {

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