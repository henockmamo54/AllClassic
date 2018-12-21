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
    public partial class PerformanceDetail : System.Web.UI.Page
    {
        PerformanceTbl performance;
        static int iD;
        static UserTbl user;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            if (Request.QueryString["PID"] != null)
                iD = int.Parse(Request.QueryString["PID"]);

            performance = PerformanceDBLogic.getPerfByID(iD);

            if (performance != null)
            {
                performancePosterImage.ImageUrl = "~/Doc/Performance/" + performance.PosterFileName.ToString();

                //txt_subtitle.InnerText = performance.SubTitle + "/" + performance.Subject;
                //txt_maintitle.InnerText = performance.MainTitle;

                lbl_Maintitle.Text = performance.MainTitle;
                lbl_subtitle.Text = performance.SubTitle;
                lbl_subjectTheme.Text = performance.Subject;
                if (performance.PerformanceGroupTbl != null)
                    lbl_pg.Text = performance.PerformanceGroupTbl.Name;
                if (performance.LookUpTbl != null)
                    lbl_pt.Text = performance.LookUpTbl.SubCode;
                if (performance.MusicianTbl != null)
                    lbl_conductor.Text = performance.MusicianTbl.Name;
                if (performance.MusicianTbl1 != null)
                    lbl_maintitlecomposer.Text = performance.MusicianTbl1.Name;
                if (performance.InstrumentTbl != null)
                    lbl_maininstrument.Text = performance.InstrumentTbl.KoreanName;
                lbl_organizer.Text = performance.Organizer;
                lbl_sponser.Text = performance.Sponser;
                lbl_language.Text = performance.Language;
                lbl_start.Text = performance.StartDate.ToShortDateString();
                lbl_end.Text = performance.EndDate.ToShortDateString();
                lbl_time.Text = performance.Time;
                if (performance.LookUpTbl1 != null)
                    lbl_region.Text = performance.LookUpTbl1.SubCode;
                if (performance.LookUpTbl2 != null)
                    lbl_city.Text = performance.LookUpTbl2.SubCode;
                if (performance.VenueTbl != null)
                    lbl_venu.Text = performance.VenueTbl.Name;
                lbl_video.Text = performance.VideoFileName;
                lbl_ticketbox.Text = performance.TicketBox;
                lbl_program.Text = Server.HtmlDecode( performance.Program);
                lbl_description.Text = Server.HtmlDecode(performance.Description);
                myPerformanceDetailArtistInstrumentlist.DataSource = performance.PerformanceMusicianInstrumentTbls.ToList();
                myPerformanceDetailArtistInstrumentlist.DataBind();

                //comments
                ParentRepeater.DataSource = CommentLogic.getCommentsByPerformanceID(int.Parse(Request.QueryString["PID"]));
                ParentRepeater.DataBind();

                //like unlike
                getLikeUnlikeStatusForUser();

                if (user != null)
                {
                    if ((user.UserID == performance.UserID )|| user.IsMasterUser==1) { btn_editArtist.Visible = true; btn_deleteArtist.Visible = true; }
                    else { btn_editArtist.Visible = false; btn_deleteArtist.Visible = false; }
                }
                else { btn_editArtist.Visible = false; btn_deleteArtist.Visible = false; }

            }
        }

        public void btnRemoveComment_Click(object sender, CommandEventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "PopDeleteAnswerDeleteComment", "DeleteComment('" + e.CommandArgument + "');", true);
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeleteCommentByID(int CommentID)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();

            List<PerformanceCommentTbl> comments = entities.PerformanceCommentTbls.ToList().Where(x => x.ParentCommentID == CommentID).ToList();

            foreach (var item in comments)
            {
                // check if the child has child answer
                if (item.PerformanceCommentTbl1 != null)
                {
                    if (item.PerformanceCommentTbl1.Count > 0)
                    {

                        entities.PerformanceCommentTbls.RemoveRange(item.PerformanceCommentTbl1.ToList());
                        entities.SaveChanges();
                    }
                }

                entities.PerformanceCommentTbls.Remove(item);
                entities.SaveChanges();
            }


            entities.PerformanceCommentTbls.Remove(entities.PerformanceCommentTbls.ToList().Where(x => x.CommentID == CommentID).FirstOrDefault());
            entities.SaveChanges();

            return true;
        }


        public void onclick_btn_deleteArtist(object sender, EventArgs e)
        {

        }

        public void onclick_btn_editPerformance(object sender, EventArgs e)
        {
            if (Request.QueryString["PID"] != null)
            {
                iD = int.Parse(Request.QueryString["PID"]);
                Session["PID"] = iD;
                Session["updatePerformance"] = true;
                Response.Redirect("PerformanceDBAddNew.aspx");
            }
        }

        protected void FirstChildRepeater_onItemDatabound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                var detail = (Repeater)item.FindControl("SecondChildRepeater");
                var parent = ((PerformanceCommentTbl)e.Item.DataItem);

                var DlnkReplyParent = (LinkButton)e.Item.FindControl("DlnkReplyParent");
                if (user != null)
                {

                    if (user.UserID != parent.UserID || user.IsMasterUser == 1)
                        DlnkReplyParent.Visible = false;
                    else DlnkReplyParent.Visible = true;
                }
                else DlnkReplyParent.Visible = false;

                detail.DataSource = CommentLogic.getCommentsByParentCommentID(parent.CommentID);
                detail.DataBind();

            }
        }


        protected void SecondChildRepeater_onItemDatabound(object sender, RepeaterItemEventArgs e)
        {
            var parent = ((PerformanceCommentTbl)e.Item.DataItem);

            var DlnkReplyParent = (LinkButton)e.Item.FindControl("DlnkReplyParent");
            if (user != null)
            {

                if (user.UserID != parent.UserID || user.IsMasterUser == 1)
                    DlnkReplyParent.Visible = false;
                else DlnkReplyParent.Visible = true;
            }
            else DlnkReplyParent.Visible = false;
        }


        protected void ParentRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                var detail = (Repeater)item.FindControl("FirstChildRepeater");
                var parent = ((PerformanceCommentTbl)e.Item.DataItem);

                var DlnkReplyParent = (LinkButton)e.Item.FindControl("DlnkReplyParent");
                if (user != null)
                {

                    if (user.UserID != parent.UserID || user.IsMasterUser == 1)
                        DlnkReplyParent.Visible = false;
                    else DlnkReplyParent.Visible = true;
                }
                else DlnkReplyParent.Visible = false;

                detail.DataSource = CommentLogic.getCommentsByParentCommentID(parent.CommentID); 
                detail.DataBind();

            }
        }


        protected void btnAddDetailComment_Click(object sender, CommandEventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string message = (item.FindControl("txtCommentReplyParent") as TextBox).Text;

            PerformanceCommentTbl comment = new PerformanceCommentTbl();

            comment.CommentMessage = message;
            comment.PerformanceID = int.Parse(Request.QueryString["PID"]);
            comment.CommentDate = DateTime.Now;
            comment.ParentCommentID = int.Parse(e.CommandArgument.ToString());
            comment.UserID = user.UserID;

            CommentLogic.addComment(comment);

            ParentRepeater.DataSource = CommentLogic.getParentCommentsByPerformanceID(int.Parse(Request.QueryString["PID"]));
            ParentRepeater.DataBind();

        }


        public void LikeClicked(object sender, CommandEventArgs e)
        {
            var value = e.CommandArgument.ToString().Split(',');
            int id = int.Parse(value[0]);
            int isLike = int.Parse(value[1]);

            if (user == null)
            {
                showMsg("Please sign in to Like Posts!!!");
                return;
            }

            else if (user != null)
            {
                // islike 1= liked, 0= nither liked nor disliked, -1 disliked 

                var myval = PerformanceLikeUnlikeLogic.getPerformanceLikeDislikeByPerformanceIDAndUserID(int.Parse(Request.QueryString["PID"]), user.UserID);
                if (myval.Count > 0)
                {
                    if (isLike == 1)
                    {
                        if (myval.FirstOrDefault().islike == 1)
                            myval.FirstOrDefault().islike = 0;
                        else myval.FirstOrDefault().islike = 1;
                    }
                    else
                    {
                        if (myval.FirstOrDefault().islike == -1)
                            myval.FirstOrDefault().islike = 0;
                        else myval.FirstOrDefault().islike = -1;
                    }
                    PerformanceLikeUnlikeLogic.updatePerformanceLikeUnlike(myval.FirstOrDefault());
                }
                else
                {
                    PerformanceLikeUnlikeTbl b = new PerformanceLikeUnlikeTbl();
                    b.PerformanceID = int.Parse(Request.QueryString["PID"]);
                    b.UserID = user.UserID;
                    b.islike = isLike;
                    b.timestamp = DateTime.Now;
                    PerformanceLikeUnlikeLogic.addLikeUnlike(b);
                }

                getLikeUnlikeStatusForUser();

            }

        }


        public void getLikeUnlikeStatusForUser()
        {
            List<PerformanceLikeUnlikeTbl> performancelikeunlike = PerformanceLikeUnlikeLogic.getPerformanceLikeDislikeByPerformanceID(int.Parse(Request.QueryString["PID"]));
            int likecount = performancelikeunlike.Where(x => x.islike == 1).Count();
            int dislikecount = performancelikeunlike.Where(x => x.islike == -1).Count();
            likecountspan.InnerText = likecount.ToString();
            dislikecountspan.InnerText = dislikecount.ToString();
            if (user != null)
            {
                var detail = PerformanceLikeUnlikeLogic.getPerformanceLikeDislikeByPerformanceIDAndUserID(int.Parse(Request.QueryString["PID"]), user.UserID).FirstOrDefault();
                if (detail != null)
                {
                    likebutton.Visible = detail.islike != 1;
                    likebuttonliked.Visible = detail.islike == 1;

                    dislikebutton.Visible = detail.islike != -1;
                    dislikebuttondisliked.Visible = detail.islike == -1;
                }
            }
        }

        protected void btnComment_Click(object sender, CommandEventArgs e)
        {
            var user = (UserTbl)Session["User"];
            if (user == null)
            {
                showMsg("Please sign in to write comments!!!");
                return;
            }

            if (txtComment.Text.Length > 0)
            {
                btnComment.Enabled = false;

                PerformanceCommentTbl comment = new PerformanceCommentTbl();

                comment.CommentMessage = txtComment.Text;
                comment.PerformanceID = int.Parse(Request.QueryString["PID"]);
                comment.CommentDate = DateTime.Now;
                comment.UserID = user.UserID;

                CommentLogic.addComment(comment);
                var value = e.CommandArgument;

                ParentRepeater.DataSource = CommentLogic.getParentCommentsByPerformanceID(int.Parse(Request.QueryString["PID"]));
                ParentRepeater.DataBind();

                btnComment.Enabled = true;
                txtComment.Text = "";
            }
        }


        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool checkLoginStatus(int n)
        {

            return user != null;
        }



        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeletePerformance(int n)
        {
            return PerformanceDBLogic.deletePerformance(iD);
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

    }
}