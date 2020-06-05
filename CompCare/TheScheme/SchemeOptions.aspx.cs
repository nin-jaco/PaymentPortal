using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Drawing;

namespace CompCareWebsite.TheScheme
{
    public partial class SchemeOptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblStatus.Text = "";
            string toAddress = @"webmaster@universal.co.za";
            string title = "Prospective member enquired on website";
            string mailBody = string.Format("A prospective member enquired on the CompCare website for medical aid.  Please assign this lead to a consultant for action.  The lead was created on {0} and his/her details are as follows: Name - {0}, Surname - {1}, Email - {2}, Contact Number - {3}, Option interested in - {4}, Date - {5}", tbName.Text, tbSurname.Text, tbEmail.Text, tbNumber.Text, lbOptions.Text, DateTime.Today);
            try
            {
                SendEmail(toAddress, title, mailBody);
                lblStatus.Text = "Message Sent";
                lblStatus.ForeColor = Color.Blue;
            }
            catch (Exception ex)
            {
                lblStatus.Text = @"Error Processing Request. The <a href='mailto:webmaster@universal.co.za>'webmaster</a> has been notified.'";
                lblStatus.ForeColor = Color.Red;
                SendEmail("webmaster@universal.co.za", @"System encountered a problem sending mail from CompCare 'TheScheme/SchemeOptions' page", ex.ToString());
            }
            ClearText();
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

        protected void btnBenefitComparison_Click(object sender, EventArgs e)
        {
            Response.Redirect("BenefitComparison.aspx");
        }

        protected void btnContributionComparison_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContributionComparison.aspx");
        }
    }
}