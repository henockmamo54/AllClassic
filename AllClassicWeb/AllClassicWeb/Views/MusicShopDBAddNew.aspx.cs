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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_repairshop_cancel_Click(object sender, EventArgs e)
        {

        }

        protected void btn_repairshop_add_Click(object sender, EventArgs e)
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
                r.UserID = 5;

                r = BusinessLogic.MusicShopLogic.registerMusicShop(r);
                if (r != null)
                {
                    showMsg("Data inserted succssfuly");
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


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }
    }

}