using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class PerformanceArchiveDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Poppdadnew", "bindDateTime();", true);
        }

        public void performancepageclicked(object sender, CommandEventArgs e)
        {

            var x = e.CommandArgument;
            Response.Redirect("PerformanceDetail.aspx?PID=" + x);
        }


        public void filterPerformance(object sender, EventArgs e)
        {
            var filterQuery = "";

            if (startdate.Value.Length != 0)
            {
                var date = DateTime.ParseExact(startdate.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  datepart(dd,p.startdate) =" + date.Day + " and datepart(mm,p.startdate) =" + date.Month + " and datepart(yy,p.startdate) =" + date.Year;
            }

            if (enddate.Value.Length != 0)
            {
                var date = DateTime.ParseExact(enddate.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  datepart(dd,p.enddate) =" + date.Day + " and datepart(mm,p.enddate) =" + date.Month + " and datepart(yy,p.enddate) =" + date.Year;
            }


            if (txt_maintitle.Text.Length != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.MainTitle like N'%" + txt_maintitle.Text + "%'";
            }


            if (txt_subtitle.Text.Length != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.SubTitle like N'%" + txt_subtitle.Text + "%'";
            }


            if (txt_subjecttheme.Text.Length != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.Subject like N'%" + txt_subjecttheme.Text + "%'";
            }


            if (DropDownList1_grouptype.SelectedIndex != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.PerformanceGroup like N'%" + DropDownList1_grouptype.SelectedItem.Value + "%'";
            }

            if (DropDownList1_performancetype.SelectedIndex != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.PerformanceType like N'%" + DropDownList1_performancetype.SelectedItem.Value + "%'";
            }

            if (DropDownList1_conductors.SelectedIndex != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.Conductor like N'%" + DropDownList1_conductors.SelectedItem.Value + "%'";
            }


            if (DropDownList1_composer.SelectedIndex != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.MainTitleComposer like N'%" + DropDownList1_composer.SelectedItem.Value + "%'";
            }


            if (DropDownList2_maininstrument.SelectedIndex != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.MainInstrument like N'%" + DropDownList2_maininstrument.SelectedItem.Value + "%'";
            }


            if (txt_organizer.Text.Length != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.Organizer like N'%" + txt_organizer.Text + "%'";
            }

            if (txt_sponser.Text.Length != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.Sponser like N'%" + txt_sponser.Text + "%'";
            }


            if (DropDownList4_region.SelectedIndex != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.Region like N'%" + DropDownList4_region.SelectedItem.Value + "%'";
            }


            if (DropDownList1_venu.SelectedIndex != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.Venue like N'%" + DropDownList1_venu.SelectedItem.Value + "%'";
            }

            if (DropDownList3_city.SelectedIndex != 0)
            {
                if (filterQuery.Length == 0) filterQuery += " where ";
                else filterQuery += " and ";
                filterQuery += "  p.City like N'%" + DropDownList3_city.SelectedItem.Value + "%'";
            }

            

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
                                                             " + filterQuery + " order by p.UpdateTimeStamp desc";
            artistListContainer.DataBind();
        }


    }
}