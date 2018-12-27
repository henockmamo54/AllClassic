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
        public static ArticleTbl registerArticle(ArticleTbl a)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.ArticleTbls.Add(a);
                entities.SaveChanges();
                return a;
            }
            catch (Exception eee)
            {
                return null;
            }
        }

        public static ArticleTbl updateArticle(ArticleTbl a)
        {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                ArticleTbl article = entities.ArticleTbls.Where(x => x.ArticleID == a.ArticleID).FirstOrDefault();
                article.ArticleTitle = a.ArticleTitle;
                article.ArticleURL = a.ArticleURL;
                //article.UserID = a.UserID;
                article.UpdateTimeStamp = a.UpdateTimeStamp;
                entities.SaveChanges();
                return article;
            }
            catch (Exception eee)
            {
                return null;
            }
        }

        public static ArticleTbl get_articleByID(int id)
        {
            AllClassicDBEntities entities = new AllClassicDBEntities();
            return entities.ArticleTbls.Where(x => x.ArticleID == id).FirstOrDefault();
        }

        public static bool deleteArticle(int id) {
            try
            {
                AllClassicDBEntities entities = new AllClassicDBEntities();
                entities.ArticleTbls.Remove(entities.ArticleTbls.Where(x => x.ArticleID == id).FirstOrDefault());
                entities.SaveChanges();
                return true;
            }
            catch(Exception ee)
            {
                return false;
            }
        }

    }
}
