using DataAccessP;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb
{
    public partial class QADbNew : System.Web.UI.Page
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
                Response.Redirect("QADbAddNew.aspx");
            }
            else showMsg(Resources.DisplayText.Pleasesignintocontinue);
        }

        public void btnRemoveAnswer_Click(object sender, CommandEventArgs e)
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "PopDeleteAnswer", "DeleteAnswer('" + e.CommandArgument + "');", true);
        }

        public void btnRemoveQuestion_Click(object sender, CommandEventArgs e)
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "PopDeleteAnswer", "DeleteQuestion('" + e.CommandArgument + "');", true);
        }

        protected void SecondChildRepeater_onItemDatabound(object sender, RepeaterItemEventArgs e)
        {
            var answer = ((AnswersTbl)e.Item.DataItem);

            var DlnkReplyParent = (LinkButton)e.Item.FindControl("DlnkReplyParent");
            if (user != null)
            {

                if (user.UserID != answer.UserID || user.IsMasterUser == 1)
                    DlnkReplyParent.Visible = false;
                else DlnkReplyParent.Visible = true;
            }
            else DlnkReplyParent.Visible = false;
        }

        protected void ParentRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            var answer = ((AnswersTbl)e.Item.DataItem);

            var DlnkReplyParent = (LinkButton)e.Item.FindControl("DlnkReplyParent");
            if (user != null)
            {

                if (user.UserID != answer.UserID || user.IsMasterUser == 1)
                    DlnkReplyParent.Visible = false;
                else DlnkReplyParent.Visible = true;
            }
            else DlnkReplyParent.Visible = false;

            var detail = (Repeater)e.Item.FindControl("FirstChildRepeater");
            int parentID = answer.AnswerID;
            detail.DataSource = entities.AnswersTbls.Where(x => x.ParentAnswer == parentID).ToList();
            detail.DataBind();
        }

        protected void collegeListContainer_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewItem item = e.Item;
            
            int questionID = int.Parse(DataBinder.Eval(e.Item.DataItem, "QuestionID").ToString());
            int userid= int.Parse(DataBinder.Eval(e.Item.DataItem, "UserID").ToString());

            var DlnkReplyParent = (LinkButton)e.Item.FindControl("DlnkReplyParent");
            if (user != null)
            {

                if (user.UserID == userid || user.IsMasterUser == 1)
                    DlnkReplyParent.Visible = true;
                else DlnkReplyParent.Visible = false;
            }
            else DlnkReplyParent.Visible = false;


            var detail = (Repeater)item.FindControl("ParentRepeater");
            AllClassicDBEntities entities = new AllClassicDBEntities();
            detail.DataSource = entities.AnswersTbls.Where(x => x.QuestionID == questionID).ToList();
            try
            {
                detail.DataBind();
            }
            catch (Exception ee) { }
        }


        protected void FirstChildRepeater_onItemDatabound(object sender, RepeaterItemEventArgs e)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            //int answerID = int.Parse(DataBinder.Eval(e.Item.DataItem, "AnswerID").ToString());
            var answer = ((AnswersTbl)e.Item.DataItem);

            var DlnkReplyParent = (LinkButton)e.Item.FindControl("DlnkReplyParent");
            if (user != null)
            {

                if (user.UserID != answer.UserID || user.IsMasterUser == 1)
                    DlnkReplyParent.Visible = false;
                else DlnkReplyParent.Visible = true;
            }
            else DlnkReplyParent.Visible = false;

            var SecondChildRepeater = (Repeater)e.Item.FindControl("SecondChildRepeater");
            SecondChildRepeater.DataSource = entities.AnswersTbls.Where(x => x.ParentAnswer == answer.AnswerID).ToList();
            SecondChildRepeater.DataBind();

        }

        public void btnAddDetailDetailComment_Click(object sender, CommandEventArgs e)
        {

            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string message = (item.FindControl("txtCommentReplyParent") as TextBox).Text;

            AnswersTbl answer = new AnswersTbl();

            answer.Answer = message;
            answer.timestamp = DateTime.Now;
            answer.ParentAnswer = int.Parse(e.CommandArgument.ToString());
            answer.UserID = user.UserID;

            AllClassicDBEntities entities = new AllClassicDBEntities();
            entities.AnswersTbls.Add(answer);
            entities.SaveChanges();

            var SecondChildRepeater = (Repeater)item.FindControl("SecondChildRepeater");
            var mylist = entities.AnswersTbls.Where(x => x.ParentAnswer == answer.ParentAnswer).ToList();
            SecondChildRepeater.DataSource = entities.AnswersTbls.Where(x => x.ParentAnswer == answer.ParentAnswer).ToList();
            SecondChildRepeater.DataBind();


        }
        public void btnAddDetailComment_Click(object sender, CommandEventArgs e)
        {

            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string message = (item.FindControl("txtCommentReplyParent") as TextBox).Text;

            AnswersTbl answer = new AnswersTbl();

            answer.Answer = message;
            answer.timestamp = DateTime.Now;
            answer.ParentAnswer = int.Parse(e.CommandArgument.ToString());
            answer.UserID = user.UserID;

            AllClassicDBEntities entities = new AllClassicDBEntities();
            entities.AnswersTbls.Add(answer);
            entities.SaveChanges();

            var FirstChildRepeater = (Repeater)item.FindControl("FirstChildRepeater");
            var mylist = entities.AnswersTbls.Where(x => x.ParentAnswer == answer.ParentAnswer).ToList();
            FirstChildRepeater.DataSource = entities.AnswersTbls.Where(x => x.ParentAnswer == answer.ParentAnswer).ToList();
            FirstChildRepeater.DataBind();


        }

        public void btnAddAnswer_Click(object sender, CommandEventArgs e)
        {
            ListViewItem item = (sender as Button).NamingContainer as ListViewItem;
            string message = (item.FindControl("txtAddParentAnswer") as TextBox).Text;

            AnswersTbl answer = new AnswersTbl();
            answer.QuestionID = int.Parse(e.CommandArgument.ToString());
            answer.Answer = message;
            answer.timestamp = DateTime.Now;
            answer.UserID = user.UserID;

            AllClassicDBEntities entities = new AllClassicDBEntities();
            entities.AnswersTbls.Add(answer);
            entities.SaveChanges();

            var detail = (Repeater)item.FindControl("ParentRepeater");
            var mylist = entities.AnswersTbls.Where(x => x.QuestionID == answer.QuestionID).ToList();
            detail.DataSource = entities.AnswersTbls.Where(x => x.QuestionID == answer.QuestionID).ToList();
            detail.DataBind();


        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool checkLoginStatus(int n)
        {

            return user != null;
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeleteQuestionByID(int id)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            var answers = entities.AnswersTbls.Where(x => x.QuestionID == id).ToList();

            foreach (var answer in answers)
            {
                if (answer.AnswersTbl1 != null)
                {
                    if (answer.AnswersTbl1.Count > 0)
                    {
                        foreach (var item in answer.AnswersTbl1)
                        {
                            // check if the child has child answer
                            if (item.AnswersTbl1 != null)
                            {
                                if (item.AnswersTbl1.Count > 0)
                                {

                                    entities.AnswersTbls.RemoveRange(item.AnswersTbl1);
                                    entities.SaveChanges();
                                }
                            }
                        }

                        entities.AnswersTbls.RemoveRange(answer.AnswersTbl1);
                        entities.SaveChanges();
                    }
                }


                entities.AnswersTbls.Remove(entities.AnswersTbls.Where(x => x.AnswerID == answer.AnswerID).FirstOrDefault());
                entities.SaveChanges();

            }

            entities.QuestionsTbls.Remove(entities.QuestionsTbls.Where(x => x.QuestionID == id).FirstOrDefault());
            entities.SaveChanges();

            return true;
        }


        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeleteAnswerByID(int id)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();

            var childanswers = entities.AnswersTbls.Where(x => x.ParentAnswer == id).ToList();
            foreach (var item in childanswers)
            {
                // check if the child has child answer
                if (item.AnswersTbl1 != null)
                {
                    if (item.AnswersTbl1.Count > 0)
                    {

                        entities.AnswersTbls.RemoveRange(item.AnswersTbl1);
                        entities.SaveChanges();
                    }
                }
                entities.AnswersTbls.Remove(item);
                entities.SaveChanges();
            }


            entities.AnswersTbls.Remove(entities.AnswersTbls.Where(x => x.AnswerID == id).FirstOrDefault());
            entities.SaveChanges();

            return true;
        }

        public void selectedFilterChanged(object sender, EventArgs e)
        {
            var filterQuery = "";
            if (datetimefilter.Value.Length != 0)
            {
                var date = DateTime.ParseExact(datetimefilter.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                filterQuery += " where datepart(dd,p.timestamp) =" + date.Day + " and datepart(mm,p.timestamp) =" + date.Month + " and datepart(yy,p.timestamp) =" + date.Year;
            }
            if (txtbox_emailfilter.Text.ToString().Length > 0)
            {
                if (datetimefilter.Value.Length != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " u.emailID like N'%" + txtbox_emailfilter.Text.ToString() + "%'";
            }
            if (txt_question.Text.Length > 0)
            {
                if (filterQuery.Length == 0) filterQuery += " Where ";
                else filterQuery += " And ";
                filterQuery += " p.Question like N'%" + txt_question.Text.ToString() + "%'";
            }


            SqlDataSource1_Collegelist.SelectCommand = string.Format(@" select p.*, u.EmailID as posterEmailID from Auxiliary.QuestionsTbl p
left join main.usertbl u on p.userID= u.userid" + filterQuery + @" order by timestamp desc");

            collegeListContainer.DataBind();
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        public class questionModel
        {
            public int QuestionID;
            public string Question;
            public int UserID;
            public DateTime timestamp;
            public string posterEmailID;
        }
    }
}