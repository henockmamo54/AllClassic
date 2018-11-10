using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class AuditionLogic
    {
        public static AuditionTbl regesterAudtionTbl(AuditionTbl audition) {

            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.AuditionTbls.Add(audition);
                entities.SaveChanges();
                return audition;
            }
            catch (Exception ee) {
                return null;
            }

        } 

    }
}
