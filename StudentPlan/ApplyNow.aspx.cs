using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Net.Mail;
using System.Configuration;

namespace CompCareWebsite.StudentPlan
{
    public partial class ApplyNow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblStatus.Text = "";
            string toAddress = @"webmaster@universal.co.za";
            string title = "Prospective member enquired on website";
            string mailBody = string.Format("A prospective member enquired on the CompCare website for medical aid.  Please assign this lead to a consultant for action.  The lead was created on {0} and his/her details are as follows: Name - {0}, Surname - {1}, Email - {2}, Contact Number - {3}, Option interested in - StudentPlan NetworX, Date - {4}", tbName.Text, tbSurname.Text, tbEmail.Text, tbNumber.Text, DateTime.Today);
            try
            {
                SendEmail(toAddress, title, mailBody);
                lblStatus.Text = "Message Sent";
                lblStatus.ForeColor = Color.Blue;
            }
            catch (Exception)
            {
                lblStatus.Text = "Error Processing Request";
                lblStatus.ForeColor = Color.Red;
            }
            finally
            {

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