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

    }
}
