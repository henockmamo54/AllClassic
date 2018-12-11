using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class QuestionLogic
    {
        public static QuestionsTbl registerQuestion(QuestionsTbl q) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                QuestionsTbl new_q= q;
                
                entities.QuestionsTbls.Add(new_q);
                entities.SaveChanges();
                return q;
            }
            catch (Exception ee) {
                return null;
            }

        }
    }
}
