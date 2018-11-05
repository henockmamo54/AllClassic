using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class PerformanceGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void onclick_btn_addNewPerformanceGroup(object sender, EventArgs e) {
            Response.Redirect("PerformanceGroupAddNew.aspx");
        }
    }
}