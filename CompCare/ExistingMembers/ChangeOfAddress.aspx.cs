using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Web.Security;
using Universal.Data;

namespace CompCare.ExistingMembers
{
    public partial class ChangeOfAddress : System.Web.UI.Page
    {
        UniversalEntities entity = new UniversalEntities();
        int idMember = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IdMember"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                idMember = int.Parse(Session["IdMember"].ToString());
            }

            if (!IsPostBack)
            {
                btnSubmit.Enabled = false;
                using (UniversalEntities entity = new UniversalEntities())
                {
                    try
                    {
                        int idMember = int.Parse(Session["IdMember"].ToString());

                        Member member = (from i in entity.Members
                                         where i.IdMember == idMember
                                         select i).SingleOrDefault();
                        Dependant dependant = entity.Dependants.Where(i => i.IdMember == idMember && i.IdDependantType == 5).FirstOrDefault();
                        SchemeOption option = (from i in entity.SchemeOptions
                                               where i.IdSchemeOption == member.IdSchemeOption
                                               select i).SingleOrDefault();
                        User user = entity.Users.Where(i => i.IdMember == idMember).FirstOrDefault();
                        MemberAddress postalAddress = entity.MemberAddresses.Where(p => p.IdMember == idMember && p.IsPostalAddress == true).FirstOrDefault();
                        MemberAddress physicalAddress = entity.MemberAddresses.Where(p => p.IdMember == idMember && p.IsPostalAddress == false).FirstOrDefault();
                        Gender gender = entity.Genders.Where(p => p.IdGender == dependant.IdGender).SingleOrDefault();
                        ddlProvince.DataSource = entity.Provinces.ToList();
                        ddlProvince.DataBind();
                        Province physProvince = entity.Provinces.Where(p => p.IdProvince == physicalAddress.IdProvince).FirstOrDefault();
                        lblEmail.Text = dependant.EmailAddress != null ? dependant.EmailAddress : "Not Available";
                        lblAddress2.Text = postalAddress != null ? postalAddress.Address2 : "Not Available";
                        lblAddress3.Text = postalAddress != null ? postalAddress.Address3 : "Not Available";
                        lblAddress4.Text = postalAddress != null ? postalAddress.Address4 : "Not Available";
                        lblAddress1.Text = postalAddress != null ? postalAddress.Address1 : "Not Available";
                        lblPostalCode.Text = postalAddress != null ? postalAddress.PostalCode : "Not Available";
                        lblPhysical1.Text = physicalAddress != null ? physicalAddress.Address1 : "Not Available";
                        lblPhysical2.Text = physicalAddress != null ? physicalAddress.Address2 : "Not Available";
                        lblPhysical3.Text = physicalAddress != null ? physicalAddress.Address3 : "Not Available";
                        lblPhysical4.Text = physicalAddress != null ? physicalAddress.Address4 : "Not Available";
                        lblProvince.Text = physProvince != null ? physProvince.Name : "Not Available";
                        lblPhysicalCode.Text = physicalAddress != null ? physicalAddress.PostalCode : "Not Available";
                        lblTelephone.Text = dependant.TelephoneNumber != null ? dependant.TelephoneNumber : "Not Available";
                        lblCellular.Text = dependant.CellularNumber != null ? dependant.CellularNumber : "Not Available";
                        lblFaxNumber.Text = dependant.FaxNumber != null || dependant.FaxNumber != "" ? dependant.FaxNumber : "Not Available";
                        lblWorkNumber.Text = dependant.WorkNumber != null ? dependant.WorkNumber : "Not Available";
                    }
                    catch
                    {
                        lblError.Text = @"The website encountered a problem retrieving all of your data.  Please report this problem to the CompCare <a href='mailto:webmaster@universal.co.za'>Webmaster</a>.";
                    }
                    tbEmail.Visible = false;
                    tbFaxNumber.Visible = false;
                    groupPhysicalTB.Visible = false;
                    groupPostalTB.Visible = false;
                    tbCellular.Visible = false;
                    tbTelephone.Visible = false;
                    tbWorkNumber.Visible = false;
                    groupPhysicalLB.Visible = true;
                    groupPostalLB.Visible = true;
                    lblCellular.Visible = true;
                    lblEmail.Visible = true;
                    lblFaxNumber.Visible = true;
                    lblTelephone.Visible = true;
                    lblWorkNumber.Visible = true;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (entity.Connection.State != System.Data.ConnectionState.Open)
            {
                entity.Connection.Open();
            }

            try
            {
                Member member = entity.Members.Where(p => p.IdMember == idMember).SingleOrDefault();
                Dependant dependant = entity.Dependants.Where(i => i.IdMember == idMember && i.IdDependantType == 5).FirstOrDefault();
                string toAddress = @"Lydia.Tlhabanyane@universal.co.za";
                string title = "Member requests change of details on website";
                string mailBody = string.Format("A member requested that their details be updated.  The new details provided is as follows (please update where values are given): Membership Number - {0} Email - {1}, Telephone - {2}, Cellular - {3}, Postal Address Line 1 - {4}, Postal Address Line 2 - {5}, Postal Address Line 3 - {6}, Postal Address Line 4 - {13}, Postal Code - {7}, Fax Number: - {8}, Physical Address Line 1 - {9}, Physical Address Line 2 - {10}, Physical Address Line 3 - {11}, Physical Address Line 4 - {14}, Province - {15}, Physical Address Postal Code - {12}", member.MAMembershipNumber, tbEmail.Text, tbTelephone.Text, tbCellular.Text, tbAdddress1.Text, tbAddress2.Text, tbAddress3.Text, tbPostalCode.Text, tbFaxNumber.Text, tbPhysical1.Text, tbPhysical2.Text, tbPhysical3.Text, tbPhysicalCode.Text, tbAddress4.Text, tbPhysical4.Text, ddlProvince.Text);
                SendEmail(toAddress, title, mailBody);
                lblError.Text = "Request successfully processed.";
            }
            catch (Exception ex)
            {
                lblError.Text = @"Error processing your request.  Please try again later or report this problem to webmaster@universal.co.za";
            }
            finally
            {
                entity.Dispose();
            }
            try
            {
                string toAddress2 = tbEmail.Text != "" ? tbEmail.Text : lblEmail.Text;
                string title2 = "Update of Personal Details Request submitted on the CompCare Wellness Website";
                string mailBody2 = @"Dear Member,  your request to have your details updated was successfully captured on the CompCare Wellness Website and forwarded to the Administration Department for update.";
                SendEmail(toAddress2, title2, mailBody2);
            }
            catch (Exception)
            {
                lblError.Text = "We were unable to send you a confirmation email.";
            }
        }

        void SendEmail(string toAddress, string title, string mailBody)
        {
            MailMessage mailMessage = new MailMessage("webmaster@universal.co.za", toAddress, title, mailBody);
            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings.Get("SaoMailIP"), int.Parse(ConfigurationManager.AppSettings.Get("MailPort")));
            client.UseDefaultCredentials = true;
            client.Send(mailMessage);
        }

        protected void chPhysical_Click(object sender, EventArgs e)
        {
            groupPhysicalTB.Visible = true;
            groupPhysicalLB.Visible = false;
            tbPhysical1.Text = lblPhysical1.Text;
            tbPhysical2.Text = lblPhysical2.Text;
            tbPhysical3.Text = lblPhysical3.Text;
            tbPhysical4.Text = lblPhysical4.Text;
            //tbProvince.Text = lblProvince.Text;
            tbPhysicalCode.Text = lblPhysicalCode.Text;
            chPhysical.Visible = false;
            btnSubmit.Enabled = true;
        }

        protected void chPostal_Click(object sender, EventArgs e)
        {
            groupPostalTB.Visible = true;
            groupPostalLB.Visible = false;
            tbPostalCode.Text = lblPostalCode.Text;
            tbAdddress1.Text = lblAddress1.Text;
            tbAddress2.Text = lblAddress2.Text;
            tbAddress3.Text = lblAddress3.Text;
            tbAddress4.Text = lblAddress4.Text;
            chPostal.Visible = false;
            btnSubmit.Enabled = true;
        }

        protected void chFax_Click(object sender, EventArgs e)
        {
            tbFaxNumber.Visible =  true;
            lblFaxNumber.Visible = false;
            tbFaxNumber.Text = lblFaxNumber.Text;
            chFax.Visible = false;
            btnSubmit.Enabled = true;
        }

        protected void chWork_Click(object sender, EventArgs e)
        {
            tbWorkNumber.Visible = true;
            lblWorkNumber.Visible = false;
            tbWorkNumber.Text = lblWorkNumber.Text;
            chWork.Visible = false;
            btnSubmit.Enabled = true;
        }

        protected void chCell_Click(object sender, EventArgs e)
        {
            tbCellular.Visible = true;
            lblCellular.Visible = false;
            tbCellular.Text = lblCellular.Text;
            chCell.Visible = false;
            btnSubmit.Enabled = true;
        }

        protected void chTel_Click(object sender, EventArgs e)
        {
            tbTelephone.Visible = true;
            lblTelephone.Visible = false;
            tbTelephone.Text = lblTelephone.Text;
            chTel.Visible = false;
            btnSubmit.Enabled = true;
        }

        protected void chEmail_Click(object sender, EventArgs e)
        {
            tbEmail.Visible = true;
            lblEmail.Visible = false;
            tbEmail.Text = lblEmail.Text;
            chEmail.Visible = false;
            btnSubmit.Enabled = true;
        }
    }
}