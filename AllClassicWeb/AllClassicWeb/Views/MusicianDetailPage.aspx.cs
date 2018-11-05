﻿using System;
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
        int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
                userID = int.Parse(Request.QueryString["ID"]);
            MusicianTbl artist = BusinessLogic.MusicianLogic.getMusicianByID(userID);

            if (artist != null)
            {
                profileImage.ImageUrl = "../Doc/artist/" + artist.Photo2;
                artistnamecontainer.InnerText = artist.Name;
                address.Text = artist.Address;
                zipCode.Text = artist.ZipCode;
                mobileNo.Text = artist.MobileNo;
                kakaoTalkID.Text = artist.KakaoTalk;
                facebook.Text = artist.Facebook;
                twitter.Text = artist.Twitter;
                yourAffilation.Text = artist.Affliation;
                profilePage.Text = artist.Profile;
                repertory.Text = artist.Repertory;



                //var endorsers = entities.User_Endorser.Where(x => x.ArtistID == artist.ID).ToList();
                //repeater_endorser.DataSource = endorsers;
                //repeater_endorser.DataBind();

            }
        }

        public void onclick_btn_editArtist(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                userID = int.Parse(Request.QueryString["ID"]);
                Session["MusicianID"] = userID;
                Session["updateMusician"] = true;
                Response.Redirect("MusicianDBAddNew.aspx");
            }
        }
    }
}