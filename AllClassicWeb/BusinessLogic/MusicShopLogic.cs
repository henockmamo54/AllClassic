using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;
using BusinessLogic;

namespace BusinessLogic
{
    public class MusicShopLogic
    {
        public static MusicShopTbl registerMusicShop(MusicShopTbl r)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.MusicShopTbls.Add(r);
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
