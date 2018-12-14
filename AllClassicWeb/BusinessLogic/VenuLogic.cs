using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class VenuLogic
    {
        public static VenueTbl registerConcertVenu(VenueTbl r)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.VenueTbls.Add(r);
                entities.SaveChanges();
                return r;
            }
            catch (Exception ee)
            {
                return null;
            }
        }
        public static VenueTbl updateConcertVenu(VenueTbl venu)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                VenueTbl r = entities.VenueTbls.Where(x => x.VenueID == venu.VenueID).FirstOrDefault();
                r.Name = venu.Name;
                r.Alias = venu.Alias;
                //r.Expertise = txt_experties.Text;
                r.City = venu.City;
                r.OwnerName = venu.OwnerName;
                r.SinceYear = venu.SinceYear;
                r.EmailID = venu.EmailID;
                r.Address = venu.Address;
                r.ZipCode = venu.ZipCode;
                r.TelNo = venu.TelNo;
                r.FaxNo = venu.FaxNo;
                r.HomePage = venu.HomePage;
                r.UpdateTimeStamp = DateTime.Now;
                r.UserID = venu.UserID;

                entities.SaveChanges();
                return r;
            }
            catch (Exception ee)
            {
                return null;
            }
        }

        public static VenueTbl getVenuByID(int id)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.VenueTbls.Where(x => x.VenueID == id).FirstOrDefault();
        }

        public static bool deleteVenu(int id) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.VenueTbls.Remove(entities.VenueTbls.Where(x => x.VenueID == id).FirstOrDefault());
                entities.SaveChanges();
                return true;
            }
            catch (Exception ee) {
                return false;
            }
        }

    }
}
