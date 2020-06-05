using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Universal.Data;
using System.Web.Security;

namespace CompCare.ExistingMembers
{
    public partial class UsersHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IdMember"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
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
                        User user = entity.Users.Where( i => i.IdMember == idMember).FirstOrDefault();
                        MemberAddress postalAddress = entity.MemberAddresses.Where(p => p.IdMember == idMember && p.IsPostalAddress == true).FirstOrDefault();
                        MemberAddress physicalAddress = entity.MemberAddresses.Where(p => p.IdMember == idMember && p.IsPostalAddress == false).FirstOrDefault();
                        Gender gender = entity.Genders.Where(p => p.IdGender == dependant.IdGender).SingleOrDefault();
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
                        lblPhysicalCode.Text = physicalAddress != null ? physicalAddress.PostalCode : "Not Available";
                        lblTelephone.Text = dependant.TelephoneNumber != null ? dependant.TelephoneNumber : "Not Available";
                        lblCellular.Text = dependant.CellularNumber != null ? dependant.CellularNumber : "Not Available";
                        lblFaxNumber.Text = dependant.FaxNumber != null || dependant.FaxNumber != "" ? dependant.FaxNumber : "Not Available";
                        lblWorkNumber.Text = dependant.WorkNumber != null ? dependant.WorkNumber : "Not Available";
                        lblDOB.Text = dependant.DateOfBirth != null ? dependant.DateOfBirth.Value.ToShortDateString() : "Not Available";
                        //lblGender.Text = gender.GenderDescription;
                        lblGender.Text = dependant.Gender.GenderDescription;
                        lblIdNo.Text = dependant.IdentityNumber;
                        lblInitials.Text = dependant.Initials;
                        lblJoiningDate.Text = dependant.JoiningDate != null ? dependant.JoiningDate.Value.ToShortDateString() : "Not Available";
                        lblSurname.Text = dependant.DependantSurname;
                        lblName.Text = dependant.DependantName;
                        lblMemberName.Text = dependant.DependantName;
                        lblBenefitDate.Text = dependant.JoiningDate != null ? dependant.JoiningDate.Value.ToShortDateString() : "Not Available";
                        lblMembershipNumber.Text = member.MAMembershipNumber;
                        lblResignationDate.Text = dependant.ResignationDate != null ? dependant.ResignationDate.Value.ToShortDateString() : @"n/a";
                        lblSchemeOption.Text = option.SchemeOptionDescription;
                        lblSuspendedDate.Text = dependant.SuspendedFrom != null ? dependant.SuspendedFrom.Value.ToShortDateString() : @"n/a";
                        lblSuspendedTo.Text = dependant.SuspendedTo != null ? dependant.SuspendedTo.Value.ToShortDateString() : @"n/a";
                    }
                    catch 
                    {
                        lblError.Text = @"The website encountered a problem retrieving all of your data.  Please report this problem to the CompCare <a href='mailto:webmaster@universal.co.za'>Webmaster</a>.";
                    }
                }
            }
        }
    }
}