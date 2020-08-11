using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccessP;
using BusinessLogic;

namespace AllClassicWeb.Views
{
    public partial class ConcertVenuDBAddNew : System.Web.UI.Page
    {
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            if (!IsPostBack)
            {
                handleButtons(true);
                if (Session["updateConcertVenu"] != null)
                {
                    if (Boolean.Parse(Session["updateConcertVenu"].ToString()) == true)
                    {
                        handleButtons(false);
                        VenueTbl venu = VenuLogic.getVenuByID(int.Parse(Session["ConcertVenuID"].ToString()));
                        Session["selectedVenu"] = venu;
                        txt_shopname.Text = venu.Name;
                        txt_alias.Text = venu.Alias;
                        //txt_experties.Text = venu.exp;
                        txt_ownername.Text = venu.OwnerName;
                        txt_sinceyear.Text = venu.SinceYear;
                        txt_email.Text = venu.EmailID;
                        txt_zipcode.Text = venu.ZipCode;
                        txt_address.Text = venu.Address;
                        txt_telno.Text = venu.TelNo;
                        txt_faxno.Text = venu.FaxNo;
                        txt_homepage.Text = venu.HomePage;
                    }
                }
            }
        }


        protected void btn_concertvenu_cancel_Click(object sender, EventArgs e)
        {

            txt_shopname.Text = "";
            txt_alias.Text = "";
            txt_experties.Text = "";
            txt_ownername.Text = "";
            txt_sinceyear.Text = "";
            txt_email.Text = "";
            txt_zipcode.Text = "";
            txt_address.Text = "";
            txt_telno.Text = "";
            txt_faxno.Text = "";
            txt_homepage.Text = "";
            Session["updateConcertVenu"] = null;

            handleButtons(true);
            Response.Redirect("~/Views/ConcertVenuDB.aspx");
        }

        protected void btn_concertvenu_save_Click(object sender, EventArgs e)
        {
            try
            {
                VenueTbl r = (VenueTbl)Session["selectedVenu"];
                r.Name = txt_shopname.Text;
                r.Alias = txt_alias.Text;
                //r.Expertise = txt_experties.Text;
                r.City = int.Parse(DropDownList3_city.SelectedItem.Value);
                r.OwnerName = txt_ownername.Text;
                r.SinceYear = txt_sinceyear.Text;
                r.EmailID = txt_email.Text;
                r.Address = txt_address.Text;
                r.ZipCode = txt_zipcode.Text;
                r.TelNo = txt_telno.Text;
                r.FaxNo = txt_faxno.Text;
                r.HomePage = txt_homepage.Text;
                r.UpdateTimeStamp = DateTime.Now;
                r.UserID = user.UserID;

                r = BusinessLogic.VenuLogic.updateConcertVenu(r);
                if (r != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");
                }
                else
                {
                    showMsg("Please check your inputs");
                }
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }
        }


        public void handleButtons(Boolean value)
        {
            btn_concertvenu_add.Visible = value;
            btn_concertvenu_save.Visible = !value;
        }



        protected void btn_concertvenu_add_Click(object sender, EventArgs e)
        {
            try
            {
                VenueTbl r = new VenueTbl();
                r.Name = txt_shopname.Text;
                r.Alias = txt_alias.Text;
                //r.Expertise = txt_experties.Text;
                r.City = int.Parse(DropDownList3_city.SelectedItem.Value);
                r.OwnerName = txt_ownername.Text;
                r.SinceYear = txt_sinceyear.Text;
                r.EmailID = txt_email.Text;
                r.Address = txt_address.Text;
                r.ZipCode = txt_zipcode.Text;
                r.TelNo = txt_telno.Text;
                r.FaxNo = txt_faxno.Text;
                r.HomePage = txt_homepage.Text;
                r.UpdateTimeStamp = DateTime.Now;
                r.UserID = user.UserID;

                r = BusinessLogic.VenuLogic.registerConcertVenu(r);
                if (r != null)
                {
                    showMsg_withredirect("Data inserted succssfuly");
                }
                else
                {
                    showMsg("Please check your inputs");
                }
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }

        }



        public void showMsg_withredirect(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "ShowMessage()", true);
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

        protected void DropDownList3_city_DataBound(object sender, EventArgs e)
        {
            try
            {
                if (Session["updateConcertVenu"] != null && Boolean.Parse(Session["updateConcertVenu"].ToString()) == true)
                {
                    try
                    {
                        VenueTbl MusicShop = (VenueTbl)Session["selectedVenu"];
                        DropDownList3_city.Items.FindByValue(MusicShop.City.ToString()).Selected = true;
                    }
                    catch (Exception ee) { }
                }
            }
            catch (Exception ex) { }
        }
    }
}