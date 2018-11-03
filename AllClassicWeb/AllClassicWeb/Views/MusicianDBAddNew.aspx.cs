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
    public partial class MusicianDBAddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            manageFileUpload1();
            manageFileUpload2();

            if (!IsPostBack) {
                Session["myendorsmentlist"] = null;
            }
        }


        public void btn_remove_endorser_tolist(object sender, CommandEventArgs e)
        {
            if (Session["myendorsmentlist"] != null)
            {

                List<MusicianEndorserTbl> mylist = (List<MusicianEndorserTbl>)Session["myendorsmentlist"];

                mylist.RemoveAt(int.Parse(e.CommandArgument.ToString()));
                myendorsmentlist.DataSource = mylist;
                myendorsmentlist.DataBind();
                Session["myendorsmentlist"] = mylist;
            }
        }
        
        protected void btnAddEndorser_Click(object sender, EventArgs e)
        {
            MusicianEndorserTbl endorser = new MusicianEndorserTbl();
            endorser.EndorserName = FormControlInput1_Name.Text;
            endorser.EndorserEmail = FormControlTextarea1_email.Text;
            endorser.RequestedDate = DateTime.Now;
            endorser.status = false;
            
            if (Session["myendorsmentlist"] != null)
            {
                List<MusicianEndorserTbl> mylist = (List<MusicianEndorserTbl>)Session["myendorsmentlist"];
                mylist.Add(endorser);
                myendorsmentlist.DataSource = mylist;
                myendorsmentlist.DataBind();
                Session["myendorsmentlist"] = mylist;
            }
            else
            {
                List<MusicianEndorserTbl> endorserList = new List<MusicianEndorserTbl>();
                endorserList.Add(endorser);

                myendorsmentlist.DataSource = endorserList;
                myendorsmentlist.DataBind();
                Session["myendorsmentlist"] = endorserList;
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop2", "closeModal();", true);

        }

        protected void btn_artistadd_Click(object sender, EventArgs e)
        {
            try
            {
                MusicianTbl artist = new MusicianTbl();
                artist.Name = txt_name.Text;
                artist.EmailID = txt_email.Text;
                artist.MobileNo = txt_mobilenumber.Text;
                artist.Address = txt_address.Text;
                artist.ZipCode = txt_zipcode.Text;
                //if (int.Parse(DropDownList1_Affilation.SelectedValue) == -1)
                //    artist.Affiliation = uaffilation.Text;
                //else artist.Affiliation = DropDownList1_Affilation.SelectedItem.Text;

                artist.Facebook = txt_facebook.Text;
                artist.Twitter = txt_twitter.Text;
                artist.KakaoTalk = txt_kakaoID.Text;
                artist.Major = int.Parse(DropDownList1_Major.SelectedValue.ToString());
                getPhoto(artist, 2, FileUpload_photo1);
                getPhoto(artist, 2, FileUpload_photo2);
                artist.Profile = txt_profilepage.Text;
                artist.Repertory = txt_repertory.Text;
                artist.UserID = 5;
                artist.UpdateTimeStamp = DateTime.Now;



                List<MusicianEndorserTbl> mylist = (List<MusicianEndorserTbl>)Session["myendorsmentlist"];
                artist = MusicianLogic.registerMusician(mylist, artist);

                if (artist != null)
                {
                    showMsg("Data inserted succssfuly");
                    cleanArtistTextBoxs();

                    //sending message to endorsers
                    //sendEmailToEndorser(x.Email, artist, x);

                }
                else showMsg("Please check your inputs");
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


        public void btn_artistcancel_Click(object sender, EventArgs e)
        {
            //btn_artist_add.Visible = true;
            //btn_artist_cancel.Visible = false;
            //btn_artist_save.Visible = false;
            cleanArtistTextBoxs();
        }

        private void cleanArtistTextBoxs()
        {
            txt_name.Text = "";
            txt_email.Text = "";
            txt_mobilenumber.Text = "";
            txt_zipcode.Text = "";
            txt_facebook.Text = "";
            txt_twitter.Text = "";
            txt_kakaoID.Text = "";
            txt_address.Text = "";
            txt_youraffiliation.Text = "";
        }


        public bool getPhoto(MusicianTbl info, int photonumber, FileUpload fileupload)
        {

            if (fileupload.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(fileupload.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Doc//artist//");
                    fileupload.SaveAs(path + fileupload.FileName);
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    return false;
                }

                manageFileUpload1();
                manageFileUpload2();
            }

            if (!fileupload.HasFiles) return false;

            if (photonumber == 1)
                info.Photo1 = fileupload.FileName;
            else
                info.Photo2 = fileupload.FileName;

            return true;
        }

        public void manageFileUpload1() {
            if (this.Session["FileUpload_photo1"] == null && FileUpload_photo1.HasFile)
            {
                this.Session["FileUpload_photo1"] = FileUpload_photo1;
            }
            else if (this.Session["FileUpload_photo1"] != null && FileUpload_photo1.HasFile)
            {
                FileUpload_photo1 = (FileUpload)this.Session["FileUpload_photo1"];
            }
            else if (FileUpload_photo1.HasFile)
            {
                this.Session["FileUpload_photo1"] = FileUpload_photo1;
            }
        }



        public void manageFileUpload2()
        {
            if (this.Session["FileUpload_photo2"] == null && FileUpload_photo2.HasFile)
            {
                this.Session["FileUpload_photo2"] = FileUpload_photo2;
            }
            else if (this.Session["FileUpload_photo2"] != null && FileUpload_photo2.HasFile)
            {
                FileUpload_photo2 = (FileUpload)this.Session["FileUpload_photo2"];
            }
            else if (FileUpload_photo2.HasFile)
            {
                this.Session["FileUpload_photo2"] = FileUpload_photo2;
            }
        }


    }
}