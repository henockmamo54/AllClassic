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
            if (!IsPostBack) {

                repeater_thisweekPerformanceInfo.DataSource = entity.PerformanceTbls.Where(x => SqlFunctions.DatePart("ISO_WEEK", x.StartDate) == SqlFunctions.DatePart("ISO_WEEK", DateTime.Today)).ToList();
                repeater_thisweekPerformanceInfo.DataBind();
                label_countofitems.Text = artistListContainer.Items.Count + "";
            }
        }

        protected void onclick_btn_addPG(object sender, EventArgs e)
        {
            //Session["MusicianID"] = null;
            //Session["updateMusician"] = false;
            Response.Redirect("PerformanceDBAddNew.aspx");
        }


        protected void dateselectorcalendar_SelectionChanged(object sender, EventArgs e)
        {
            if (Session["PreviousSelectedDate"] != null)
            {
                DateTime previousdate = (DateTime)Session["PreviousSelectedDate"];
                if (previousdate == dateselectorcalendar.SelectedDate) dateselectorcalendar.SelectedDates.Clear();

            }
            else Session["PreviousSelectedDate"] = dateselectorcalendar.SelectedDate;

            filterPerformance();
        }


        public void filterPerformance()
        {

            DateTime selectedDate = dateselectorcalendar.SelectedDate;
            Button pb = (Button)Session["previousSelectedLocation"];
            var null_date = DateTime.Parse("1/1/0001 12:00:00 AM", System.Globalization.CultureInfo.InvariantCulture);

            string filter = "";
            if (pb != null && selectedDate != null_date) filter = @"where startdate='" + selectedDate.ToShortDateString() + "' and location = N'" + pb.Text + "' ";
            else if (pb == null && selectedDate != null_date) filter = @"where startdate='" + selectedDate.ToShortDateString() + "' ";
            else if (pb != null && selectedDate == null_date) filter = @"where location = N'" + pb.Text + "' ";


            //SqlDataSource2_allPerformances.SelectCommand = @"SELECT  p.*, OfficialName  FROM Main.Performance p
            //                                                join Core.Orchestra o on p.OrchestraID=o.ID " + filter + " order by timestamp desc";
            //repeater_performanceList.DataSource = SqlDataSource2_allPerformances;
            //repeater_performanceList.DataBind();
            //label_countofitems.Text = repeater_performanceList.Items.Count + "";
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
                    if (detail.Text == pb.Text) detail.BackColor = System.Drawing.Color.RosyBrown;
                }
            }

        }

    }
}