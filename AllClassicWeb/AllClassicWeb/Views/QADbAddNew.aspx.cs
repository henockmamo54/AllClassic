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
    public partial class QADbAddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void onclick_btn_addNew(object sender, EventArgs e) {
            QuestionsTbl q = new QuestionsTbl();
            q.Question = txt_question.Text;
            q.timestamp = DateTime.Now;
            q.UserID = 5;

            q = BusinessLogic.QuestionLogic.registerQuestion(q);
            if (q != null)
            {
                showMsg("Data inserted succssfuly");
            }
            else
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