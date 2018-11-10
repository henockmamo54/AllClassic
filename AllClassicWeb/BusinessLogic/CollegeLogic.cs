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

        public static CollegeTbl regesterCollege(CollegeTbl c) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.CollegeTbls.Add(c);
                entities.SaveChanges();
                return c;
            }
            catch (Exception ee) {
                return null;
            }
        }
    }
}
