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
            Session["MusicianID"] = 18;
            Session["updateMusician"] = true;
            Response.Redirect("MusicianDBAddNew.aspx");
        }

        protected void btnPageChange_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)sender;
            var item = (RepeaterItem)btn.NamingContainer;
            var iPage = (item.FindControl("hdValue") as HiddenField).Value;
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            if (url.IndexOf("?") > 0)
            {
                url = url.Substring(0, url.IndexOf("?"));
            }
            Response.Redirect(url + "?page=" + iPage);
        }

        protected void rpPaging_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var btn = (LinkButton)item.FindControl("btnPageChange");
                var hdValue = (HiddenField)item.FindControl("hdValue");
                if (hdValue.Value == "-1")
                {
                    btn.Text = "...";
                    btn.Enabled = false;
                }
            }
        }

    }
}