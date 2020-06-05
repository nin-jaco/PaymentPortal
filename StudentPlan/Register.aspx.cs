using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentPlan.DataModel;
using System.Net.Mail;
using System.Configuration;

namespace StudentPlan
{
    public partial class Register : System.Web.UI.Page
    {
        UniversalEntities entity = new UniversalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            User user = entity.Users.Where(p => p.Username.ToLower() == tbUsername.Text.ToLower()).FirstOrDefault();
            if (user == null)
            {
                User newUser = new User
                {
                    UserEmail = tbEmail.Text,
                    IsStudent = true,
                    IsActive = true,
                    Username = tbUsername.Text.ToLower(),
                    Password = tbPassword.Text,
                    RegistrationDate = DateTime.Today,
                    UserLevel = 0,
                    DateCreated = DateTime.Today
                };
                entity.AddToUsers(newUser);
                entity.SaveChanges();
                string toAddress = tbEmail.Text;
                string title = "Member Registration on CompCare Website";
                string mailBody = string.Format("You have been successfully registered on the StudentPlan website.  Your email address has been registered in the database as being {0}", tbEmail.Text);
                SendEmail(toAddress, title, mailBody);
                lblSuccess.Text = @"You have been successfully registered.  Please use your credentials to log onto the website.  Please <a href='Login.aspx'>click here</a> to return to the login page.";
            }
            else
            {
                lblError.Text = "Username taken";
            }
        }

        void SendEmail(string toAddress, string title, string mailBody)
        {
            try
            {
                if (toAddress != null)
                {
                    MailMessage mailMessage = new MailMessage("webmaster@universal.co.za", toAddress, title, mailBody);
                    SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings.Get("SaoMailIP"), int.Parse(ConfigurationManager.AppSettings.Get("MailPort")));
                    client.UseDefaultCredentials = true;
                    client.Send(mailMessage);
                }
            }
            catch
            {
                lblError.Text = "The system was unable to send you the confirmation email.  Have you provided us with a valid email address?";
            }
        }

        protected void rblType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}