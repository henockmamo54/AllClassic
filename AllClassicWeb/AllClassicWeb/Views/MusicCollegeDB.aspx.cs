using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class MusicCollegeDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void onclick_btn_addMusicCollege(object sender, EventArgs e)
        {
            Session["MusicCollegeID"] = null;
            Session["updateMusicCollege"] = false;
            Response.Redirect("MusicCollegeDBAddNew.aspx");
        }

        

    }
}