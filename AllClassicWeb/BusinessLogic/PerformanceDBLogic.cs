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

        public static Result registerPerformance(List<PerformanceMusicianInstrumentTbl> artistinstrument, PerformanceTbl performance)
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

                        if (artistinstrument != null && artistinstrument.Count > 0)
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
                        return new Result( performance,null);

                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                        return new Result( null,ee);
                    }


                }
            }
        }

        public static PerformanceTbl getPerfByID(int id)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.PerformanceTbls.Where(x => x.PerformanceID == id).FirstOrDefault();
        }

        public static PerformanceTbl updatePerformance(List<PerformanceMusicianInstrumentTbl> deleted, List<PerformanceMusicianInstrumentTbl> added, PerformanceTbl p)
        {
            bool isSuccess = false;
            using (var context = new AllClassicDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        var pt = context.PerformanceTbls.Where(x=>x.PerformanceID==p.PerformanceID).FirstOrDefault();
                        pt.MainTitle = p.MainTitle;
                        pt.SubTitle = p.SubTitle;
                        pt.Subject = p.Subject;
                        pt.PerformanceGroup = p.PerformanceGroup;
                        pt.PerformanceType = p.PerformanceType;
                        pt.Conductor = p.Conductor;
                        pt.MainTitleComposer = p.MainTitleComposer;
                        pt.MainInstrument = p.MainInstrument;
                        pt.Organizer = p.Organizer;
                        pt.Sponser = p.Sponser;
                        pt.Language = p.Language;
                        pt.StartDate = p.StartDate;
                        pt.EndDate = p.EndDate;
                        pt.Time = p.Time;
                        pt.Region = p.Region;
                        pt.City = p.City;
                        pt.Venue = p.Venue;
                        pt.PosterFileName = p.PosterFileName;
                        pt.VideoFileName = p.VideoFileName;
                        pt.TicketBox = p.TicketBox;
                        pt.Program = p.Program;
                        pt.Description = p.Description;
                        //pt.UserID = p.UserID;
                        pt.UpdateTimeStamp = DateTime.Now;
                        
                        context.SaveChanges();

                        //register endorsers
                        if (added.Count > 0)
                        {
                            foreach (PerformanceMusicianInstrumentTbl x in added)
                            {
                                PerformanceMusicianInstrumentTbl ue = new PerformanceMusicianInstrumentTbl();
                                ue.PerformanceID = pt.PerformanceID;
                                ue.MusicianID = x.MusicianID;
                                ue.InstrumentID = x.InstrumentID;

                                context.PerformanceMusicianInstrumentTbls.Add(ue);
                                context.SaveChanges();

                            }
                        }

                        if (deleted.Count > 0)
                        {
                            foreach (PerformanceMusicianInstrumentTbl y in deleted)
                            {
                                context.PerformanceMusicianInstrumentTbls.Remove(context.PerformanceMusicianInstrumentTbls.Where(x => x.ID == y.ID).FirstOrDefault());
                                context.SaveChanges();
                            }
                        }

                        context.SaveChanges();
                        dbContextTransaction.Commit();
                        
                        return pt;

                    }

                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                        return null;
                    }

                }
            }
        }

        public struct Result {
            public PerformanceTbl performance;
            public Exception exception;

            public Result(PerformanceTbl performance, Exception exception) {
                this.exception = exception;
                this.performance = performance;
            }
        }

        public static bool deletePerformance(int id) {
            try {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.PerformanceTbls.Remove(entities.PerformanceTbls.Where(x => x.PerformanceID == id).FirstOrDefault());
                entities.SaveChanges();
                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }
}
