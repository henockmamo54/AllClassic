using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using BusinessLogic.Helper;
using DataAccessP;

namespace BusinessLogic
{
    public class UserLogic
    {
        static AllClassicDBEntities entity = new AllClassicDBEntities();

        public static Result registerUser(List<int> usertypes, UserTbl user)
        {

            bool isSuccess = false;
            using (var context = new AllClassicDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        context.UserTbls.Add(user);
                        context.SaveChanges();

                        // register  user types
                        foreach (int i in usertypes)
                        {
                            DataAccessP.UserUserType type = new UserUserType();
                            type.UserID = user.UserID;
                            type.UserTypeID = i;

                            context.UserUserTypes.Add(type);
                            context.SaveChanges();
                        }

                        dbContextTransaction.Commit();

                        new Thread(() =>
                        {
                             EmailSender.sendEmailToNewUser(user); ;
                        }).Start();

                        return new Result(user,null);
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                        return new Result(null,ee);
                    }

                }
            }
        }

        public static List<UserTbl> checkUserLoginInfo(string email, string password)
        {
            return entity.UserTbls.Where(x => x.EmailID == email && x.Password == password).ToList(); ;
        }

        public struct Result
        {
            public Result(UserTbl user, Exception ee) {
                this.user = user;
                this.exception = ee;
            }
            public UserTbl user;
            public Exception exception;
        }

    }
}
