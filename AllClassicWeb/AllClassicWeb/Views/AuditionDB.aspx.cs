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
    public partial class AuditionDB : System.Web.UI.Page
    {
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);
        }

        public void onclick_btn_addAudition(object sender, EventArgs e)
        {
            if (user != null)
            {
                Session["AuditionID"] = null;
                Session["updateAudition"] = false;
                Response.Redirect("AuditionDBAddNew.aspx");
            }
            else showMsg(Resources.DisplayText.Pleasesignintocontinue);
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeleteAudition(int n)
        {
            return BusinessLogic.AuditionLogic.deleteAudition(n);
        }



        public void collegeListContainer_OnItemDataBound(object sender, ListViewItemEventArgs e)
        {

            var editbutton = (LinkButton)e.Item.FindControl("edit"); 
            var deletebutton = (LinkButton)e.Item.FindControl("delete");  
            int userID = int.Parse(DataBinder.Eval(e.Item.DataItem, "UserID").ToString());
            if (user != null)
            {
                if (user.UserID == userID) { editbutton.Visible = true; deletebutton.Visible = true; }
                else { editbutton.Visible = false; deletebutton.Visible = false; }
            }
            else { editbutton.Visible = false; deletebutton.Visible = false; }

        }

        public void selectedFilterChanged(object sender, EventArgs e)
        {
            var filterQuery = "";
            if (datetimepicker2.Value.Length != 0)
            {
                var date = DateTime.ParseExact(datetimepicker2.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                filterQuery += " where datepart(dd,a.FromDate) =" + date.Day + " and datepart(mm,a.FromDate) =" + date.Month + " and datepart(yy,a.FromDate) =" + date.Year;
            }
            if (datetimepicker3.Value.Length != 0)
            {
                if (datetimepicker2.Value.Length != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                var date = DateTime.ParseExact(datetimepicker3.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                filterQuery += " datepart(dd,a.ToDate) =" + date.Day + " and datepart(mm,a.ToDate) =" + date.Month + " and datepart(yy,a.ToDate) =" + date.Year;
            }
            if (txt_organizer.Text.ToString().Length > 0)
            {
                if (datetimepicker2.Value.Length != 0 || datetimepicker3.Value.Length != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " Organizer like N'%" + txt_organizer.Text.ToString() + "%'";
            }
            if (txt_title.Text.ToString().Length > 0)
            {
                if (datetimepicker2.Value.Length != 0 || datetimepicker3.Value.Length != 0 || txt_organizer.Text.ToString().Length > 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " Title like N'%" + txt_title.Text.ToString() + "%'";
            }


            SqlDataSource1_Collegelist.SelectCommand = string.Format(@"select a.*, u.FullName userName, u.EmailID from Auxiliary.AuditionTbl a
                    join Main.UserTbl u on u.UserID=a.UserID" + filterQuery + @"
                order by UpdateTimeStamp desc");

            collegeListContainer.DataBind();
        }

        public void editAuditionClicked(object sender, CommandEventArgs e)
        {
            Session["AuditionID"] = e.CommandArgument.ToString();
            Session["updateAudition"] = true;
            Response.Redirect("AuditionDBAddNew.aspx");
        }
    }
}