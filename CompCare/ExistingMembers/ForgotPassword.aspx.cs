using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Universal.Data;
using System.Drawing;
using System.Net.Mail;
using System.Configuration;

namespace CompCare.ExistingMembers
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (UniversalEntities entity = new UniversalEntities())
            {
                Member member = entity.Members.Where(i => i.MAMembershipNumber == tbMembershipNumber.Text).SingleOrDefault();
                if (member == null)
                {
                    lblChangePasswordError.Text = "Membership Number does not exist in database.";
                }
                else
                {
                    Dependant dependant = entity.Dependants.Where(i => i.IdMember == member.IdMember && i.IdDependantType == 5).SingleOrDefault();
                    User user = entity.Users.Where(i => i.IdMember == member.IdMember).SingleOrDefault();
                    if (dependant.IdentityNumber != tbIdnumber.Text)
                    {
                        lblChangePasswordError.Text = "ID Number you provided does not match with the ID Number associated with the Membership Number in the database.";
                    }
                    else if (tbPassword1.Text == "")
                    {
                        lblChangePasswordError.Text = "Please provide a value for the password field.";
                    }
                    else if (tbPassword1.Text != tbPassword2.Text)
                    {
                        lblChangePasswordError.Text = "Your passwords doesn't match";
                    }
                    else
                    {
                        user.Password = tbPassword1.Text;
                        entity.SaveChanges();
                        lblChangePasswordError.Text = "Your password has been changed.  Click here to return to the <a href='Default.aspx'>login page</a>.";
                        lblChangePasswordError.ForeColor = Color.Blue;
                        string toAddress = dependant.EmailAddress;
                        string toAddress2 = @"webmaster@universal.co.za";
                        string title = "Password Changed on CompCare Website";
                        string mailBody = string.Format(" Dear {0}, you have successfully changed your website password.", dependant.DependantName);
                        string mailBody2 = string.Format("Member {0} changed password on the CompCare website to {1}", member.MAMembershipNumber, tbPassword1.Text);
                        SendEmail(toAddress2, title, mailBody2);
                        ClearFields();
                        try
                        {
                            SendEmail(toAddress, title, mailBody);
                        }
                        catch (Exception ex)
                        {
                            lblChangePasswordError.Text = string.Format(@"Your password has been changed, however, we encountered a problem sending confirmation of this transaction to your email address.  In case your address has changed, please update your profile at the membership department <a href='mailto:Roshone.Kaldine@universal.co.za?subject=Please update my profile, membership number {0}'", member.MAMembershipNumber);
                        }
                    }
                }
            }
        }

        void ClearFields()
        {
            tbIdnumber.Text = "";
            tbMembershipNumber.Text = "";
            tbPassword1.Text = "";
            tbPassword2.Text = "";
        }

        void SendEmail(string toAddress, string title, string mailBody)
        {
            if (toAddress != null)
            {
                MailMessage mailMessage = new MailMessage("webmaster@universal.co.za", toAddress, title, mailBody);
                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings.Get("SaoMailIP"), int.Parse(ConfigurationManager.AppSettings.Get("MailPort")));
                client.UseDefaultCredentials = true;
                client.Send(mailMessage);
            }
        }
    }
}