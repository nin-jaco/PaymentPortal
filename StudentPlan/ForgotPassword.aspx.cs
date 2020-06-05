using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using StudentPlan.DataModel;
using System.Drawing;

namespace StudentPlan
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
                User user = entity.Users.Where(i => i.Username == tbUsername.Text).SingleOrDefault();
                if (user == null)
                {
                    lblChangePasswordError.Text = "User does not exist in database.";
                }
                else
                {
                    
                    Student student = entity.Students.Where(i => i.IDPassport == tbIdnumber.Text).SingleOrDefault();
                    if (student.IDPassport.ToLower() != tbUsername.Text.ToLower())
                    {
                        lblChangePasswordError.Text = "Please provide a vaild ID /Passport number.";
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
                        string toAddress = student.Email;
                        string toAddress2 = @"webmaster@universal.co.za";
                        string title = "Password Changed on CompCare Website";
                        string mailBody = string.Format(" Dear {0}, you have successfully changed your website password on the StudentPlan website.", student.FirstNames);
                        string mailBody2 = string.Format("Student {0} changed password to {1}", student.IdStudent, tbPassword1.Text);
                        SendEmail(toAddress2, title, mailBody2);
                        try
                        {
                            SendEmail(toAddress, title, mailBody);
                        }
                        catch (Exception ex)
                        {
                            lblChangePasswordError.Text = @"The system encountered a problem sending your confirmation email.  Have you supplied us your correct Email Address?  If you believe this is in error please report this problem to the <a href='mailto:webmaster@universal.co.za'>webmaster</a>.";
                        }
                    }
                }
            }
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