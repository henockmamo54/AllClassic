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
    public partial class MusicCollegeDBAddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            manageFileUpload1();
            if (!IsPostBack)
            {
                handleButtons(true);
                manageFileUpload1();


                if (Session["updateMusicCollege"] != null)
                {
                    if (Boolean.Parse(Session["updateMusicCollege"].ToString()) == true)
                    {
                        try
                        {
                            handleButtons(false);
                            loadMuscianInfo(int.Parse(Session["MusicCollegeID"].ToString()));
                        }
                        catch (Exception loaingexception) { }
                    }
                }


            }
        }

        private void loadMuscianInfo(int v)
        {
            CollegeTbl c = BusinessLogic.CollegeLogic.getCollegeByID(v);
            txt_name.Text = c.Name;
            txt_shortname.Text = c.ShortName;
            txt_country.Text = c.Country;
            txt_homepage.Text = c.HomePage;
            txt_introduction.Text = c.Introduction;
            txt_locationmap.Text = c.LocationMap;

        }

        public void handleButtons(Boolean value)
        {
            btn_musiccollege_add.Visible = value;
            btn_musiccollege_save.Visible = !value;
        }


        public void btn_musiccollege_cancel_Click(object sender, EventArgs e)
        {
            txt_name.Text = "";
            txt_shortname.Text = "";
            txt_homepage.Text = "";
            txt_country.Text = "";
            txt_locationmap.Text = "";
            txt_introduction.Text = "";
            handleButtons(true);
        }

        public void btn_musiccollege_save_Click(object sender, EventArgs e)
        {
            try
            {
                CollegeTbl c = BusinessLogic.CollegeLogic.getCollegeByID(int.Parse(Session["MusicCollegeID"].ToString()));
                c.Name = txt_name.Text;
                c.ShortName = txt_shortname.Text;
                c.HomePage = txt_homepage.Text;
                c.Country = txt_country.Text;
                getPhoto(c, 1, FileUpload_photo1);
                c.LocationMap = txt_locationmap.Text;
                c.Introduction = txt_introduction.Text;
                c.UserID = 5;
                c.UpdateTimeStamp = DateTime.Now;

                c = BusinessLogic.CollegeLogic.updateCollege(c);
                if (c != null)
                {
                    showMsg("Data inserted succssfuly");
                    Response.Redirect("MusicCollegeDBDetail?ID=" + c.CollegeID);
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

        public void musiccollege_add_Click(object sender, EventArgs e)
        {
            try
            {
                CollegeTbl c = new CollegeTbl();
                c.Name = txt_name.Text;
                c.ShortName = txt_shortname.Text;
                c.HomePage = txt_homepage.Text;
                c.Country = txt_country.Text;
                getPhoto(c, 1, FileUpload_photo1);
                c.LocationMap = txt_locationmap.Text;
                c.Introduction = txt_introduction.Text;
                c.UserID = 5;
                c.UpdateTimeStamp = DateTime.Now;

                c = BusinessLogic.CollegeLogic.regesterCollege(c);
                if (c != null)
                {
                    showMsg("Data inserted succssfuly");
                    //issuccess = true;
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


        public bool getPhoto(CollegeTbl info, int photonumber, FileUpload fileupload)
        {
            fileupload= manageFileUpload1();
            if (fileupload.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(fileupload.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Doc//College//");
                    fileupload.SaveAs(path + fileupload.FileName);
                    this.Session["College_photo1"] = fileupload;
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    return false;
                }

            }

            if (!fileupload.HasFiles) return false;

            if (photonumber == 1)
                info.CollegePhoto = fileupload.FileName;
            //else
            //    info.Photo2 = fileupload.FileName;

            return true;
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        public FileUpload manageFileUpload1()
        {
            if (Session["College_photo1"] == null && FileUpload_photo1.HasFile)
            {
                Session["College_photo1"] = FileUpload_photo1;
            }
            else if (Session["College_photo1"] != null && FileUpload_photo1.HasFile)
            {
                Session["College_photo1"] = FileUpload_photo1;
                //FileUpload_photo1 = (FileUpload)Session["College_photo1"];
            }
            else if (Session["College_photo1"] != null && !FileUpload_photo1.HasFile)
            {
                FileUpload_photo1 = (FileUpload)Session["College_photo1"];
            }
            else if (FileUpload_photo1.HasFile)
            {
                Session["College_photo1"] = FileUpload_photo1;
            }
            else
                Session["College_photo1"] = null;

            return FileUpload_photo1;
        }


    }
}