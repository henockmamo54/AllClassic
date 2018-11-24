using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class CommentLogic
    {
        public static bool addComment(PerformanceCommentTbl comment)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            try
            {
                entities.PerformanceCommentTbls.Add(comment);
                entities.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }

        }

        public static List<PerformanceCommentTbl> getCommentsByPerformanceID(int performanceID)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.PerformanceCommentTbls.ToList().Where(x => x.PerformanceID == performanceID && x.ParentCommentID == null)
                    .OrderByDescending(x => x.CommentDate)
                    .ToList();
        }

        public static List<PerformanceCommentTbl> getParentCommentsByPerformanceID(int performanceID)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.PerformanceCommentTbls.ToList().Where(x => x.PerformanceID == performanceID && x.ParentCommentID == null && x.ParentCommentID == null)
                    .OrderByDescending(x => x.CommentDate)
                    .ToList();
        }

        public static List<PerformanceCommentTbl> getCommentsByParentCommentID(int parentCommentID)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.PerformanceCommentTbls.ToList().Where(x => x.ParentCommentID == parentCommentID )
                    .OrderByDescending(x => x.CommentDate)
                    .ToList();
        }
    }
}
