using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;
using BusinessLogic;

namespace BusinessLogic
{
    public class PerformanceDBLogic
    {

        public static PerformanceTbl registerPerformance(List<PerformanceMusicianInstrumentTbl> artistinstrument, PerformanceTbl performance)
        {
            bool isSuccess = false;
            using (var context = new AllClassicDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        context.PerformanceTbls.Add(performance);
                        context.SaveChanges();

                        if (artistinstrument!=null && artistinstrument.Count > 0)
                        {
                            //register endorsers
                            foreach (PerformanceMusicianInstrumentTbl x in artistinstrument)
                            {
                                PerformanceMusicianInstrumentTbl ue = new PerformanceMusicianInstrumentTbl();
                                ue.PerformanceID = performance.PerformanceID;
                                //ue.UserID = user.ID;
                                ue.MusicianID = x.MusicianID;
                                ue.InstrumentID = x.InstrumentID;

                                context.PerformanceMusicianInstrumentTbls.Add(ue);
                                context.SaveChanges();

                            }
                        }
                        dbContextTransaction.Commit();
                        return performance;

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
