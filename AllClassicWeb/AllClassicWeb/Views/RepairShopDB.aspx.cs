﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class RepairShopDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void onclick_btn_addReparShop(object sender, EventArgs e) {
            Session["RepairShopID"] = null;
            Session["updateRepairShop"] = false;
            Response.Redirect("RepairShopDBAddNew.aspx");
        }

        public void editRepairShopClicked(object sender, CommandEventArgs e)
        {
            Session["RepairShopID"] = e.CommandArgument.ToString();
            Session["updateRepairShop"] = true;
            Response.Redirect("RepairShopDBAddNew.aspx");
        }

        public void selectedFilterChanged(object sender, EventArgs ee) {

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
            if (txt_experties.Text.ToString().Length > 0)
            {
                if (DropDownList1_cityfilter.SelectedIndex != 0 || txtbox_namefilter.Text.ToString().Length > 0 || txtbox_aliasfilter.Text.ToString().Length > 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " Expertise like N'%" + txt_experties.Text + "%'";
            }

            SqlDataSource1_Collegelist.SelectCommand = string.Format(@"select r.*, r.EmailID,c.SubCode cityname from Auxiliary.RepairShopTbl r
            join Main.usertbl u on r.Userid=u.userid
                    left join (select lookupid, Maincode, subcode from main.lookuptbl where maincode='City') c on c.LookUpID=r.City" + filterQuery + @"
                order by UpdateTimeStamp desc");

            collegeListContainer.DataBind();
        }

    }
}