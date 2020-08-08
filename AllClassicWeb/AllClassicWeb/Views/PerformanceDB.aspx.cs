﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessP;
using BusinessLogic;
using System.Data.Entity.SqlServer;
using System.Web.UI.HtmlControls;
using System.ComponentModel.DataAnnotations;

namespace AllClassicWeb.Views
{
    public partial class PerformanceDB : System.Web.UI.Page
    {
        AllClassicDBEntities entity = new AllClassicDBEntities();
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            yearlabel.Text = DateTime.Now.Year.ToString();
            datelabel.Text = DateTime.Now.Date.Day.ToString();

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "handletab();", true);

            if (!IsPostBack)
            {
                Session["previousSelectedLocation"] = null;
                Session["PreviousSelectedDate"] = null;

                try
                {
                    repeater_thisweekPerformanceInfo.DataSource = entity.PerformanceTbls.Where(x => SqlFunctions.DatePart("ISO_WEEK", x.StartDate) == SqlFunctions.DatePart("ISO_WEEK", DateTime.Today) & x.EndDate > DateTime.Now).ToList();
                    repeater_thisweekPerformanceInfo.DataBind();
                    //label_countofitems.Text = artistListContainer.Items.Count + "";
                }
                catch (Exception ee)
                {

                }
            }
        }

        protected void artistListContainer_ondatabound(object sender, EventArgs e)
        {
            //label_countofitems.Text = artistListContainer.Items.Count + "";
        }

        protected void onclick_btn_addPG(object sender, EventArgs e)
        {
            if (user != null)
            {
                Session["PID"] = null;
                Session["updatePerformance"] = false;
                Response.Redirect("~/Views/PerformanceDBAddNew.aspx");
            }
            else showMsg(Resources.DisplayText.Pleasesignintocontinue);
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        protected void dateselectorArrow_SelectionChanged(object sender, CommandEventArgs e)
        {
            var selectedarrow = (e.CommandArgument.ToString());

            DateTime selectedDate = DateTime.Now;

            if (Session["PreviousSelectedDate"] != null)
                selectedDate = ((DateTime)Session["PreviousSelectedDate"]);

            int dayvalue = selectedDate.Day;
            if ((dayvalue == 1) & (selectedarrow == "-"))
            {
                dayvalue = 31;

            }
            else if ((dayvalue == 31) & (selectedarrow == "+"))
            {
                dayvalue = 1;
            }
            else
            {

                if (selectedarrow == "+") dayvalue = dayvalue + 1;
                else if (selectedarrow == "-") dayvalue = dayvalue - 1;
            }


            handle_selectionChangeForArrowSelector(dayvalue);

        }

        public void handle_selectionChangeForArrowSelector(int dayvalue)
        {

            datelabel.Text = dayvalue.ToString();


            handelTheClassForTheDateSelectors(dayvalue);

            filterPerformance();
        }

        protected void dateselectorcalendar_SelectionChanged(object sender, CommandEventArgs e)
        {
            var selectedDate = int.Parse(e.CommandArgument.ToString());

            handelTheClassForTheDateSelectors(selectedDate);
            handle_selectionChangeForArrowSelector(selectedDate);

            filterPerformance();
        }

        public void handelTheClassForTheDateSelectors(int selectedDate)
        {
            var currentDate = DateTime.Now;
            var newdate = new DateTime(currentDate.Year, currentDate.Month, selectedDate);
            Session["PreviousSelectedDate"] = newdate;

            HtmlGenericControl[] datecontainers = { date01, date02, date03, date04, date05, date06, date07, date08, date09,date10,date11,date12,date13,date14,
                date15,date16,date17,date18,date19,date20,date21,date22,date23,date24,date25,date26,date27,date28,date29,date30,date31 };

            foreach (HtmlGenericControl hc in datecontainers)
            {
                hc.Attributes.Remove("class");

            }
            datecontainers[selectedDate - 1].Attributes.Add("class", "on");
        }
        public void dateclicked(object sender, EventArgs e)
        {

        }
        public void btnClearSelection(object sender, EventArgs e)
        {
            //dateselectorcalendar.SelectedDates.Clear();
            filterPerformance();
        }

        public void filterPerformance()
        {
            var selectedDate = (dynamic)null;
            var null_date = DateTime.Parse("1/1/0001 12:00:00 AM", System.Globalization.CultureInfo.InvariantCulture);
            selectedDate = null_date;
            if (Session["PreviousSelectedDate"] != null) selectedDate = (DateTime)Session["PreviousSelectedDate"];
            //DateTime selectedDate = dateselectorcalendar.SelectedDate;

            LinkButton pb = (LinkButton)Session["previousSelectedLocation"];
            //selectedDate = null_date;

            string filter = "where p.enddate > getdate()";
            if (pb != null && selectedDate != null_date)
            {
                filter += @" and datepart(dd,p.startdate) =" + selectedDate.Day + " and datepart(mm,p.startdate) =" + selectedDate.Month + " and datepart(yy,p.startdate) =" + selectedDate.Year;
                if (pb.Text != "전체") filter += " and r.subcode = N'" + pb.Text + "' ";
            }
            else if (pb == null && selectedDate != null_date) filter += @" and datepart(dd,p.startdate) =" + selectedDate.Day + " and datepart(mm,p.startdate) =" + selectedDate.Month + " and datepart(yy,p.startdate) =" + selectedDate.Year;
            else if (pb != null && pb.Text != "전체" && selectedDate == null_date) filter += @" and r.subcode like N'%" + pb.Text + "%' ";


            SqlDataSource1_Performancelist.SelectCommand = @"DECLARE @fooTable table ( lookupid int, Maincode nvarchar(100), subcode  nvarchar(100))

                                                            INSERT INTO @fooTable 
                                                                select lookupid, Maincode, subcode from main.lookuptbl where maincode 
                                                            in ('PerformanceType','Conductor','Composer','Region','City') 


                                                            SELECT  p.*, pg.Name performancegroupname, pt.SubCode performancetype, cd.SubCode conductorname, cm.SubCode composerName, i.KoreanName instrumentname, r.SubCode regionname, c.SubCode cityname, v.Name venuname 
                                                            from Main.PerformanceTbl p
                                                            left join Main.PerformanceGroupTbl pg on p.PerformanceGroup=pg.PerformanceGroupID
                                                            left join Auxiliary.InstrumentTbl i on i.InstrumentID=p.MainInstrument
                                                            left join Auxiliary.VenueTbl v on v.VenueID =p.Venue
                                                            left join @fooTable pt on pt.LookUpID=p.PerformanceType
                                                            left join @fooTable cd on cd.LookUpID=p.Conductor
                                                            left join @fooTable cm on cm.LookUpID=p.MainTitleComposer
                                                            left join @fooTable r on r.LookUpID=p.Region
                                                            left join @fooTable c on c.LookUpID=p.City
                                                             " + filter + " order by p.UpdateTimeStamp desc";
            //artistListContainer.DataSource = SqlDataSource1_Performancelist;
            artistListContainer.DataBind();
            //label_countofitems.Text = artistListContainer.Items.Count + "";
        }


        public void repeater_locationOnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {

                if (Session["previousSelectedLocation"] != null)
                {
                    LinkButton pb = (LinkButton)Session["previousSelectedLocation"];
                    var detail = (LinkButton)item.FindControl("location");
                    if (detail.Text == pb.Text)
                    {
                        detail.BackColor = System.Drawing.ColorTranslator.FromHtml("#7d9596");// System.Drawing.Color.LightSkyBlue;
                        detail.ForeColor = System.Drawing.Color.White;
                    }
                }
                else
                {
                    // to select the first element on first load
                    var x = (LinkButton)item.FindControl("location");
                    if (x.Text == "전체")
                    {
                        // select it
                        Session["previousSelectedLocation"] = x;
                        x.BackColor = System.Drawing.ColorTranslator.FromHtml("#7d9596");// System.Drawing.Color.LightSkyBlue;
                        x.ForeColor = System.Drawing.Color.White;

                    }
                }
            }
        }

        public void performancepageclicked(object sender, CommandEventArgs e)
        {

            var x = e.CommandArgument;
            Response.Redirect("~/Views/PerformanceDetail.aspx?PID=" + x);
        }

        public void regionclicked(object sender, EventArgs e)
        {
            LinkButton pb = null;
            LinkButton b = (LinkButton)sender;
            b.BackColor = System.Drawing.ColorTranslator.FromHtml("#28878a");

            if (Session["previousSelectedLocation"] != null)
            {
                pb = (LinkButton)Session["previousSelectedLocation"];
                pb.BackColor = System.Drawing.Color.White;

            }

            if (pb != null)
            {
                if (b.Text == pb.Text) Session["previousSelectedLocation"] = null;
                else Session["previousSelectedLocation"] = sender;
            }
            else Session["previousSelectedLocation"] = sender;

            repeater_location.DataBind();

            filterPerformance();
        }


    }
}