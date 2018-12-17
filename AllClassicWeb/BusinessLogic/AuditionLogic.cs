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


        public static AuditionTbl updateAudtionTbl(AuditionTbl audition)
        {

            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                AuditionTbl a = entities.AuditionTbls.Where(x => x.AuditionID == audition.AuditionID).FirstOrDefault();

                a.Organizer = audition.Organizer;
                a.Title = audition.Title;
                a.FromDate = audition.FromDate;
                a.ToDate = audition.ToDate;
                a.UpdateTimeStamp = audition.UpdateTimeStamp;
                a.AuditionOutline = audition.AuditionOutline;
                a.UserID = audition.UserID;
                entities.SaveChanges();

                return audition;
            }
            catch (Exception ee)
            {
                return null;
            }

        }

        public static AuditionTbl getAuditonByID(int id) {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.AuditionTbls.Where(x => x.AuditionID == id).FirstOrDefault();
        }

        public static bool deleteAudition(int id)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.AuditionTbls.Remove(entities.AuditionTbls.Where(x => x.AuditionID == id).FirstOrDefault());
                entities.SaveChanges();
                return true;
            }
            catch(Exception e){
                return false;
            }

        }

    }
}
