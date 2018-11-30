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
    public partial class RepairShopDBAddNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                handleButtons(true);
                if (Session["updateRepairShop"] != null)
                {
                    if (Boolean.Parse(Session["updateRepairShop"].ToString()) == true)
                    {
                        handleButtons(false);
                        var RepairShop = RepairShopLogic.getRepairShopbyID(int.Parse(Session["RepairShopID"].ToString()));
                        Session["selectedRepairShop"] = RepairShop;
                        txt_shopname.Text = RepairShop.Name;
                        txt_alias.Text = RepairShop.Alias;
                        txt_experties.Text = RepairShop.Expertise;
                        txt_ownername.Text = RepairShop.OwnerName;
                        txt_sinceyear.Text = RepairShop.SinceYear;
                        txt_email.Text = RepairShop.EmailID;
                        txt_zipcode.Text = RepairShop.ZipCode;
                        txt_address.Text = RepairShop.Address;
                        txt_telno.Text = RepairShop.TelNo;
                        txt_faxno.Text = RepairShop.FaxNo;
                        txt_homepage.Text = RepairShop.HomePage;
                    }
                }
            }
        }

        protected void btn_repairshop_cancel_Click(object sender, EventArgs e)
        {
            txt_shopname.Text ="";
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
            Session["updateRepairShop"] = null;

            handleButtons(true);
        }
        protected void btn_repairshop_save_Click(object sender, EventArgs e)
        {

            try
            {
                RepairShopTbl r = (RepairShopTbl)Session["selectedRepairShop"];
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

                r = BusinessLogic.RepairShopLogic.updateRepairshop(r);
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

        protected void btn_repairshop_add_Click(object sender, EventArgs e)
        {
            try
            {
                RepairShopTbl r = new RepairShopTbl();
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

                r = BusinessLogic.RepairShopLogic.registerRepairShop(r);
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



        public void handleButtons(Boolean value)
        {
            btn_repairshop_add.Visible = value;
            btn_repairshop_save.Visible = !value;
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

        protected void DropDownList3_city_DataBound(object sender, EventArgs e)
        {
            if (Boolean.Parse(Session["updateRepairShop"].ToString()) == true)
            {
                try
                { 
                    RepairShopTbl repairShop = (RepairShopTbl)Session["selectedRepairShop"];
                    DropDownList3_city.Items.FindByValue(repairShop.City.ToString()).Selected = true;
                }
                catch (Exception ee) { }
            }
        }
    }
}