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
        public static PeopleAndJobTbl registerPeopleAndLogic(PeopleAndJobTbl p)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.PeopleAndJobTbls.Add(p);
                entities.SaveChanges();
                return p;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public static PeopleAndJobTbl updatePeopleAndLogic(PeopleAndJobTbl p)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                PeopleAndJobTbl r = entities.PeopleAndJobTbls.Where(x => x.PeopleAndJobID == p.PeopleAndJobID).FirstOrDefault();
                r.PeopleOrJob = p.PeopleOrJob;
                r.ValidDate = p.ValidDate;
                r.City = p.City;
                r.Title = p.Title;
                r.ContactName = p.ContactName;
                r.EmailID = p.EmailID;
                r.TelNo = p.TelNo;
                r.Description = p.Description;
                r.UpdateTimeStamp = DateTime.Now;

                r.UserID = p.UserID;
                entities.SaveChanges();
                return p;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public static PeopleAndJobTbl GetPeopleAndJobByID(int id) {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.PeopleAndJobTbls.Where(x => x.PeopleAndJobID == id).FirstOrDefault();
        }

        public static bool deleteEntry(int id) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.PeopleAndJobTbls.Remove(entities.PeopleAndJobTbls.Where(x => x.PeopleAndJobID == id).FirstOrDefault());
                entities.SaveChanges();
                return true;
            }
            catch (Exception ee) {
                return false;
            }
        }
    }
}
