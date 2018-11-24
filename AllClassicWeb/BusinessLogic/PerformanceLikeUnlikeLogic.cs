using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class PerformanceLikeUnlikeLogic
    {
        public static List<PerformanceLikeUnlikeTbl> getPerformanceLikeDislikeByPerformanceIDAndUserID(int performanceID, int userID)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.PerformanceLikeUnlikeTbls.Where(x => x.PerformanceID == performanceID & x.UserID == userID).ToList();
        }

        public static List<PerformanceLikeUnlikeTbl> getPerformanceLikeDislikeByPerformanceID(int performanceID)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.PerformanceLikeUnlikeTbls.Where(x => x.PerformanceID == performanceID).ToList();
        }

        public static void updatePerformanceLikeUnlike(PerformanceLikeUnlikeTbl status) {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            var likeunlike= entities.PerformanceLikeUnlikeTbls.Where(x => x.PerformanceID == status.PerformanceID & x.UserID == status.UserID).FirstOrDefault();
            likeunlike.islike = status.islike;
            entities.SaveChanges();            
        }
        public static void addLikeUnlike(PerformanceLikeUnlikeTbl status) {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            entities.PerformanceLikeUnlikeTbls.Add(status);
            entities.SaveChanges();
        }
    }
}
