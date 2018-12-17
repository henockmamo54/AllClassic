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
    public partial class MusicShopDBAddNew : System.Web.UI.Page
    {
        static UserTbl user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserTbl)Session["User"];
            if (!IsPostBack)
            {
                handleButtons(true);
                if (Session["updateMusicShop"] != null)
                {
                    if (Boolean.Parse(Session["updateMusicShop"].ToString()) == true)
                    {
                        handleButtons(false);
                        var musicShop = MusicShopLogic.getMusicshopByID(int.Parse(Session["MusicShopID"].ToString()));
                        Session["selectedMusicShop"] = musicShop;
                        txt_shopname.Text = musicShop.Name;
                        txt_alias.Text = musicShop.Alias;
                        txt_experties.Text = musicShop.Expertise;
                        txt_ownername.Text = musicShop.OwnerName;
                        txt_sinceyear.Text = musicShop.SinceYear;
                        txt_email.Text = musicShop.EmailID;
                        txt_zipcode.Text = musicShop.ZipCode;
                        txt_address.Text = musicShop.Address;
                        txt_telno.Text = musicShop.TelNo;
                        txt_faxno.Text = musicShop.FaxNo;
                        txt_homepage.Text = musicShop.HomePage;
                    }
                }
            }
        }

        protected void btn_musicshop_cancel_Click(object sender, EventArgs e)
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
            Session["updateMusicShop"] = null;

            handleButtons(true);
        }

        protected void btn_musicshop_save_Click(object sender, EventArgs e)
        {
            try
            {
                MusicShopTbl r = (MusicShopTbl)Session["selectedMusicShop"];
                r.Name = txt_shopname.Text;
                r.Alias = txt_alias.Text;
                r.Expertise = txt_experties.Text;
                r.City = DropDownList3_city.SelectedItem.Value;
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

                r = BusinessLogic.MusicShopLogic.updateMusicShop(r);
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
            btn_musicshop_add.Visible = value;
            btn_musicshop_save.Visible = !value;
        }


        protected void btn_musicshop_add_Click(object sender, EventArgs e)
        {
            try
            {
                MusicShopTbl r = new MusicShopTbl();
                r.Name = txt_shopname.Text;
                r.Alias = txt_alias.Text;
                r.Expertise = txt_experties.Text;
                r.City = DropDownList3_city.SelectedItem.Value;
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

                r = BusinessLogic.MusicShopLogic.registerMusicShop(r);
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
            if (Boolean.Parse(Session["updateMusicShop"].ToString()) == true)
            {
                try
                {
                    MusicShopTbl MusicShop = (MusicShopTbl)Session["selectedMusicShop"];
                    DropDownList3_city.Items.FindByValue(MusicShop.City.ToString()).Selected = true;
                }
                catch (Exception ee) { }
            }
        }
    }

}