using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessP;
using BusinessLogic;
using System.Data.Entity.SqlServer;

namespace AllClassicWeb.Views
{
    public partial class PerformanceDB : System.Web.UI.Page
    {
        AllClassicDBEntities entity = new AllClassicDBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "handletab();", true);

            if (!IsPostBack)
            {
                Session["previousSelectedLocation"] = null;

                try
                {
                    repeater_thisweekPerformanceInfo.DataSource = entity.PerformanceTbls.Where(x => SqlFunctions.DatePart("ISO_WEEK", x.StartDate) == SqlFunctions.DatePart("ISO_WEEK", DateTime.Today)).ToList();
                    repeater_thisweekPerformanceInfo.DataBind();
                    label_countofitems.Text = artistListContainer.Items.Count + "";
                }
                catch (Exception ee) {

                }
            }
        }

        protected void artistListContainer_ondatabound(object sender, EventArgs e)
        {
            label_countofitems.Text = artistListContainer.Items.Count + "";
        }

        protected void onclick_btn_addPG(object sender, EventArgs e)
        {
            Session["PID"] = null;
            Session["updatePerformance"] = false;
            Response.Redirect("PerformanceDBAddNew.aspx");
        }


        protected void dateselectorcalendar_SelectionChanged(object sender, EventArgs e)
        {
            //if (Session["PreviousSelectedDate"] != null)
            //{
            //    DateTime previousdate = (DateTime)Session["PreviousSelectedDate"];
            //    //Session["PreviousSelectedDate"] = dateselectorcalendar.SelectedDate;
            //    if (previousdate == dateselectorcalendar.SelectedDate) dateselectorcalendar.SelectedDates.Clear();

            //}
            //else Session["PreviousSelectedDate"] = dateselectorcalendar.SelectedDate;

            filterPerformance();
            
        }

        public void btnClearSelection(object sender, EventArgs e) {
            dateselectorcalendar.SelectedDates.Clear();
            filterPerformance();
        }

        public void filterPerformance()
        {

            DateTime selectedDate = dateselectorcalendar.SelectedDate;
            Button pb = (Button)Session["previousSelectedLocation"];
            var null_date = DateTime.Parse("1/1/0001 12:00:00 AM", System.Globalization.CultureInfo.InvariantCulture);

            string filter = "";
            if (pb != null && selectedDate != null_date)
            {
                filter = @" where datepart(dd,p.startdate) =" + selectedDate.Day + " and datepart(mm,p.startdate) =" + selectedDate.Month + " and datepart(yy,p.startdate) =" + selectedDate.Year; 
                if(pb.Text != "전체") filter+= "' and r.subcode = N'" + pb.Text + "' ";
            }
            else if (pb == null && selectedDate != null_date) filter = @" where datepart(dd,p.startdate) =" + selectedDate.Day + " and datepart(mm,p.startdate) =" + selectedDate.Month + " and datepart(yy,p.startdate) =" + selectedDate.Year;
            else if (pb != null && pb.Text != "전체" && selectedDate == null_date) filter = @"where r.subcode like N'%" + pb.Text + "%' ";


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
            label_countofitems.Text = artistListContainer.Items.Count + "";
        }


        public void repeater_locationOnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {

                if (Session["previousSelectedLocation"] != null)
                {
                    Button pb = (Button)Session["previousSelectedLocation"];
                    var detail = (Button)item.FindControl("location");
                    if (detail.Text == pb.Text)
                    {
                        detail.BackColor = System.Drawing.ColorTranslator.FromHtml("#28878a");// System.Drawing.Color.LightSkyBlue;
                        detail.ForeColor = System.Drawing.Color.White;
                    }
                }
                else
                {
                    // to select the first element on first load
                    var x = (Button)item.FindControl("location");
                    if (x.Text == "전체")
                    {
                        // select it
                        Session["previousSelectedLocation"] = x;
                        x.BackColor = System.Drawing.ColorTranslator.FromHtml("#28878a");// System.Drawing.Color.LightSkyBlue;
                        x.ForeColor = System.Drawing.Color.White;

                    }
                }
            }
        }

        public void performancepageclicked(object sender, CommandEventArgs e)
        {

            var x = e.CommandArgument;
            Response.Redirect("PerformanceDetail.aspx?PID=" + x);
        }

        public void regionclicked(object sender, EventArgs e)
        {
            Button pb = null;
            Button b = (Button)sender;
            b.BackColor = System.Drawing.ColorTranslator.FromHtml("#28878a");

            if (Session["previousSelectedLocation"] != null)
            {
                pb = (Button)Session["previousSelectedLocation"];
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