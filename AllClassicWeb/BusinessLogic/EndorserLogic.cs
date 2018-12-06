using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class EndorserLogic
    {
        public static MusicianEndorserTbl getendorserlistbyID(int ID)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.MusicianEndorserTbls.Where(x => x.ID == ID).FirstOrDefault();
        }

        public static bool saveEndorsementComment(int ID)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                MusicianEndorserTbl endorser = entities.MusicianEndorserTbls.Where(x => x.ID == ID).FirstOrDefault();
                endorser.status = true;
                endorser.EndorsedDate = DateTime.Now;
                entities.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }
    }
}
