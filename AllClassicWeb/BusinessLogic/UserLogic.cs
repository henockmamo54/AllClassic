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

        public static Result updateUser(List<int> usertypes, UserTbl user)
        {
            using (var context = new AllClassicDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        var newuser=context.UserTbls.Where(x => x.UserID == user.UserID).FirstOrDefault();
                        newuser.Password = user.Password;
                        newuser.FullName = user.FullName;
                        newuser.NickName = user.NickName;
                        newuser.MobileNo = user.MobileNo;
                        newuser.Facebook = user.Facebook;
                        newuser.Twitter = user.Twitter;
                        newuser.KakaoTalk = user.KakaoTalk;
                        newuser.OtherSNS = user.OtherSNS;
                        newuser.Affliation = user.Affliation;
                        newuser.Birthday = user.Birthday;
                        newuser.ZipCode = user.ZipCode;
                        newuser.Address = user.Address;
                        newuser.IsActive = true;

                        context.SaveChanges();

                        context.UserUserTypes.RemoveRange(newuser.UserUserTypes.ToList());

                        context.SaveChanges();

                        

                        // register  user types
                        foreach (int i in usertypes)
                        {
                            DataAccessP.UserUserType type = new UserUserType();
                            type.UserID = newuser.UserID;
                            type.UserTypeID = i;

                            context.UserUserTypes.Add(type);
                            context.SaveChanges();
                        }

                        dbContextTransaction.Commit();
                        
                        return new Result(newuser, null);
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                        return new Result(null, ee);
                    }

                }
            }
        }

        public static UserTbl getusertByID(int id) {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.UserTbls.Where(x => x.UserID == id).FirstOrDefault();
        }

        public static Result registerUser(List<int> usertypes, UserTbl user)
        {

            bool isSuccess = false;
            using (var context = new AllClassicDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        user.IsActive = true;
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

                        return new Result(user, null);
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                        return new Result(null, ee);
                    }

                }
            }
        }

        public static List<UserTbl> checkUserLoginInfo(string email, string password)
        {
            return entity.UserTbls.Where(x => x.EmailID == email & x.Password == password & x.IsActive==true).ToList(); ;
        }


        public static List<UserTbl> checkUserEmailExists(string email)
        {
            return entity.UserTbls.Where(x => x.EmailID == email & x.IsActive == true).ToList(); ;
        }

        public static bool DeactiveUser(UserTbl user) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                var u = entities.UserTbls.Where(x => x.UserID == user.UserID & x.IsActive == true).FirstOrDefault();
                u.IsActive = false;
                entities.SaveChanges();
                return true;
            }
            catch(Exception exc)
            {
                return false;
            }
        }

        public struct Result
        {
            public Result(UserTbl user, Exception ee)
            {
                this.user = user;
                this.exception = ee;
            }
            public UserTbl user;
            public Exception exception;
        }

    }
}
