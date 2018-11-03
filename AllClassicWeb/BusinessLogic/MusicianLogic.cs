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

    }

}
