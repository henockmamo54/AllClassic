using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class MusicianDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void onclick_btn_addNewMusician(object sender, EventArgs e)
        {
            Response.Redirect("MusicianDBAddNew.aspx");
        }
    }
}