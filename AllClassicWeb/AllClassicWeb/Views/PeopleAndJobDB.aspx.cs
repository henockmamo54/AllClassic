using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class PeopleAndJobDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void onclick_btn_addNew(object sender, EventArgs e) {

            Response.Redirect("PeopleAndJobDBAddNew.aspx");
        }

        public void selectedFilterChanged(object sender, EventArgs e) {

        }

    }
}