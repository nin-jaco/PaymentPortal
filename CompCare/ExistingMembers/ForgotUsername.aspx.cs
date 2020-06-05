using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Universal.Data;
using System.Net.Mail;
using System.Configuration;
using System.Drawing;

namespace CompCare.ExistingMembers
{
    public partial class ForgotUsername : System.Web.UI.Page
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
            using (UniversalEntities entity = new UniversalEntities())
            {
                Member member = entity.Members.Where(i => i.MAMembershipNumber == tbMembershipNumber.Text).SingleOrDefault();
                if (member == null)
                {
                    lblStatus.Text = "Membership Number does not exist in database.";
                    lblStatus.ForeColor = Color.Red;
                }
                else
                {
                    Dependant dependant = entity.Dependants.Where(i => i.IdMember == member.IdMember && i.IdDependantType == 5).SingleOrDefault();
                    User user = entity.Users.Where(i => i.IdMember == member.IdMember).SingleOrDefault();
                    if (dependant.IdentityNumber != tbIdnumber.Text)
                    {
                        lblStatus.Text = "ID Number you provided does not match with the ID Number associated with the Membership Number in the database.";
                        lblStatus.ForeColor = Color.Red;
                    }
                    else if (dependant.EmailAddress == "" || dependant.EmailAddress == null)
                    {
                        lblStatus.Text = string.Format(@"We do not have an email address for you in our system.  Have you supplied us a valid Email Address? Please update your details with the <a href='mailto:Roshone.Kaldine@universal.co.za?subject=Please update my profile, membership number: {0}'>membership department</a>.", member.MAMembershipNumber);
                        lblStatus.ForeColor = Color.Red;
                        ClearTextInputs();
                    }
                    else
                    {
                        string toAddress = dependant.EmailAddress;
                        string title = "Your CompCare Wellness Username";
                        string mailBody = string.Format("<p>Dear {0}, </p><p>You or someone on your behalf, requested that your username be sent to your email address.</p><p>Your username has been saved in the database as {1}.</p><p>.", dependant.DependantName, user.Username);
                        try
                        {
                            SendEmail(toAddress, title, mailBody);
                            lblStatus.Text = "Your username has been sent to the email address on record.  Click here to return to the <a href='Default.aspx'>login page</a>.";
                            lblStatus.ForeColor = Color.Blue;
                            ClearTextInputs();
                        }
                        catch (Exception ex)
                        {
                            lblStatus.Text = string.Format(@"We encountered a problem sending confirmation of this transaction to your email address.  Have you supplied us a valid Email Address? Please update your details with the <a href='mailto:Roshone.Kaldine@universal.co.za?subject=Please update my profile, membership number: {0}'>membership department</a>.", member.MAMembershipNumber);
                            lblStatus.ForeColor = Color.Red;
                            ClearTextInputs();
                        }
                    }
                }
            }
        }

        void ClearTextInputs()
        {
            tbIdnumber.Text = "";
            tbMembershipNumber.Text = "";
        }

        void SendEmail(string toAddress, string title, string mailBody)
        {
            if (toAddress != null)
            {
                MailMessage mailMessage = new MailMessage("webmaster@universal.co.za", toAddress, title, mailBody);
                mailMessage.IsBodyHtml = true;
                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings.Get("SaoMailIP"), int.Parse(ConfigurationManager.AppSettings.Get("MailPort")));
                client.UseDefaultCredentials = true;
                client.Send(mailMessage);
            }
        }
    }
}