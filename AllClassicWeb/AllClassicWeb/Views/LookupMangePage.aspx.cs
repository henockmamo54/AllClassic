using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class LookupMangePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {
                string success = "alert('Item deleted Successfully!');";
                ClientScript.RegisterStartupScript(typeof(Page), "MessageDisplay Item deleted S", success, true);
            }
            else {
                Response.Redirect("~/Views/LookupMangePage.aspx");
            }
        }

        protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            string success = "alert('Item inserted Item inserted Successfully!');";
            ClientScript.RegisterStartupScript(typeof(Page), "MessageDisplay", success, true);
        }

        protected void ListView1_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            string success = "alert('Item updated Successfully!');";
            ClientScript.RegisterStartupScript(typeof(Page), "MessageDisplay Item updated ", success, true);
        }

    }
}