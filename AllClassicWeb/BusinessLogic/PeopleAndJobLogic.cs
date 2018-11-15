using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class PeopleAndJobLogic
    {
        public static PeopleAndJobTbl registerPeopleAndLogic(PeopleAndJobTbl p) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.PeopleAndJobTbls.Add(p);
                entities.SaveChanges();
                return p;
            }
            catch (Exception e) {
                return null;
            }
        }
    }
}
