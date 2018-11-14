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
    }
}
