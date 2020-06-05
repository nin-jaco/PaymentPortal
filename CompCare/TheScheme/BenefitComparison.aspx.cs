using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace CompCareWebsite.TheScheme
{
    public partial class BenefitComparison : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Clicked(object s, EventArgs e)
        {
            string toAddress = @"webmaster@universal.co.za";
            string title = "Contact us submission from the website";
            string mailBody = string.Format(@"Name: {0}, Email: {2}, Contact Number: {3}, Cellular Number: {4}, Date Created: {5}", tbName.Text, tbEmail.Text, tbTelephone.Text, tbEmail.Text, tbCellularNumber.Text, DateTime.Today);
            SendEmail(toAddress, title, mailBody);
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