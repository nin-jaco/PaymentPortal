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
    public partial class RegisterUser : System.Web.UI.Page
    {
        UniversalEntities entity = new UniversalEntities();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string membershipNumber = "";
            string idNumber = "";

            if (!IsPostBack)
            {
                membershipNumber = Request.QueryString["MembershipNumber"];
                idNumber = Request.QueryString["idNumber"];
            }
            else
            {
                membershipNumber = tbMembershipNumber.Text;
                idNumber = tbIdNumber.Text;
            }
            trName.Visible = false;
            trSurname.Visible = false;
            trEmail.Visible = false;
            /*
            Member member = (from i in entity.Members
                             where i.MembershipNumber == membershipNumber
                             select i).SingleOrDefault();

            if (member == null)
            {
                lblError.Text = "Membership Number does not exist in the database. Please provide valid ID Number and Membership Number.";
                lblMembershipNumber.Visible = false;
                lblIdNumber.Visible = false;
                tbMembershipNumber.Visible = true;
                tbIdNumber.Visible = true;
            }
            else
            {
                Dependant dependant = (from i in entity.Dependants
                                       where i.IdMember == member.IdMember && i.DependantNumber == 0
                                       select i).SingleOrDefault();
                if (idNumber != dependant.IdentityNumber)
                {
                    lblError.Text = "Id Number and Membership number fields does not match. Please provide a valid Id number for this Membership Number";
                    lblMembershipNumber.Visible = false;
                    lblIdNumber.Visible = false;
                    tbMembershipNumber.Visible = true;
                    tbIdNumber.Visible = true;
                    tbMembershipNumber.Text = member.MembershipNumber;
                }
                else
                {
                    tbMembershipNumber.Text = membershipNumber;
                    lblMembershipNumber.Text = membershipNumber;
                    tbIdNumber.Text = idNumber;
                    lblIdNumber.Text = idNumber;

                    lblMembershipNumber.Visible = true;
                    lblIdNumber.Visible = true;
                    tbMembershipNumber.Visible = false;
                    tbIdNumber.Visible = false;
                    lblName.Text = dependant.DependantName;
                    lblSurname.Text = dependant.DependantSurname;
                    //tbEmail.Text = dependant.Email;
                }
            }
            */
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Member member = entity.Members.Where(i => i.MAMembershipNumber == tbMembershipNumber.Text).SingleOrDefault();
            if (member == null)
	        {
		        lblMembershipNumber.Text = "Membership Number does not exist in database.";
	        }
            else
	        {
                Dependant dependant = entity.Dependants.Where(p =>  p.IdMember == member.IdMember && p.IdDependantType == 5).FirstOrDefault();
                User user = entity.Users.Where(i => i.IdMember == member.IdMember).FirstOrDefault();
                if (dependant.IdentityNumber != tbIdNumber.Text)
                {
                    lblError.Text = "Please provide a valid ID Number";
                }
                else if (user != null && user.Password != "")
                {
                    lblError.Text = "You have already been registered on the website";
                }
                else if (user != null && user.Password == "")
                { 
                    user.UserEmail = dependant.EmailAddress;
                    user.IsCompCare = true;
                    user.IdMember = member.IdMember;
                    user.IsActive = true;
                    user.Username = tbUsername.Text;
                    user.Password = tbPassword.Text;
                    user.RegistrationDate = DateTime.Today;
                    user.UserLevel = 0;
                    user.DateCreated = DateTime.Today;
                    entity.SaveChanges();
                    string toAddress = dependant.EmailAddress;
                    string toAddress2 = @"webmaster@universal.co.za";
                    string title = "Member Registration on CompCare Website";
                    string mailBody = string.Format("Dear {0}, you have been successfully registered on the CompCare website.  Your email address has been registered in the database as being {1}", dependant.DependantName, dependant.EmailAddress);
                    string mailBody2 = string.Format("CompCare user dependant ID {0} registered. username {1} password {2}", dependant.IdDependant , user.Username, user.Password);
                    SendEmail(toAddress2, title, mailBody2);
                    SendEmail(toAddress, title, mailBody);
                    lblSuccess.Text = @"You have been successfully registered.  Please use your credentials to log onto the website.  Please <a href='Default.aspx'>click here</a> to return to the login page.";
                    tbMembershipNumber.Text = member.MAMembershipNumber;
                    tbMembershipNumber.Enabled = false;
                    tbIdNumber.Text = dependant.IdentityNumber;
                    tbIdNumber.Enabled = false;
                    trName.Visible = true;
                    trSurname.Visible = true;
                    trEmail.Visible = true;
                    lblName.Text = dependant.DependantName;
                    lblName.Enabled = false;
                    lblSurname.Text = dependant.DependantSurname;
                    lblSurname.Enabled = false;
                    tbEmail.Text = dependant.EmailAddress;
                    tbEmail.Enabled = false;
                    trButton.Visible = false;
                    btnSubmit.Enabled = false;
                    trPsword.Visible = false;
                    trPsword2.Visible = false;
                    tbUsername.Enabled = false;
                }
                else
                {
                    User newUser = new User
                    {
                        UserEmail = dependant.EmailAddress,
                        IsCompCare = true,
                        IdMember = member.IdMember,
                        IsActive = true,
                        Username = tbUsername.Text,
                        Password = tbPassword.Text,
                        RegistrationDate = DateTime.Today,
                        UserLevel = 0,
                        DateCreated = DateTime.Today
                    };
                    entity.AddToUsers(newUser);
                    entity.SaveChanges();
                    string toAddress2 = @"webmaster@universal.co.za";
                    string toAddress = dependant.EmailAddress;
                    string title = "Member Registration on CompCare Website";
                    string mailBody = string.Format(" Dear {0}, you have been successfully registered on the CompCare website.  Your email address has been registered in the database as being {1}", dependant.DependantName, dependant.EmailAddress);
                    string mailBody2 = string.Format("CompCare user dependant ID {0} registered. username {1} password {2}", dependant.IdDependant, user.Username, user.Password);
                    SendEmail(toAddress2, title, mailBody2);
                    SendEmail(toAddress, title, mailBody);
                    lblSuccess.Text = @"You have been successfully registered.  Please use your credentials to log onto the website.  Please <a href='Default.aspx'>click here</a> to return to the login page.";
                    tbMembershipNumber.Text = member.MAMembershipNumber;
                    tbMembershipNumber.Enabled = false;
                    tbIdNumber.Text = dependant.IdentityNumber;
                    tbIdNumber.Enabled = false;
                    trName.Visible = true;
                    trSurname.Visible = true;
                    trEmail.Visible = true;
                    lblName.Text = dependant.DependantName;
                    lblName.Enabled = false;
                    lblSurname.Text = dependant.DependantSurname;
                    lblSurname.Enabled = false;
                    tbEmail.Text = dependant.EmailAddress;
                    tbEmail.Enabled = false;
                    trButton.Visible = false;
                    btnSubmit.Enabled = false;
                    trPsword.Visible = false;
                    trPsword2.Visible = false;
                    tbUsername.Enabled = false;
                }
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
    }
}