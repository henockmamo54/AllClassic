using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessP;
using BusinessLogic;
using System.Globalization;

namespace AllClassicWeb.Views
{
    public partial class ArticleDB : System.Web.UI.Page
    {
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);
        }

        public void onclick_btn_addArticle(object sender, EventArgs e) {
            if (user != null)
            {
                Session["ArticleID"] = null;
                Session["updateArticle"] = false;
                Response.Redirect("ArticleDBAddNew.aspx");
            }
            else showMsg(Resources.DisplayText.Pleasesignintocontinue);
        }



        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeleteArticle(int n)
        {
            return ArticleLogic.deleteArticle(n);
        }


        public void collegeListContainer_OnItemDataBound(object sender, ListViewItemEventArgs e) {

            var editbutton=(LinkButton)e.Item.FindControl("edit");
            var deletebutton=(LinkButton)e.Item.FindControl("delete");
            int userID = int.Parse(DataBinder.Eval(e.Item.DataItem, "UserID").ToString());
            if (user != null)
            {
                if (user.UserID == userID || user.IsMasterUser == 1) { editbutton.Visible = true; deletebutton.Visible = true; }
                else {editbutton.Visible = false; deletebutton.Visible = false; }
            }
            else { editbutton.Visible = false; deletebutton.Visible = false; }

        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }
        public void ArticleClicked(object sender, CommandEventArgs e) {
            string strURL = e.CommandArgument.ToString();
            try
            {
                var b = new UriBuilder(strURL);
                //Response.Redirect(b.ToString());

                var s = "openInNewTab('" + b.ToString() + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popaaa", s, true);
            }
            catch (Exception ee) {
                showMsg("Invalid Url");
            }
        }

        public void editArticleClicked(object sender, CommandEventArgs e) {           
                Session["ArticleID"] = e.CommandArgument.ToString();
                Session["updateArticle"] = true;
                Response.Redirect("ArticleDBAddNew.aspx");
        }

        public void selectedFilterChanged(object sender, EventArgs e)
        {
            var filterQuery = "";
            if (datetimefilter.Value.Length != 0)
            {
                var date = DateTime.ParseExact(datetimefilter.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                filterQuery += " where datepart(dd,a.UpdateTimeStamp) =" + date.Day + " and datepart(mm,a.UpdateTimeStamp) ="+date.Month + " and datepart(yy,a.UpdateTimeStamp) ="+date.Year;
            }
            if (txtbox_emailfilter.Text.ToString().Length > 0)
            {
                if (datetimefilter.Value.Length != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " u.emailID like N'%" + txtbox_emailfilter.Text.ToString() + "%'";
            }
            

            SqlDataSource1_Collegelist.SelectCommand = string.Format(@"select top 20 a.*, u.FullName userName, u.emailid from Auxiliary.ArticleTbl a
join Main.UserTbl u on u.UserID=a.UserID" + filterQuery + @"
                order by UpdateTimeStamp desc");

            collegeListContainer.DataBind();
        }
    }
}