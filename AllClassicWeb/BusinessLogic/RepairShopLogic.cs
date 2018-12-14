using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class RepairShopLogic
    {
        public static RepairShopTbl registerRepairShop(RepairShopTbl r) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.RepairShopTbls.Add(r);
                entities.SaveChanges();
                return r;
            }
            catch (Exception ee) {
                return null;
            }
        }

        public static RepairShopTbl updateRepairshop(RepairShopTbl repairShop) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                RepairShopTbl r = entities.RepairShopTbls.Where(x => x.RepairShopID == repairShop.RepairShopID).FirstOrDefault();
                r.Name = repairShop.Name;
                r.Alias = repairShop.Alias;
                r.Expertise = repairShop.Expertise;
                r.City = repairShop.City;
                r.OwnerName = repairShop.OwnerName;
                r.SinceYear = repairShop.SinceYear;
                r.EmailID = repairShop.EmailID;
                r.Address = repairShop.Address;
                r.ZipCode = repairShop.ZipCode;
                r.TelNo = repairShop.TelNo;
                r.FaxNo = repairShop.FaxNo;
                r.HomePage = repairShop.HomePage;
                r.UpdateTimeStamp = DateTime.Now;
                r.UserID = 5;
                entities.SaveChanges();
                return r;
            }
            catch (Exception ee)
            {
                return null;
            }
        }

        public static RepairShopTbl getRepairShopbyID(int id) {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.RepairShopTbls.Where(x => x.RepairShopID == id).FirstOrDefault();
        }

        public static bool deleteRepairShop(int id) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.RepairShopTbls.Remove(entities.RepairShopTbls.Where(x => x.RepairShopID == id).FirstOrDefault());
                entities.SaveChanges();
                return true;
            }
            catch (Exception ee) {
                return false;
            }
        }
    }
}
