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

        public static MusicShopTbl updateMusicShop(MusicShopTbl musicshop)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                MusicShopTbl r =entities.MusicShopTbls.Where(x => x.MusicShopID == musicshop.MusicShopID).FirstOrDefault();
                r.Name = musicshop.Name;
                r.Alias = musicshop.Alias;
                r.Expertise = musicshop.Expertise;
                r.City = musicshop.City;
                r.OwnerName = musicshop.OwnerName;
                r.SinceYear = musicshop.SinceYear;
                r.EmailID = musicshop.EmailID;
                r.Address = musicshop.Address;
                r.ZipCode = musicshop.ZipCode;
                r.TelNo = musicshop.TelNo;
                r.FaxNo = musicshop.FaxNo;
                r.HomePage = musicshop.HomePage;
                r.UpdateTimeStamp = DateTime.Now;
                r.UserID = musicshop.UserID;

                entities.SaveChanges();
                return r;
            }
            catch (Exception ee)
            {
                return null;
            }
        }

        public static MusicShopTbl getMusicshopByID(int id) {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.MusicShopTbls.Where(x => x.MusicShopID == id).FirstOrDefault();
        }

    }
}
