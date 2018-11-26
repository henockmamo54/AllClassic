using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class PerformanceGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void onclick_btn_addNewPerformanceGroup(object sender, EventArgs e)
        {
            Session["updatePerformanceGroup"] = false;
            Response.Redirect("PerformanceGroupAddNew.aspx");
        }


        protected void selectedFilterChanged(object sender, EventArgs e)
        {
            var filterQuery = "";
            if (DropDownList1_city.SelectedIndex != 0) filterQuery += " where pg.City like N'%" + DropDownList1_city.SelectedItem.Value + "%'";
            if (DropDownList1_grouptype.SelectedIndex != 0)
            {
                if (DropDownList1_city.SelectedIndex != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " pg.GroupType like N'%" + DropDownList1_grouptype.SelectedItem.Value + "%'";
            }

            if (txt_performancegroup.Text.ToString().Length > 0)
            {
                if (DropDownList1_city.SelectedIndex != 0 || DropDownList1_grouptype.SelectedIndex != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " pg.Name like N'%" + txt_performancegroup.Text.ToString() + "%'";
            }
            if (txt_alias.Text.ToString().Length > 0)
            {
                if (DropDownList1_city.SelectedIndex != 0 || DropDownList1_grouptype.SelectedIndex != 0 || txt_performancegroup.Text.ToString().Length > 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " pg.alias like N'%" + txt_alias.Text + "%'";
            }

            SqlDataSource1_pglist.SelectCommand = string.Format(@"select pg.*, c.SubCode as cityname, gt.SubCode as grouptpename from Main.PerformanceGroupTbl pg
left join (select *from Main.LookUpTbl where MainCode = 'city') c on pg.City = c.LookUpID
left join(select* from Main.LookUpTbl where MainCode= 'GroupType') gt on pg.GroupType = gt.LookUpID" + filterQuery + @"
                order by pg.UpdateTimeStamp desc");

            pgListContainer.DataBind();
        }



        protected void onclick_headertableItem(object sender, CommandEventArgs e)
        {
            var PerformanceGroupID = e.CommandArgument.ToString();
            Response.Redirect("PerformanceGroupDetail?PGID=" + PerformanceGroupID);
        }


    }
}