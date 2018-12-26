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
    public partial class MusicianDetailPage : System.Web.UI.Page
    {
        static int MusicianID;
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            if (Request.QueryString["ID"] != null)
                MusicianID = int.Parse(Request.QueryString["ID"]);
            MusicianTbl artist = BusinessLogic.MusicianLogic.getMusicianByID(MusicianID);

            if (artist != null)
            {
                profileImage.ImageUrl = "../Doc/artist/" + artist.Photo1;
                profileImage2.ImageUrl = "../Doc/artist/" + artist.Photo2; 
                artistnamecontainer.InnerText = artist.Name;
                address.Text = artist.Address;
                zipCode.Text = artist.ZipCode;
                mobileNo.Text = artist.MobileNo;
                kakaoTalkID.Text = artist.KakaoTalk;
                facebook.Text = artist.Facebook;
                twitter.Text = artist.Twitter;
                yourAffilation.Text = artist.Affliation;
                //profilePage.Text = artist.Profile;
                //repertory.Text = artist.Repertory;
                profilePage.Text = Server.HtmlDecode(artist.Profile);
                repertory.Text = Server.HtmlDecode(artist.Repertory);

                major.Text = artist.LookUpTbl != null ? artist.LookUpTbl.SubCode : "";

                var endorserlist = artist.MusicianEndorserTbls.Where(x=>x.status==true).ToList();
                if (endorserlist != null && endorserlist.Count > 0)
                {
                    Session["myendorsmentlist"] = endorserlist;
                    repeater_endorser.DataSource = endorserlist;
                    repeater_endorser.DataBind();
                }

                if (user != null)
                {
                    if (user.UserID == artist.UserID || user.IsMasterUser == 1) { btn_editArtist.Visible = true; btn_deleteArtist.Visible = true; }
                    else { btn_editArtist.Visible = false; btn_deleteArtist.Visible = false; }
                }
                else
                {
                    btn_editArtist.Visible = false; btn_deleteArtist.Visible = false ;
                }
            }
        }

        public void onclick_btn_editArtist(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                MusicianID = int.Parse(Request.QueryString["ID"]);
                Session["MusicianID"] = MusicianID;
                Session["updateMusician"] = true;
                Response.Redirect("MusicianDBAddNew.aspx");
            }
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool DeleteMusician(int n)
        {
            return MusicianLogic.DeleteMusician(MusicianID);
        }



    }
}