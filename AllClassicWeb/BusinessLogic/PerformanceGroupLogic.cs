using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class PerformanceGroupLogic
    {
        public static PerformanceGroupTbl addPerformanceGroup(PerformanceGroupTbl pg) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.PerformanceGroupTbls.Add(pg);
                entities.SaveChanges();
                return pg;
            }
            catch (Exception ee) {
                return null;
            }

        }
    }
}
