using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessP;

namespace AllClassicWeb.Views
{
    public partial class AccountVerification : System.Web.UI.Page
    {
        int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
                userID = int.Parse(Request.QueryString["ID"]);
            UserTbl user = new UserTbl();
        }
    }
}