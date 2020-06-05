using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Universal.Common;
using System.Drawing;
using System.Web.Security;
using Universal.Data;

namespace CompCare.ExistingMembers
{
    public partial class Statements : System.Web.UI.Page
    {
        CommonFunctions function = Global.functions;

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
                        tbEmail.Text = dependant.EmailAddress != null ? dependant.EmailAddress : "";
                        tbEmail2.Text = dependant.EmailAddress != null ? dependant.EmailAddress : "";
                    }
                    catch (Exception ex)
                    {
                        function.ReportError("www.compcare.co.za", "statements.aspx", ex.ToString());  
                    }
                }
            }
        }

        protected void btnStatement_Click(object sender, EventArgs e)
        {
            DateTime outFromDate;
            DateTime outTodate;
            if (DateTime.TryParse(tbDateFrom.Text, out outFromDate) && DateTime.TryParse(tbDateTo.Text, out outTodate))
            {
                if (tbEmail.Text == "")
                {
                    lblError.Text = "We were unable to retrieve an email address for you from the database.  Please provide an email address in the field provided.";
                    lblError.ForeColor = Color.Red;
                }
                else
                {
                    string status = function.SendEmailDocumentRequest("Statement", DateTime.Parse(tbDateFrom.Text), DateTime.Parse(tbDateTo.Text), "", GetMembershipNumber(), tbEmail.Text);

                    if (status == "Success")
                    {
                        lblError.Text = "The document has been sent to " + tbEmail.Text;
                        lblError.ForeColor = Color.Blue;
                    }
                    else
                    {
                        lblError.Text = "The system encountered a problem sending the email." + status;
                        lblError.ForeColor = Color.Red;
                    }
                }
            }
            else
            {
                lblError.Text = "Please provide valid dates for the date fields, format: yyyy/mm/dd.";  
            }            
        }

        protected void btnIRP5_Click(object sender, EventArgs e)
        {
            if (tbEmail2.Text == "")
            {
                lblError.Text = "We were unable to retrieve an email address for you from the database.  Please provide an email address in the field provided.";
                lblError.ForeColor = Color.Red;
            }
            else
            {
                string status = function.SendEmailDocumentRequest("IRP5", new DateTime(int.Parse(ddlYear.SelectedValue), 01, 01), new DateTime(int.Parse(ddlYear.SelectedValue), 01, 01), "", GetMembershipNumber(), tbEmail2.Text);

                if (status == "Success")
                {
                    lblError0.Text = "The document has been sent to " + tbEmail2.Text;
                    lblError0.ForeColor = Color.Blue;
                }
                else
                {
                    lblError0.Text = "The system encountered a problem sending the email." + status;
                    lblError0.ForeColor = Color.Red;
                }
            }
        }

        public string GetMembershipNumber()
        {
            string membershipNumber = "";

            if (Session["IdMember"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                int idMember = int.Parse(Session["IdMember"].ToString());                

                using (UniversalEntities entity = new UniversalEntities())
                {
                    membershipNumber = entity.Members.Where(p => p.IdMember == idMember).FirstOrDefault().MAMembershipNumber;
                }
                
            }
           return membershipNumber;             
        }
    }
}