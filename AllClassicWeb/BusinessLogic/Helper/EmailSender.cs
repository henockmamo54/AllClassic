using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using DataAccessP;

namespace BusinessLogic.Helper
{
    public class EmailSender
    {
        public static void sendEmailToNewUser(UserTbl user)
        {
            try
            {
                var fromAddress = new MailAddress("iijbiijb14@gmail.com");
                var fromPassword = "iijb@654321";
                //var toAddress = new MailAddress("henockmamo54@gmail.com");
                var toAddress = user.EmailID;

                string subject = "New account confirmation";
                string body = string.Format(@"<p><strong> Dear Mr. {0}, \n An account has been created for you at All Classic Korea. Click this link to activate your account and log in.
                            <a href='http://13.125.250.101/web/Views/FullEndorsementPage'> http://13.125.250.101/web/Views/FullEndorsementPage
                            </a> and fill the form <br /></strong></p> ", user.FullName,  user.UserID);

                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)

                };

                using (var message = new MailMessage(fromAddress.Address, toAddress)
                {
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                })
                    smtp.Send(message);
                Console.WriteLine("done");
            }
            catch (Exception eee)
            {
                //Response.Write(eee.Message + "\n" + eee.InnerException + "\n" + eee.StackTrace);
                //showMsg(eee.Message);
                Console.WriteLine(eee.Message);
            }
        }

    }
}