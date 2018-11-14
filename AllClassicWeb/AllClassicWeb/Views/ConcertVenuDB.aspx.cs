using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class ConcertVenuDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void onclick_btn_addNewConcertVenu(object sender, EventArgs e)
        {

            Session["ConcertVenuID"] = null;
            Session["updateConcertVenu"] = false;
            Response.Redirect("ConcertVenuDBAddNew.aspx");
        }


        public void selectedFilterChanged(object sender, EventArgs ee)
        {

            var filterQuery = "";
            if (DropDownList1_cityfilter.SelectedIndex != 0) filterQuery += " where city like N'%" + DropDownList1_cityfilter.SelectedItem.Value + "%'";
            if (txtbox_namefilter.Text.ToString().Length > 0)
            {
                if (DropDownList1_cityfilter.SelectedIndex != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " Name like N'%" + txtbox_namefilter.Text.ToString() + "%'";
            }
            if (txtbox_aliasfilter.Text.ToString().Length > 0)
            {
                if (DropDownList1_cityfilter.SelectedIndex != 0 || txtbox_namefilter.Text.ToString().Length > 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " Alias like N'%" + txtbox_aliasfilter.Text + "%'";
            }

            SqlDataSource1_Collegelist.SelectCommand = string.Format(@"select r.*, r.EmailID from Auxiliary.VenueTbl r
            left join Main.usertbl u on r.Userid=u.userid" + filterQuery + @"
                order by UpdateTimeStamp desc");

            collegeListContainer.DataBind();
        }



    }
}