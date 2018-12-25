using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AllClassicWeb.Views
{
    public partial class SearchEngineResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = Request.QueryString.ToString();
            // Create a request for the URL.   
            WebRequest request = WebRequest.Create(
              "https://www.findberry.com/search/?wid=11447&" + query);
            // If required by the server, set the credentials.  
            request.Credentials = CredentialCache.DefaultCredentials;
            // Get the response.  
            WebResponse response = request.GetResponse();
            // Display the status.  
            Console.WriteLine(((HttpWebResponse)response).StatusDescription);
            // Get the stream containing content returned by the server.  
            Stream dataStream = response.GetResponseStream();
            // Open the stream using a StreamReader for easy access.  
            StreamReader reader = new StreamReader(dataStream);
            // Read the content.  
            string responseFromServer = reader.ReadToEnd();
            // Display the content.  
            Console.WriteLine(responseFromServer);

            var doc = new HtmlDocument();
            doc.LoadHtml(responseFromServer);
            fullserachresult.InnerHtml = responseFromServer;


            var countlist = doc.DocumentNode.Descendants("div")
               .Where(node => node.GetAttributeValue("class", "")
               .Equals("sr_count")).ToList();

            var itemslit = doc.DocumentNode.Descendants("div")
                   .Where(node => node.GetAttributeValue("class", "")
                   .Equals("sr_item")).ToList();

            var paging = doc.DocumentNode.Descendants("div")
                   .Where(node => node.GetAttributeValue("class", "")
                   .Equals("sr_pages")).ToList();

            var content = "<br />" + countlist[0].InnerHtml + "<hr />";
            foreach (var item in itemslit)
                content += item.InnerHtml + "<br />";

            content += paging[0].InnerHtml;

            serachResultContainer.InnerHtml = content;
            // Clean up the streams and the response.  
            reader.Close();
            response.Close();
        }
    }
}