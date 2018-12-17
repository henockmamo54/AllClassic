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

        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];

            if (!IsPostBack)
            {

                handleButtons(true);
                if (Session["updateArticle"] != null)
                {
                    if (Boolean.Parse(Session["updateArticle"].ToString()) == true)
                    {
                        handleButtons(false);
                        var article=ArticleLogic.get_articleByID(int.Parse(Session["ArticleID"].ToString()));
                        Session["selectedArticle"] = article;
                        txt_title.Text = article.ArticleTitle;
                        txt_url.Text = article.ArticleURL;
                    }
                }


            }
        }


        public void handleButtons(Boolean value)
        {
            btn_addnewArticle.Visible = value;
            btn_updatearticle.Visible = !value;
        }

        public void onclick_btn_updatearticle(object sender, EventArgs e)
        {
            ArticleTbl article = (ArticleTbl)Session["selectedArticle"];
            article.ArticleTitle = this.txt_title.Text;
            article.ArticleURL = this.txt_url.Text;
            article.UpdateTimeStamp = DateTime.Now;
            article.UserID = user.UserID;
            article = BusinessLogic.ArticleLogic.updateArticle(article);
            if (article != null)
            {
                showMsg("Data inserted succssfuly");
            }
            else
            {
                showMsg("Please check your inputs");
            }

        }

        public void onClick_btn_cancel(object sender, EventArgs args) {
            txt_url.Text = "";
            txt_title.Text = "";
            Session["updateArticle"] = null;
            handleButtons(true);
        }

        public void onclick_btn_addArticle(object sender, EventArgs e)
        {

            try
            {
                ArticleTbl article = new ArticleTbl();

                article.ArticleTitle = this.txt_title.Text;
                article.ArticleURL = this.txt_url.Text;
                article.UpdateTimeStamp = DateTime.Now;
                article.UserID = user.UserID;
                article = BusinessLogic.ArticleLogic.registerArticle(article);
                if (article != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");
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

        public void showMsg_withredirect(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "ShowMessage()", true);
        }

    }
}