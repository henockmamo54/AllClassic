using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessP;
using BusinessLogic;

namespace AllClassicWeb.Views
{
    public partial class ArticleDBAddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void onclick_btn_addArticle(object sender, EventArgs e)
        {

            try
            {
                ArticleTbl article = new ArticleTbl();

                article.ArticleTitle = this.txt_title.Text;
                article.ArticleURL = this.txt_url.Text;
                article.UpdateTimeStamp = DateTime.Now;
                article.UserID = 5;
                article = BusinessLogic.ArticleLogic.registerArticle(article);
                if (article != null)
                {
                    showMsg("Data inserted succssfuly");
                }
                else
                {
                    showMsg("Please check your inputs");
                }
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

    }
}