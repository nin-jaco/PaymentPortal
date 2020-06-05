using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace CompCareWebsite.StudentPlan
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string toAddress = @"webmaster@universal.co.za";
                string title = "Contact us submission from the website";
                string mailBody = string.Format(@"Name: {0}, Surname: {1}, Email: {2}, Contact Number: {3}, Comment: {4}, Date Created: {5}", tbName.Text, tbSurname.Text, tbEmail.Text, tbNumber.Text, tbComments.Text, DateTime.Today);
                SendEmail(toAddress, title, mailBody);
                lblStatus.Text = "Request sent successfully";
            }
            catch
            {
                lblError.Text = @"The system encountered an error.  Please notify the <a href='mailto:webmaster@universal.co.za'>webmaster</a>";
            }
        }

        void SendEmail(string toAddress, string title, string mailBody)
        {
            MailMessage mailMessage = new MailMessage("webmaster@universal.co.za", toAddress, title, mailBody);
            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings.Get("SaoMailIP"), int.Parse(ConfigurationManager.AppSettings.Get("MailPort")));
            client.UseDefaultCredentials = true;
            client.Send(mailMessage);
        }
    }
}