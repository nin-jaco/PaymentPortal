using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Net.Mail;
using System.Configuration;

namespace CompCareWebsite.TheScheme
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string toAddress = @"webmaster@universal.co.za";
                string title = "Prospective member enquired on the CompCare Wellness website";
                string mailBody = string.Format(@"Name: {0}, Surname: {1}, Email: {2}, Contact Number: {3}, Option: {4}, Date Created: {5}", tbName.Text, tbSurname.Text, tbEmail.Text, tbNumber.Text, lbOptions.SelectedValue, DateTime.Today);
                SendEmail(toAddress, title, mailBody);
                lblStatus.Text = "Request sent successfully!";
                lblStatus.ForeColor = Color.Blue;
                ClearText();
            }
            catch (Exception ex)
            {
                lblStatus.Text = @"The system encountered an error.  The <a href='mailto:webmaster@universal.co.za'>webmaster</a> has been notified and is attending to this problem.";
                lblStatus.ForeColor = Color.Red;
                SendEmail("webmaster@universal.co.za", @"System encountered a problem sending mail from CompCare 'TheScheme/Default' page", ex.ToString());
            }
        }

        private void ClearText()
        {
            tbName.Text = "";
            tbSurname.Text = "";
            tbEmail.Text = "";
            tbNumber.Text = "";
            lbOptions.ClearSelection();
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