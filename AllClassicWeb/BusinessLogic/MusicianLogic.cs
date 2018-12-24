using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
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

                        var registeredEndorsersList = new List<MusicianEndorserTbl>();
                        //register endorsers
                        if (endorsers != null)
                        {
                            foreach (MusicianEndorserTbl x in endorsers)
                            {
                                MusicianEndorserTbl ue = new MusicianEndorserTbl();
                                ue.MusicianID = musician.MusicianID;
                                //ue.UserID = user.ID;
                                ue.EndorserEmail = x.EndorserEmail;
                                ue.EndorserName = x.EndorserName;

                                context.MusicianEndorserTbls.Add(ue);
                                context.SaveChanges();
                                registeredEndorsersList.Add(ue);
                            }
                        }

                        dbContextTransaction.Commit();

                        new Thread(() =>
                        {
                            Helper.EmailSender.sendEmailToEndorser(musician, registeredEndorsersList);

                        }).Start();

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

        public static MusicianTbl getMusicianByID(int id)
        {
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

                        var registeredEndorsersList = new List<MusicianEndorserTbl>();
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
                                registeredEndorsersList.Add(ue);
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
                        new Thread(() =>
                        {
                            Helper.EmailSender.sendEmailToEndorser(musician, registeredEndorsersList);

                        }).Start();
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

        public static bool DeleteMusician(int id)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                /*Msg 1785, Level 16, State 0, Line 7
                Introducing FOREIGN KEY constraint 'FK__Performan__Condu__540C7B00' on table 'PerformanceTbl' may cause cycles or multiple cascade paths. Specify ON DELETE NO ACTION or ON UPDATE NO ACTION, or modify other FOREIGN KEY constraints.
                Msg 1750, Level 16, State 1, Line 7
                Could not create constraint or index. See previous errors.
                                 * */
                //DUE TO THE ABOVE ERRORS I MANUALY REMOVE THE CONDUCTOR REFRENCE FROM THE PERFORMANCE TABLE 

                var musician = entities.MusicianTbls.Where(x => x.MusicianID == id).FirstOrDefault();

                var Conductor = entities.LookUpTbls.Where(x => x.MainCode == "Conductor").FirstOrDefault();
                var Composer = entities.LookUpTbls.Where(x => x.MainCode == "Composer").FirstOrDefault();

                if (musician.Major == Conductor.LookUpID)
                {
                    var linkedPerformances = entities.PerformanceTbls.Where(x => x.Conductor == musician.MusicianID).ToList();
                    foreach (var x in linkedPerformances)
                        x.Conductor = null;
                    entities.SaveChanges();
                }
                else if (musician.Major == Composer.LookUpID)
                {
                    var linkedPerformances = entities.PerformanceTbls.Where(x => x.MainTitleComposer == musician.MusicianID).ToList();
                    foreach (var x in linkedPerformances)
                        x.MainTitleComposer = null;
                    entities.SaveChanges();
                }


                entities.MusicianTbls.Remove(musician);
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
