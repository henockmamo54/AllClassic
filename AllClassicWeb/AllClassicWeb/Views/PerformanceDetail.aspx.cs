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
        int iD;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PID"] != null)
                 iD = int.Parse(Request.QueryString["PID"]);

            performance = PerformanceDBLogic.getPerfByID(iD);

            if (performance != null) {
                performancePosterImage.ImageUrl= "~/Doc/Performance/" + performance.PosterFileName.ToString();
                txt_subtitle.InnerText = performance.SubTitle + "/" + performance.Subject;
                txt_maintitle.InnerText = performance.MainTitle;
                if(performance.PerformanceGroupTbl!=null)
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
                    lbl_region.Text = performance.LookUpTbl.SubCode;
                if (performance.LookUpTbl2 != null)
                    lbl_city.Text = performance.LookUpTbl2.SubCode;
                if (performance.VenueTbl != null)
                    lbl_city.Text = performance.VenueTbl.Name;
                lbl_video.Text = performance.VideoFileName;
                lbl_ticketbox.Text = performance.TicketBox;
                lbl_program.Text = performance.Program;
                lbl_description.Text = performance.Description;
                myPerformanceDetailArtistInstrumentlist.DataSource = performance.PerformanceMusicianInstrumentTbls.ToList();
                myPerformanceDetailArtistInstrumentlist.DataBind();
            }
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

        protected void detailrepeater_onItemDatabound(object sender, RepeaterItemEventArgs e)
        {
            //RepeaterItem item = e.Item;
            //if ((item.ItemType == ListItemType.Item) ||
            //    (item.ItemType == ListItemType.AlternatingItem))
            //{
            //    var detail = (Repeater)item.FindControl("detailRepeater3");

            //    //pc.getAllParentComments().Take(2).ToList()
            //    //var x = cl.getChildCommentByParentID(((ParentCommentTable)e.Item.DataItem).ID);
            //    var source = entity.PerformanceParentCommentTables.Where(x => x.ParentCommentID == ((PerformanceParentCommentTable)e.Item.DataItem).ID).OrderByDescending(x => x.CommentDate).ToList();
            //    detail.DataSource = source;
            //    detail.DataBind();

            //}
        }


        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //RepeaterItem item = e.Item;
            //if ((item.ItemType == ListItemType.Item) ||
            //    (item.ItemType == ListItemType.AlternatingItem))
            //{
            //    var detail = (Repeater)item.FindControl("detailRepeater");

            //    //pc.getAllParentComments().Take(2).ToList()
            //    //var x = cl.getChildCommentByParentID(((ParentCommentTable)e.Item.DataItem).ID);
            //    var source = entity.PerformanceParentCommentTables.Where(x => x.ParentCommentID == ((PerformanceParentCommentTable)e.Item.DataItem).ID).OrderByDescending(x => x.CommentDate).ToList();
            //    detail.DataSource = source;
            //    detail.DataBind();

            //}
        }


        protected void btnAddDetailComment_Click(object sender, CommandEventArgs e)
        {
            //OrchestraDBEntities entity = new OrchestraDBEntities();
            //RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            //string message = (item.FindControl("txtCommentReplyParent") as TextBox).Text;


            //PerformanceParentCommentTable pt = new PerformanceParentCommentTable();
            //if (user != null)
            //{
            //    if (isUserCompany) pt.UserName = user.UserCompanies.FirstOrDefault().CompanyName.ToString();
            //    else pt.UserName = user.UserPersonalInfoes.FirstOrDefault().Name.ToString();
            //}
            //else pt.UserName = "anonymous";
            //pt.CommentMessage = message;
            //pt.PerformanceID = PDID;
            //pt.CommentDate = DateTime.Now;
            //pt.ParentCommentID = int.Parse(e.CommandArgument.ToString());
            //pt.UserID = user.ID;


            //entity.PerformanceParentCommentTables.Add(pt);
            //entity.SaveChanges();


            ////var parcomm = pc.getChildCommentByParentID(3);
            ////Repeater2.DataSource = parcomm;
            //Repeater2.DataSource = entity.PerformanceParentCommentTables.ToList().Where(x => x.PerformanceID == PDID && x.ParentCommentID == null)
            //    .OrderByDescending(x => x.CommentDate)
            //    .ToList();
            //Repeater2.DataBind();

        }


        public void LikeClicked(object sender, CommandEventArgs e)
        {
            //var value = e.CommandArgument.ToString().Split(',');
            //int id = int.Parse(value[0]);
            //int isLike = int.Parse(value[1]);

            //if (user == null)
            //{
            //    showMsg("Please sign in to Like Posts!!!");
            //    return;
            //}

            //else if (user != null)
            //{
            //    // islike 1= liked, 0= nither liked nor disliked, -1 disliked 
            //    OrchestraDBEntities entities = new OrchestraDBEntities();
            //    var myval = entities.PerformanceLikeUnlikes.Where(x => x.PerformanceID == PDID & x.UserID == user.ID).ToList();
            //    if (myval.Count > 0)
            //    {

            //        if (isLike == 1)
            //        {
            //            if (myval.FirstOrDefault().islike == 1)
            //                myval.FirstOrDefault().islike = 0;
            //            else myval.FirstOrDefault().islike = 1;
            //        }
            //        else
            //        {
            //            if (myval.FirstOrDefault().islike == -1)
            //                myval.FirstOrDefault().islike = 0;
            //            else myval.FirstOrDefault().islike = -1;
            //        }
            //        entities.SaveChanges();
            //    }
            //    else
            //    {
            //        PerformanceLikeUnlike b = new PerformanceLikeUnlike();
            //        b.PerformanceID = PDID;
            //        b.UserID = user.ID;
            //        b.islike = isLike;
            //        b.timestamp = DateTime.Now;
            //        entities.PerformanceLikeUnlikes.Add(b);
            //        entities.SaveChanges();
            //    }

            //    getLikeUnlikeStatusForUser();
            //    likecountspan.InnerText = likecount.ToString();
            //    dislikecountspan.InnerText = dislikecount.ToString();


            //    //BulletinLogic bl = new BulletinLogic();
            //    //Repeater1.DataSource = bl.getAllMsg(myuser.ID);
            //    //Repeater1.DataBind();
            //}

        }


        protected void btnComment_Click(object sender, CommandEventArgs e)
        {
            //if (user == null)
            //{
            //    showMsg("Please sign in to write comments!!!");
            //    return;
            //}
            //if (txtComment.Text.Length > 0)
            //{
            //    btnComment.Enabled = false;
            //    OrchestraDBEntities entity = new OrchestraDBEntities();

            //    PerformanceParentCommentTable pt = new PerformanceParentCommentTable();
            //    if (user != null)
            //    {
            //        if (isUserCompany) pt.UserName = user.UserCompanies.FirstOrDefault().CompanyName.ToString();
            //        else pt.UserName = user.UserPersonalInfoes.FirstOrDefault().Name.ToString();
            //    }
            //    else pt.UserName = "anonymous";
            //    pt.CommentMessage = txtComment.Text;
            //    pt.PerformanceID = PDID;
            //    pt.CommentDate = DateTime.Now;
            //    pt.UserID = user.ID;

            //    entity.PerformanceParentCommentTables.Add(pt);
            //    entity.SaveChanges();


            //    var value = e.CommandArgument;

            //    System.Console.WriteLine("on btn click");

            //    //var parcomm = pc.getChildCommentByParentID(3);
            //    //Repeater2.DataSource = parcomm;
            //    Repeater2.DataSource = entity.PerformanceParentCommentTables.ToList().Where(x => x.PerformanceID == PDID && x.ParentCommentID == null)
            //        .OrderByDescending(x => x.CommentDate)
            //        .ToList();

            //    Repeater2.DataBind();

            //    btnComment.Enabled = true;
            //    txtComment.Text = "";
            //}
        }

    }
}