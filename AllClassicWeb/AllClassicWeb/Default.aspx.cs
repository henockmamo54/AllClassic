using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace AllClassicWeb
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            yearlabel.Text = DateTime.Now.Year.ToString();
            datelabel.Text = DateTime.Now.Date.Day.ToString();
        }

        public void performancepageclicked(object sender, CommandEventArgs e)
        {

            var x = e.CommandArgument;
            Response.Redirect("~/Views/PerformanceDetail.aspx?PID=" + x);
        }

        protected void artistListContainer_ondatabound(object sender, EventArgs e)
        {
            //label_countofitems.Text = artistListContainer.Items.Count + "";
        }

        protected void dateselectorcalendar_SelectionChanged(object sender, CommandEventArgs e)
        {
            var currentDate = DateTime.Now;
            var selectedDate = int.Parse(e.CommandArgument.ToString());

            var newdate = new DateTime(currentDate.Year, currentDate.Month, selectedDate);
            Session["PreviousSelectedDate"] = newdate;

            HtmlGenericControl[] datecontainers = { date01, date02, date03, date04, date05, date06, date07, date08, date09,date10,date11,date12,date13,date14,
                date15,date16,date17,date18,date19,date20,date21,date22,date23,date24,date25,date26,date27,date28,date29,date30,date31 };

            foreach (HtmlGenericControl hc in datecontainers)
            {
                hc.Attributes.Remove("class");

            }
            datecontainers[selectedDate - 1].Attributes.Add("class", "on");
             
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
            artistListContainer.DataBind(); 
        }


    }
}