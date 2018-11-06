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

        public static PerformanceGroupTbl getPerformanceGroupByID(int performanceGroupID)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.PerformanceGroupTbls.Where(x => x.PerformanceGroupID == performanceGroupID).FirstOrDefault();
        }

        public static PerformanceGroupTbl UpdatePerformanceGroupTbl(PerformanceGroupTbl performancegroup) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                var pg = entities.PerformanceGroupTbls.Where(x => x.PerformanceGroupID == performancegroup.PerformanceGroupID).FirstOrDefault();
                pg.Name = performancegroup.Name;
                pg.Alias = performancegroup.Alias;
                pg.GroupType = performancegroup.GroupType;
                pg.City = performancegroup.City;
                pg.Conductor = performancegroup.Conductor;
                pg.SinceYear = performancegroup.SinceYear;
                pg.EmailID = performancegroup.EmailID;
                pg.Address = performancegroup.Address;
                pg.ZipCode = performancegroup.ZipCode;
                pg.TelNo = performancegroup.TelNo;
                pg.FaxNo = performancegroup.FaxNo;
                pg.HomePage = performancegroup.HomePage;
                entities.SaveChanges();
                return pg;
            }
            catch (Exception e) {
                return null;
            }
        }
    }
}
