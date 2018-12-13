using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class CollegeLogic
    {

        public static CollegeTbl regesterCollege(CollegeTbl c)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.CollegeTbls.Add(c);
                entities.SaveChanges();
                return c;
            }
            catch (Exception ee)
            {
                return null;
            }
        }

        public static CollegeTbl getCollegeByID(int id)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.CollegeTbls.Where(x => x.CollegeID == id).FirstOrDefault();
        }

        public static CollegeTbl updateCollege(CollegeTbl c)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                CollegeTbl CollegeLogic = entities.CollegeTbls.Where(x => x.CollegeID == c.CollegeID).FirstOrDefault();
                CollegeLogic.Name = c.Name;
                CollegeLogic.ShortName = c.ShortName;
                CollegeLogic.HomePage = c.HomePage;
                CollegeLogic.Country = c.Country;
                CollegeLogic.LocationMap = c.LocationMap;
                CollegeLogic.CollegePhoto = c.CollegePhoto;
                CollegeLogic.Introduction = c.Introduction;
                CollegeLogic.UpdateTimeStamp = c.UpdateTimeStamp;
                CollegeLogic.UserID = c.UserID;
                entities.SaveChanges();
                return CollegeLogic;
            }
            catch (Exception ee)
            {
                return null;
            }
        }

        public static bool DeleteMusician(int id)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.CollegeTbls.Remove(entities.CollegeTbls.Where(x => x.CollegeID == id).FirstOrDefault());
                entities.SaveChanges();

                return true;
            }
            catch (Exception e) {
                return false;
            }

        }

    }
}
