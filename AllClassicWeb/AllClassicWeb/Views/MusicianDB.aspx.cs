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

        protected void selectedFilterChanged(object sender, EventArgs e)
        {
            var filterQuery = "";
            if (DropDownList1_Majorfilter.SelectedIndex != 0) filterQuery += " where m.Major like N'%" + DropDownList1_Majorfilter.SelectedItem.Text + "%'";
            if (txt_repertoryfilter.Text.ToString().Length > 0)
            {
                if (DropDownList1_Majorfilter.SelectedIndex != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " m.Repertory like N'%" + txt_repertoryfilter.Text.ToString() + "%'";
            }
            if (txtbox_namefilter.Text.ToString().Length > 0)
            {
                if (DropDownList1_Majorfilter.SelectedIndex != 0 || txt_repertoryfilter.Text.ToString().Length > 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " m.Name like N'%" + txtbox_namefilter.Text + "%'";
            }

            SqlDataSource1_artistlist.SelectCommand = string.Format(@"SELECT top 20 m.*,u.EmailID FROM Main.[MusicianTbl] m
                join Main.UserTbl u on m.UserID=u.UserID"+filterQuery+@"
                order by m.UpdateTimeStamp desc");

            artistListContainer.DataBind();
        }

    }
}