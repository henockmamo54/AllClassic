using DataAccessP;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class PeopleAndJobDB : System.Web.UI.Page
    {
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);
        }

        public void onclick_btn_addNew(object sender, EventArgs e)
        {
            if (user != null)
            {
                Session["PeopleAndJobID"] = null;
                Session["updatePeopleAndJob"] = false;
                Response.Redirect("PeopleAndJobDBAddNew.aspx");
            }
            else showMsg(Resources.DisplayText.Pleasesignintocontinue);
        }

        
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeleteEntry(int n)
        {
            return BusinessLogic.PeopleAndJobLogic.deleteEntry(n);
        }

        public void collegeListContainer_OnItemDataBound(object sender, ListViewItemEventArgs e)
        {

            var editbutton = (LinkButton)e.Item.FindControl("edit");
            var deleteButton = (LinkButton)e.Item.FindControl("delete");
            int userID = int.Parse(DataBinder.Eval(e.Item.DataItem, "UserID").ToString());
            if (user != null)
            {
                if (user.UserID == userID) { editbutton.Visible = true; deleteButton.Visible = true; }
                else { editbutton.Visible = false; deleteButton.Visible = false; }
            }
            else { editbutton.Visible = false; deleteButton.Visible = false; }

        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }
        public void editClicked(object sender, CommandEventArgs e)
        {
            Session["PeopleAndJobID"] = e.CommandArgument.ToString();
            Session["updatePeopleAndJob"] = true;
            Response.Redirect("PeopleAndJobDBAddNew.aspx");
        }



        public void selectedFilterChanged(object sender, EventArgs e)
        {

            var filterQuery = "";
            if (DropDownList1_type.SelectedIndex != 0) filterQuery += " where p.PeopleOrJob like N'%" + DropDownList1_type.SelectedItem.Text + "%'";

            if (datetimepicker3.Value.Length != 0)
            {
                if (DropDownList1_type.SelectedIndex != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                var date = DateTime.ParseExact(datetimepicker3.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                filterQuery += " datepart(dd,p.ValidDate) =" + date.Day + " and datepart(mm,p.ValidDate) =" + date.Month + " and datepart(yy,p.ValidDate) =" + date.Year;
            }


            if (DropDownList3_city.SelectedIndex != 0)
            {
                if (DropDownList1_type.SelectedIndex != 0 || datetimepicker3.Value.Length != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " c.LookUpID like N'%" + DropDownList3_city.SelectedItem.Value + "%'";
            }

            if (txt_title.Text.ToString().Length > 0)
            {
                if (DropDownList1_type.SelectedIndex != 0 || datetimepicker3.Value.Length != 0 || DropDownList3_city.SelectedIndex != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " Title like N'%" + txt_title.Text.ToString() + "%'";
            }


            SqlDataSource1_Collegelist.SelectCommand = string.Format(@"select p.*, c.subcode as cityname from Auxiliary.PeopleAndJobTbl p
            left join (
            SELECT LookUpID, MainCode, SubCode 
FROM Main.LookUpTbl
where maincode='City'
            ) c on c.LookUpID=p.city
" + filterQuery + @"
                order by UpdateTimeStamp desc");

            collegeListContainer.DataBind();
        }

    }
}