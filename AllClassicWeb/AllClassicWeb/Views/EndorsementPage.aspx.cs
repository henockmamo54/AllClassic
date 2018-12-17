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
    public partial class EndorsementPage : System.Web.UI.Page
    {
        int ID;
        MusicianEndorserTbl endorser;
        MusicianTbl artist;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
                ID = int.Parse(Request.QueryString["ID"]);
            endorser = BusinessLogic.EndorserLogic.getendorserlistbyID(ID);
            if (endorser != null)
            {
                artist = endorser.MusicianTbl;
                if (endorser.status == true) saveEndorsement.Enabled = false;
            }
            if (artist != null)
            {
                profileImage.ImageUrl = "../Doc/artist/" + artist.Photo1;
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

            }
        }

        public void saveEndorsementComment(object sender, EventArgs e)
        {
            ID = int.Parse(Request.QueryString["ID"]);
            if (EndorserLogic.saveEndorsementComment(ID))
            {

                if (artist != null)
                {
                    showMsg("Artist Endorsed inserted succssfuly");
                    saveEndorsement.Enabled = false;
                }

            }
            else showMsg("Please check your inputs");
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

    }
}