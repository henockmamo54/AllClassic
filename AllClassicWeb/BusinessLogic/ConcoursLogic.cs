using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class ConcoursLogic
    {
        public static ConcourTbl registerConcours(ConcourTbl c) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.ConcourTbls.Add(c);
                entities.SaveChanges();
                return c;
            }
            catch (Exception ee) {
                return null;
            }

        }

        public static ConcourTbl updateConcours(ConcourTbl c) {
            try
            {
                c.UserID = 5;
                AllClassicDBEntities entities = new AllClassicDBEntities();
                var concours = entities.ConcourTbls.Where(x => x.ConcourID == c.ConcourID).FirstOrDefault();
                concours.Title = c.Title;
                concours.Organizer = c.Organizer;
                concours.FromDate = c.FromDate;
                concours.ToDate = c.ToDate;
                concours.ConcourOutline = c.ConcourOutline;
                concours.UpdateTimeStamp = DateTime.Now;
                entities.SaveChanges();
                return c;
            }
            catch (Exception ee)
            {
                return null;
            }
        }

        public static ConcourTbl getConcourByID(int id) {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.ConcourTbls.Where(x => x.ConcourID == id).FirstOrDefault();
        }
    }
}
