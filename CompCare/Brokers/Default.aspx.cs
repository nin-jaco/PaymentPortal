using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Drawing;

namespace CompCareWebsite.Brokers
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblStatus.Text = "";                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (tbName.Text == "" || tbSurname.Text == "")
            {
                lblStatus.Text = "Please provide your name and surname.";
                lblStatus.ForeColor = Color.Red;
            }
            else if (tbTelephone.Text == "" && tbEmail.Text == "")
            {
                lblStatus.Text = "Please provide at least a telephone number or email address.";
                lblStatus.ForeColor = Color.Red;
            }
            else
            {
                try
                {
                    string toAddress = @"compcare@universal.co.za";
                    string title = "Prospective broker enquired on website";
                    string mailBody = string.Format(@"A prospective broker enquired on becoming a CompCare Wellness Broker. Name: {0}, Surname: {1}, Telephone: {2}, Email: {3}, Accreditation Number: {4}", tbName.Text, tbSurname.Text, tbTelephone.Text, tbEmail.Text, tbAccreditationNo.Text);
                    SendEmail(toAddress, title, mailBody);
                    SendEmail("webmaster@universal.co.za", title, mailBody);
                    lblStatus.Text = "Success!";
                    lblStatus.ForeColor = Color.Blue;
                    ClearText();
                }
                catch (Exception ex)
                {
                    SendEmail("webmaster@universal.co.za", "Error encountered", @"Error encountered on Broker/Default page" + ex.ToString());
                    lblStatus.Text = "Error encountered processing your request.  The webmaster has been notified.";
                    lblStatus.ForeColor = Color.Red;
                }
            }
        }

        private void ClearText()
        {
            tbAccreditationNo.Text = "";
            tbEmail.Text = "";
            tbName.Text = "";
            tbSurname.Text = "";
            tbTelephone.Text = "";
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