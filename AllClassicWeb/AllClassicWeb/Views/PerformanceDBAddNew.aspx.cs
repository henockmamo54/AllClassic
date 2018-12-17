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
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Poppdadnew", "bindDateTime();", true);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "loadCkEditor", "loadCkEditor();", true);

            manageFileUpload1();
            if (!IsPostBack)
            {
                handleButtons(true);
                Session["PerformanceMusicianInstrumentTbl"] = null;
                if (Session["updatePerformance"] != null)
                {
                    if (Boolean.Parse(Session["updatePerformance"].ToString()) == true)
                    {
                        try
                        {
                            handleButtons(false);
                            load_performanceInfo(int.Parse(Session["PID"].ToString()));
                        }
                        catch (Exception myexception) { }
                    }
                }
            }
        }

        private void load_performanceInfo(int id)
        {

            Session["PerformanceMusicianInstrumentTbl"] = null;
            PerformanceTbl performance = BusinessLogic.PerformanceDBLogic.getPerfByID(id);
            if (performance != null)
            {
                Session["theSelectedPerformance"] = performance;
                txt_maintitle.Text = performance.MainTitle;
                txt_subtitle.Text = performance.SubTitle;
                txt_subjecttheme.Text = performance.Subject;
                txt_organizer.Text = performance.Organizer;
                txt_sponser.Text = performance.Sponser;
                txt_language.Text = performance.Language;
                txt_time.Text = performance.Time;
                txt_ticketbox.Text = performance.TicketBox;
                //txt_program.Text = performance.Program;
                txt_outline.InnerText = Server.HtmlDecode(performance.Program);
                txt_description.Text = performance.Description;
                startdate.Value = performance.StartDate.ToString("MM/dd/yyyy");
                enddate.Value = performance.EndDate.ToString("MM/dd/yyyy");


                var artistinstrumentlist = performance.PerformanceMusicianInstrumentTbls.ToList();
                if (artistinstrumentlist != null && artistinstrumentlist.Count > 0)
                {
                    Session["PerformanceMusicianInstrumentTbl"] = artistinstrumentlist;
                    myPerformanceDetailArtistInstrumentlist.DataSource = artistinstrumentlist;
                    myPerformanceDetailArtistInstrumentlist.DataBind();
                }

            }

        }

        public void handleButtons(Boolean value)
        {
            btn_Performance_add.Visible = value;
            btn_Performance_save.Visible = !value;
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
                if (DropDownList1_conductors.SelectedItem.Value.ToString() != "-1")
                    pt.Conductor = int.Parse(DropDownList1_conductors.SelectedItem.Value.ToString());
                if (DropDownList1_composer.SelectedItem.Value.ToString() != "-1")
                    pt.MainTitleComposer = int.Parse(DropDownList1_composer.SelectedItem.Value.ToString());
                if (DropDownList2_maininstrument.SelectedIndex != 0)
                    pt.MainInstrument = int.Parse(DropDownList2_maininstrument.SelectedItem.Value.ToString());
                pt.Organizer = txt_organizer.Text;
                pt.Sponser = txt_sponser.Text;
                pt.Language = txt_language.Text;
                pt.StartDate = DateTime.ParseExact(startdate.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                pt.EndDate = DateTime.ParseExact(enddate.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                pt.Time = txt_time.Text;
                pt.Region = int.Parse(DropDownList4_region.SelectedItem.Value.ToString());
                pt.City = int.Parse(DropDownList3_city.SelectedItem.Value.ToString());
                pt.Venue = int.Parse(DropDownList1_venu.SelectedItem.Value.ToString());
                getPhoto(pt, 1, FileUpload_photo1);
                pt.VideoFileName = txt_video.Text;
                pt.TicketBox = txt_ticketbox.Text;
                //pt.Program = txt_program.Text;
                var msg = Server.HtmlEncode(HiddenField2.Value);
                Session["txt_outline"] = msg;
                if (msg.Length > 399)
                {
                    showMsg("The Program content is more than the specified limit. please  minimize the content of the the Program.");
                    if (Session["txt_outline"] != null)
                    {
                        txt_outline.InnerText = Server.HtmlDecode(Session["txt_outline"].ToString());
                    }
                    return;
                }
                pt.Program = msg;

                pt.Description = txt_description.Text;
                pt.UserID = user.UserID;
                pt.UpdateTimeStamp = DateTime.Now;

                if (pt.PosterFileName == null)
                {
                    showMsg("Please input poster file!");
                    return;
                }

                List<PerformanceMusicianInstrumentTbl> mylist = (List<PerformanceMusicianInstrumentTbl>)Session["PerformanceMusicianInstrumentTbl"];
                PerformanceDBLogic.Result result = PerformanceDBLogic.registerPerformance(mylist, pt);
                pt = result.performance;
                if (pt != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");
                    //Response.Redirect("~/Views/PerformanceDB");
                }
                else showMsg(result.exception.Message);
            }
            catch (Exception ee)
            {
                showMsg(ee.Message);

                if (Session["txt_outline"] != null)
                {
                    txt_outline.InnerText = Server.HtmlDecode(Session["txt_outline"].ToString());
                }
            }

        }
        public void btn_Performancesave_Click(object sender, EventArgs e)
        {
            bool issuccess = false;
            PerformanceTbl pt = new PerformanceTbl();
            try
            {
                int id = int.Parse(Session["PID"].ToString());
                //pt = BusinessLogic.PerformanceDBLogic.getPerfByID(id);
                pt = (PerformanceTbl)Session["theSelectedPerformance"];
                pt.MainTitle = txt_maintitle.Text;
                pt.SubTitle = txt_subtitle.Text;
                pt.Subject = txt_subjecttheme.Text;
                pt.PerformanceGroup = int.Parse(DropDownList1_grouptype.SelectedItem.Value.ToString());
                pt.PerformanceType = int.Parse(DropDownList1_performancetype.SelectedItem.Value.ToString());
                if (DropDownList1_conductors.SelectedItem.Value.ToString() != "-1")
                    pt.Conductor = int.Parse(DropDownList1_conductors.SelectedItem.Value.ToString());
                if (DropDownList1_composer.SelectedItem.Value.ToString() != "-1")
                    pt.MainTitleComposer = int.Parse(DropDownList1_composer.SelectedItem.Value.ToString());
                if (DropDownList2_maininstrument.SelectedIndex != 0)
                    pt.MainInstrument = int.Parse(DropDownList2_maininstrument.SelectedItem.Value.ToString());
                pt.Organizer = txt_organizer.Text;
                pt.Sponser = txt_sponser.Text;
                pt.Language = txt_language.Text;
                pt.StartDate = DateTime.ParseExact(startdate.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                pt.EndDate = DateTime.ParseExact(enddate.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                pt.Time = txt_time.Text;
                pt.Region = int.Parse(DropDownList4_region.SelectedItem.Value.ToString());
                pt.City = int.Parse(DropDownList3_city.SelectedItem.Value.ToString());
                pt.Venue = int.Parse(DropDownList1_venu.SelectedItem.Value.ToString());
                getPhoto(pt, 1, FileUpload_photo1);
                pt.VideoFileName = txt_video.Text;
                pt.TicketBox = txt_ticketbox.Text;
                //pt.Program = txt_program.Text;
                var msg = Server.HtmlEncode(HiddenField2.Value);
                Session["txt_outline"] = msg;
                if (msg.Length > 399)
                {
                    showMsg("The Program content is more than the specified limit. please  minimize the content of the the Program.");
                    if (Session["txt_outline"] != null)
                    {
                        txt_outline.InnerText = Server.HtmlDecode(Session["txt_outline"].ToString());
                    }
                    return;
                }
                pt.Program = msg;

                pt.Description = txt_description.Text;
                pt.UserID = user.UserID;
                pt.UpdateTimeStamp = DateTime.Now;

                List<PerformanceMusicianInstrumentTbl> mylist = (List<PerformanceMusicianInstrumentTbl>)Session["PerformanceMusicianInstrumentTbl"];
                var listOfPreviouslist = pt.PerformanceMusicianInstrumentTbls.ToList();
                var currentlistlist = Session["PerformanceMusicianInstrumentTbl"] == null ? new List<PerformanceMusicianInstrumentTbl>() : (List<PerformanceMusicianInstrumentTbl>)Session["PerformanceMusicianInstrumentTbl"];
                var deleted = listOfPreviouslist.Except(currentlistlist).ToList();
                var added = currentlistlist.Except(listOfPreviouslist).ToList();

                pt = BusinessLogic.PerformanceDBLogic.updatePerformance(deleted, added, pt);
                if (pt != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");
                    issuccess = true;

                }
                else showMsg("Please check your inputs");
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");

                if (Session["txt_outline"] != null)
                {
                    txt_outline.InnerText = Server.HtmlDecode(Session["txt_outline"].ToString());
                }
            }
            if (issuccess)
                showMsg_withredirect("Data inserted succssfuly");
            //Response.Redirect("PerformanceDetail?PID=" + pt.PerformanceID);

        }
        public void btn_Performancecancel_Click(object sender, EventArgs e)
        {
            txt_maintitle.Text = "";
            txt_subtitle.Text = "";
            txt_subjecttheme.Text = "";
            txt_organizer.Text = "";
            txt_sponser.Text = "";
            txt_language.Text = "";
            txt_time.Text = "";
            txt_video.Text = "";
            txt_ticketbox.Text = "";
            txt_outline.InnerHtml = "";
            txt_description.Text = "";

            myPerformanceDetailArtistInstrumentlist.DataSource = null;
            myPerformanceDetailArtistInstrumentlist.DataBind();
            Session["myPerformanceDetailArtistInstrumentlist"] = null;

            //reset to new data entry mode
            handleButtons(true);

        }

        public bool getPhoto(PerformanceTbl info, int photonumber, FileUpload fileupload)
        {
            manageFileUpload1();
            if (fileupload.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(fileupload.FileName);
                
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string uniqueid = DateTime.Now.Year + "" + DateTime.Now.Month + "" + DateTime.Now.Day + "" + DateTime.Now.Hour + "" + DateTime.Now.Minute + "" + DateTime.Now.Second + "" + DateTime.Now.Millisecond;
                    string path = Server.MapPath("~//Doc//Performance//"); 
                    fileupload.SaveAs(path + uniqueid+ fileupload.FileName);
                    this.Session["FileUpload_photo1"] = FileUpload_photo1;

                    if (photonumber == 1)
                        info.PosterFileName = uniqueid+ fileupload.FileName;
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    return false;
                }

            }

            if (!fileupload.HasFiles) return false;

            //else
            //    info.Photo2 = fileupload.FileName;

            return true;
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        public void showMsg_withredirect(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "ShowMessage()", true);
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
            else
                this.Session["FileUpload_photo1"] = null;
        }

        protected void DropDownList1_grouptype_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePerformance"] != null && Boolean.Parse(Session["updatePerformance"].ToString()) == true)
            {
                int id = int.Parse(Session["PID"].ToString());
                //PerformanceTbl performance = PerformanceDBLogic.getPerfByID(id);
                PerformanceTbl performance = (PerformanceTbl)Session["theSelectedPerformance"];
                DropDownList1_grouptype.Items.FindByValue(performance.PerformanceGroup.ToString()).Selected = true;
            }
        }

        protected void DropDownList1_performancetype_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePerformance"] != null && Boolean.Parse(Session["updatePerformance"].ToString()) == true)
            {
                int id = int.Parse(Session["PID"].ToString());
                //PerformanceTbl performance = PerformanceDBLogic.getPerfByID(id);
                PerformanceTbl performance = (PerformanceTbl)Session["theSelectedPerformance"];
                DropDownList1_performancetype.Items.FindByValue(performance.PerformanceType.ToString()).Selected = true;
            }
        }

        protected void DropDownList1_conductors_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePerformance"] != null && Boolean.Parse(Session["updatePerformance"].ToString()) == true)
            {
                try
                {
                    int id = int.Parse(Session["PID"].ToString());
                    //PerformanceTbl performance = PerformanceDBLogic.getPerfByID(id);
                    PerformanceTbl performance = (PerformanceTbl)Session["theSelectedPerformance"];
                    if (performance.Conductor != null)
                        DropDownList1_conductors.Items.FindByValue(performance.Conductor.ToString()).Selected = true;
                }
                catch (Exception ee) { }
            }

        }

        protected void DropDownList1_composer_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePerformance"] != null && Boolean.Parse(Session["updatePerformance"].ToString()) == true)
            {
                int id = int.Parse(Session["PID"].ToString());
                //PerformanceTbl performance = PerformanceDBLogic.getPerfByID(id);
                PerformanceTbl performance = (PerformanceTbl)Session["theSelectedPerformance"];
                if (performance.MainTitleComposer != null)
                    DropDownList1_composer.Items.FindByValue(performance.MainTitleComposer.ToString()).Selected = true;
            }
        }

        protected void DropDownList2_maininstrument_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePerformance"] != null && Boolean.Parse(Session["updatePerformance"].ToString()) == true)
            {
                int id = int.Parse(Session["PID"].ToString());
                //PerformanceTbl performance = PerformanceDBLogic.getPerfByID(id);
                PerformanceTbl performance = (PerformanceTbl)Session["theSelectedPerformance"];
                if (performance.MainInstrument != null)
                    DropDownList2_maininstrument.Items.FindByValue(performance.MainInstrument.ToString()).Selected = true;
            }

        }

        protected void DropDownList4_region_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePerformance"] != null && Boolean.Parse(Session["updatePerformance"].ToString()) == true)
            {
                int id = int.Parse(Session["PID"].ToString());
                //PerformanceTbl performance = PerformanceDBLogic.getPerfByID(id);
                PerformanceTbl performance = (PerformanceTbl)Session["theSelectedPerformance"];
                DropDownList4_region.Items.FindByValue(performance.Region.ToString()).Selected = true;
            }
        }

        protected void DropDownList3_city_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePerformance"] != null && Boolean.Parse(Session["updatePerformance"].ToString()) == true)
            {
                int id = int.Parse(Session["PID"].ToString());
                //PerformanceTbl performance = PerformanceDBLogic.getPerfByID(id);
                PerformanceTbl performance = (PerformanceTbl)Session["theSelectedPerformance"];
                DropDownList3_city.Items.FindByValue(performance.City.ToString()).Selected = true;
            }

        }

        protected void DropDownList1_venu_DataBound(object sender, EventArgs e)
        {
            if (Session["updatePerformance"] != null && Boolean.Parse(Session["updatePerformance"].ToString()) == true)
            {
                int id = int.Parse(Session["PID"].ToString());
                //PerformanceTbl performance = PerformanceDBLogic.getPerfByID(id);
                PerformanceTbl performance = (PerformanceTbl)Session["theSelectedPerformance"];
                if (performance.Venue != null)
                    DropDownList1_venu.Items.FindByValue(performance.Venue.ToString()).Selected = true;
            }

        }
    }
}