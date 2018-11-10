using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessP;

namespace BusinessLogic
{
    public class ArticleLogic
    {
        public static ArticleTbl registerArticle(ArticleTbl a) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.ArticleTbls.Add(a);
                entities.SaveChanges();
                return a;
            }
            catch (Exception eee) {
                return null;
            }

        }
    }
}
