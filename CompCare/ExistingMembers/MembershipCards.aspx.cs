using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace CompCare.ExistingMembers
{
    public partial class MembershipCards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btSubmit_Click(object sender, EventArgs e)
        {
            if (tbMembershipNumber.Text == "" || tbRequiredFor.Text == "")
            {
                lblError.Text = "Please provide values for both fields.";
            }
            else
            {
                string toAddress = @"Lydia.Tlhabanyane@universal.co.za";
                string title = "Prospective member enquired on website";
                string mailBody = string.Format(@"A member enquired on receiving a new /replacement membership card. Membership number: - {0}, Card Required for: - {1}", tbMembershipNumber.Text, tbRequiredFor.Text);
                SendEmail(toAddress, title, mailBody);
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