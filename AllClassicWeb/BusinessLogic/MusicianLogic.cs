using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class MusicianLogic
    {
        

        public static MusicianTbl registerMusician(List<MusicianEndorserTbl> endorsers, MusicianTbl musician)
        {
            bool isSuccess = false;
            using (var context = new AllClassicDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        context.MusicianTbls.Add(musician);
                        context.SaveChanges();

                        //register endorsers
                        foreach (MusicianEndorserTbl x in endorsers)
                        {
                            MusicianEndorserTbl ue = new MusicianEndorserTbl();
                            ue.MusicianID = musician.MusicianID;
                            //ue.UserID = user.ID;
                            ue.EndorserEmail = x.EndorserEmail;
                            ue.EndorserName = x.EndorserName;

                            context.MusicianEndorserTbls.Add(ue);
                            context.SaveChanges();

                        }

                        dbContextTransaction.Commit();
                        return musician;
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                        return null;
                    }


                }
            }
        }

        public static MusicianTbl getMusicianByID(int id) {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.MusicianTbls.Where(x => x.MusicianID == id).FirstOrDefault();
        }

        public static MusicianTbl updateRegisteredMusician(List<MusicianEndorserTbl> added, List<MusicianEndorserTbl> deleted, MusicianTbl musician)
        {
            bool isSuccess = false;
            using (var context = new AllClassicDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        var artist = context.MusicianTbls.Where(x => x.MusicianID == musician.MusicianID).FirstOrDefault();
                        artist.Name = musician.Name;
                        artist.EmailID = musician.EmailID;
                        artist.ZipCode = musician.ZipCode;
                        artist.Address = musician.Address;
                        artist.Facebook = musician.Facebook;
                        artist.Twitter = musician.Twitter;
                        artist.KakaoTalk = musician.KakaoTalk;
                        artist.Affliation = musician.Affliation;
                        artist.Major1 = musician.Major1;
                        artist.Major2 = musician.Major2;
                        artist.Photo1 = musician.Photo1;
                        artist.Photo2 = musician.Photo2;
                        artist.Profile = musician.Profile;
                        artist.Repertory = musician.Repertory;
                        artist.UserID = musician.UserID;
                        artist.UpdateTimeStamp = DateTime.Now;
                        artist.Major = musician.Major;
                        context.SaveChanges();

                        //register endorsers
                        if (added.Count > 0)
                        {
                            foreach (MusicianEndorserTbl x in added)
                            {
                                MusicianEndorserTbl ue = new MusicianEndorserTbl();
                                ue.MusicianID = musician.MusicianID;
                                //ue.UserID = user.ID;
                                ue.EndorserEmail = x.EndorserEmail;
                                ue.EndorserName = x.EndorserName;

                                context.MusicianEndorserTbls.Add(ue);
                                context.SaveChanges();

                            }
                        }

                        if (deleted.Count > 0)
                        {
                            foreach (MusicianEndorserTbl y in deleted)
                            {
                                context.MusicianEndorserTbls.Remove(context.MusicianEndorserTbls.Where(x => x.ID == y.ID).FirstOrDefault());
                                context.SaveChanges();
                            }
                        }

                        dbContextTransaction.Commit();
                        return musician;
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                        return null;
                    }


                }
            }
        }

    }

}
