using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class UserLogic
    {
        static AllClassicDBEntities entity = new AllClassicDBEntities();

        public static UserTbl registerUser(List<int> usertypes, UserTbl user)
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
                        return user;
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                        return null;
                    }

                }
            }
        }

        public static List<UserTbl> checkUserLoginInfo(string email, string password)
        {
            return entity.UserTbls.Where(x => x.EmailID == email && x.Password == password).ToList(); ;
        }
    }
}
