using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace AllClassicWeb
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }


        void Application_BeginRequest(Object source, EventArgs e)
        {

            HttpCookie cookie = Request.Cookies["CultureInfo_lang"];


            if (cookie != null && cookie.Value != null)
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(cookie.Value);
                Thread.CurrentThread.CurrentCulture = new CultureInfo(cookie.Value);
            }
            else
            {
                cookie = new HttpCookie("CultureInfo_lang");
                cookie.Value = "ko-KR";
                Response.Cookies.Add(cookie);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(cookie.Value);
                Thread.CurrentThread.CurrentCulture = new CultureInfo(cookie.Value);
            }

        }


    }
}