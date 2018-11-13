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
    }
}
