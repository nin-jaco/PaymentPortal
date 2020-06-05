using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace CompCareWebsite.NewMembers
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string toAddress = @"newbiz@universal.co.za";
            string title = "Prospective member enquired on website";
            string mailBody = string.Format("A prospective member enquired on the CompCare website for medical aid.  Please assign this lead to a consultant for action.  The lead was created on {0} and his/her details are as follows: Name - {1}, Surname - {2}, Cellular - {3}, Email - {4}, Marital Status - {5}, Number of Dependants {6}, Telephone Number - {7}", DateTime.Today, tbName.Text, tbSurname.Text, tbCellular.Text, tbEmail.Text, ddlMarital.SelectedValue, ddlNoOfDependants.SelectedValue, tbTelephone.Text );
            SendEmail(toAddress, title, mailBody);
            ClearFormValueFields();
            lblStatus.Text = "Request sent successfully!";
        }

        private void ClearFormValueFields()
        {
            tbName.Text = "";
            tbSurname.Text = "";
            tbCellular.Text="";
            tbEmail.Text = "";
            ddlMarital.ClearSelection();
            ddlNoOfDependants.ClearSelection();
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