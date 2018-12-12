using DataAccessP;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class MusicianDB : System.Web.UI.Page
    {
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
        }

        protected void onclick_btn_addNewMusician(object sender, EventArgs e)
        {
            if (user != null)
            {
                Session["MusicianID"] = null;
                Session["updateMusician"] = false;
                Response.Redirect("MusicianDBAddNew.aspx");
            }
            else showMsg(Resources.DisplayText.Pleasesignintocontinue);
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        protected void onclick_headertableItem(object sender, CommandEventArgs e)
        {
            var musicianID = e.CommandArgument.ToString();
            Response.Redirect("MusicianDetailPage?ID=" + musicianID);
        }

        protected void selectedFilterChanged(object sender, EventArgs e)
        {
            var filterQuery = "";
            if (DropDownList1_Majorfilter.SelectedIndex != 0) filterQuery += " where m.Major like N'%" + DropDownList1_Majorfilter.SelectedItem.Value + "%'";
            if (txt_repertoryfilter.Text.ToString().Length > 0)
            {
                if (DropDownList1_Majorfilter.SelectedIndex != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " m.Repertory like N'%" + txt_repertoryfilter.Text.ToString() + "%'";
            }
            if (txtbox_namefilter.Text.ToString().Length > 0)
            {
                if (DropDownList1_Majorfilter.SelectedIndex != 0 || txt_repertoryfilter.Text.ToString().Length > 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " m.Name like N'%" + txtbox_namefilter.Text + "%'";
            }

            SqlDataSource1_artistlist.SelectCommand = string.Format(@"SELECT  m.*,u.EmailID,majorsubocode FROM Main.[MusicianTbl] m
                    left join (
                        select LookUpID,SubCode as majorsubocode from Main.LookUpTbl
                        where maincode='Instrument'
                        or maincode='Composer'
                        or maincode='Conductor'
                    ) ml on m.Major=ml.LookUpID                
                    join Main.UserTbl u on m.UserID=u.UserID" + filterQuery + @"
                order by m.UpdateTimeStamp desc");

            artistListContainer.DataBind();
        }


    }
}