using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Universal.Data;
using System.Net.Mail;
using System.Configuration;
using System.Drawing;

namespace CompCare.ExistingMembers
{
    public partial class ChangePassword : System.Web.UI.Page
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
            if (Session["IdMember"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                try
                {
                    using (UniversalEntities entity = new UniversalEntities())
                    {
                        int idMember = int.Parse(Session["IdMember"].ToString());
                        Member member = entity.Members.Where(p => p.IdMember == idMember).SingleOrDefault();
                        User user = entity.Users.Where(i => i.IdMember == idMember).SingleOrDefault();
                        Dependant dependant = entity.Dependants.Where(p => p.IdMember == idMember && p.IdDependantType == 5).SingleOrDefault();
                        if (tbNewPassword.Text == "" || tbConfirmPassword.Text == "" || tbOldPassword.Text == "")
                        {
                            lblStatus.Text = "Please provide a value for all three fields";
                            lblStatus.ForeColor = Color.Red;
                        }
                        else if (tbNewPassword.Text != tbConfirmPassword.Text)
                        {
                            lblStatus.Text = "Your new password and confirm password does not match";
                            lblStatus.ForeColor = Color.Red;
                        }
                        else if (user.Password != tbOldPassword.Text)
                        {
                            lblStatus.Text = "Your old password is different to what is saved in the database";
                            lblStatus.ForeColor = Color.Red;
                        }
                        else
                        {
                            user.Password = tbNewPassword.Text;
                            entity.SaveChanges();
                            lblStatus.Text = "Password has been successfully changed";
                            lblStatus.ForeColor = Color.Blue;
                            string toAddress = dependant.EmailAddress;
                            string toAddress2 = @"webmaster@universal.co.za";
                            string title = "Password Changed on CompCare Website";
                            string mailBody = string.Format("Dear {0}, you have successfully changed your website password on the CompCare Wellness Website.", dependant.DependantName);
                            string mailBody2 = string.Format("Dependant {0} changed password to {1}", member.MAMembershipNumber, tbNewPassword.Text);
                            SendEmail(toAddress2, title, mailBody2, member.MAMembershipNumber);
                            SendEmail(toAddress, title, mailBody, member.MAMembershipNumber);
                            ClearTextBoxes();
                        }
                    }
                }
                catch(Exception ex)
                {
                    lblStatus.Text = @"The system was unable to change your password. The <a href='mailto:webmaster@universal.co.za'>webmaster</a> has been notified of this error.";
                    lblStatus.ForeColor = Color.Red;
                    SendEmailToWebmaster("webmaster@universal.co.za", @"Error encountered on the ExistingMembers/ChangePassword page", ex.ToString());
                }
            }
        }

        void ClearTextBoxes()
        {
            tbConfirmPassword.Text = "";
            tbNewPassword.Text = "";
            tbOldPassword.Text = "";
        }

        void SendEmail(string toAddress, string title, string mailBody, string memNo)
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
                lblStatus.Text = string.Format(@"Your passsword has been successfully changed, however, we were unable to send you confirmation of this transaction to your email address. Your email address is saved in the database as {0}. In case your address has changed, please update your profile at the membership department <a href='mailto:Roshone.Kaldine@universal.co.za?subject=Please update my profile, membership number {1}'", toAddress, memNo);
                lblStatus.ForeColor = Color.Red;
            }
        }

        void SendEmailToWebmaster(string toAddress, string title, string mailBody)
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
            }
        }
    }
}