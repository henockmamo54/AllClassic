using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
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
    }
}