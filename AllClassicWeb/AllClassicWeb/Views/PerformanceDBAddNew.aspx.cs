using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using DataAccessP;

namespace AllClassicWeb.Views
{
    public partial class PerformanceDBAddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Poppdadnew", "bindDateTime();", true);
            manageFileUpload1();
        }

        public void onclick_btn_addArtistInstrumentcomb(object sender, EventArgs e)
        {
            PerformanceMusicianInstrumentTbl pt = new PerformanceMusicianInstrumentTbl();

            pt.InstrumentID = int.Parse(DropDownList3_instrumentlist.SelectedItem.Value.ToString());
            pt.MusicianID = int.Parse(DropDownList2_artistlist.SelectedItem.Value.ToString());

            pt.InstrumentTbl = new InstrumentTbl();
            pt.InstrumentTbl.KoreanName = DropDownList3_instrumentlist.SelectedItem.Text;

            pt.MusicianTbl = new MusicianTbl();
            pt.MusicianTbl.Name = DropDownList2_artistlist.SelectedItem.Text;

            if (Session["PerformanceMusicianInstrumentTbl"] != null)
            {
                List<PerformanceMusicianInstrumentTbl> mylist = (List<PerformanceMusicianInstrumentTbl>)Session["PerformanceMusicianInstrumentTbl"];
                mylist.Add(pt);

                myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
                myPerformanceDetailArtistInstrumentlist.DataBind();

                Session["PerformanceMusicianInstrumentTbl"] = mylist;
            }
            else
            {
                List<PerformanceMusicianInstrumentTbl> mylist = new List<PerformanceMusicianInstrumentTbl>();
                mylist.Add(pt);

                myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
                myPerformanceDetailArtistInstrumentlist.DataBind();

                Session["PerformanceMusicianInstrumentTbl"] = mylist;
            }


        }

        public void btn_remove_ArtistInstrument_tolist(object sender, EventArgs e)
        {
            if (Session["PerformanceMusicianInstrumentTbl"] != null)
            {
                Button btn = (Button)sender;
                var ids = btn.CommandArgument.ToString().Split(',');
                int artistID = int.Parse(ids[0]);
                int instrumentID = int.Parse(ids[1]);
                List<PerformanceMusicianInstrumentTbl> mylist = (List<PerformanceMusicianInstrumentTbl>)Session["PerformanceMusicianInstrumentTbl"];

                mylist.RemoveAll(x => x.MusicianID == artistID & x.InstrumentID == instrumentID);
                myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
                myPerformanceDetailArtistInstrumentlist.DataBind();
                Session["myPerformanceDetailArtistInstrumentlist"] = mylist;
            }
        }

        public void btn_Performanceadd_Click(object sender, EventArgs e)
        {
            try
            {
                PerformanceTbl pt = new PerformanceTbl();
                pt.MainTitle = txt_maintitle.Text;
                pt.SubTitle = txt_subtitle.Text;
                pt.Subject = txt_subjecttheme.Text;
                pt.PerformanceGroup = int.Parse(DropDownList1_grouptype.SelectedItem.Value.ToString());
                pt.PerformanceType = int.Parse(DropDownList1_performancetype.SelectedItem.Value.ToString());
                pt.Conductor = int.Parse(DropDownList1_conductors.SelectedItem.Value.ToString());
                pt.MainTitleComposer = int.Parse(DropDownList1_composer.SelectedItem.Value.ToString());
                if (DropDownList2_maininstrument.SelectedIndex != 0)
                    pt.MainInstrument = int.Parse(DropDownList2_maininstrument.SelectedItem.Value.ToString());
                pt.Organizer = txt_organizer.Text;
                pt.Sponser = txt_sponser.Text;
                pt.Language = txt_language.Text;
                pt.StartDate = DateTime.ParseExact(startdate.Value, "mm/dd/yyyy", CultureInfo.InvariantCulture);
                pt.EndDate = DateTime.ParseExact(enddate.Value, "mm/dd/yyyy", CultureInfo.InvariantCulture);
                pt.Time = txt_time.Text;
                pt.Region = int.Parse(DropDownList4_region.SelectedItem.Value.ToString());
                pt.City = int.Parse(DropDownList3_city.SelectedItem.Value.ToString());
                pt.Venue = int.Parse(DropDownList1_venu.SelectedItem.Value.ToString());
                getPhoto(pt, 1, FileUpload_photo1);
                pt.VideoFileName = txt_video.Text;
                pt.TicketBox = txt_ticketbox.Text;
                pt.Program = txt_program.Text;
                pt.Description = txt_description.Text;
                pt.UserID = 5;
                pt.UpdateTimeStamp = DateTime.Now;

                List<PerformanceMusicianInstrumentTbl> mylist = (List<PerformanceMusicianInstrumentTbl>)Session["PerformanceMusicianInstrumentTbl"];
                pt = BusinessLogic.PerformanceDBLogic.registerPerformance(mylist, pt);
                if (pt != null)
                {
                    showMsg("Data inserted succssfuly");
                    //cleanArtistTextBoxs();

                    //sending message to endorsers
                    //sendEmailToEndorser(x.Email, artist, x);

                }
                else showMsg("Please check your inputs");
            }
            catch (Exception ee)
            {
                showMsg("Data inserted succssfuly");
            }

        }
        public void btn_Performancesave_Click(object sender, EventArgs e)
        {

        }
        public void btn_Performancecancel_Click(object sender, EventArgs e)
        {

        }

        public bool getPhoto(PerformanceTbl info, int photonumber, FileUpload fileupload)
        {

            manageFileUpload1();
            if (fileupload.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(fileupload.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Doc//Performance//");
                    fileupload.SaveAs(path + fileupload.FileName);
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    return false;
                }

            }

            if (!fileupload.HasFiles) return false;

            if (photonumber == 1)
                info.PosterFileName = fileupload.FileName;
            //else
            //    info.Photo2 = fileupload.FileName;

            return true;
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

        public void manageFileUpload1()
        {
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


    }
}