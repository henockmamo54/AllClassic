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
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);
        }

        public void onclick_btn_addArticle(object sender, EventArgs e) {

            Response.Redirect("ArticleDBAddNew.aspx");

            Session["ArticleID"] = null;
            Session["updateArticle"] = false;

        }

        public void ArticleClicked(object sender, CommandEventArgs e) {
            string strURL = e.CommandArgument.ToString();
            var b = new UriBuilder(strURL);
            Response.Redirect(b.ToString());
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