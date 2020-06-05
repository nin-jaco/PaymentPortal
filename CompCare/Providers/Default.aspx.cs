using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Universal.Data;

namespace CompCareWebsite.Providers
{
    public partial class Default : System.Web.UI.Page
    {
        UniversalEntities entity = new UniversalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (tbMembershipNumber.Text == "" || tbDateOfBirth.Text == "")
            {
                lblError.Text = "Please provide values for both fields in the form.";
            }
            else
            {
                Member member = (from i in entity.Members
                                 where i.MAMembershipNumber == tbMembershipNumber.Text
                                 select i).SingleOrDefault();
                if (member == null)
                {
                    lblError.Text = "Membership number does not exist in the database.";
                }
                else
                {
                    List<Dependant> dependants = (from i in entity.Dependants
                                                  where i.IdMember == member.IdMember
                                                  select i).ToList();
                    List<string> birthdays = new List<string>();
                    foreach (var item in dependants)
                    {
                        birthdays.Add(item.DateOfBirth.Value.ToShortDateString());
                    }

                    if (!birthdays.Contains(tbDateOfBirth.Text))
                    {
                        lblError.Text = "Date of Birth value incorrect.";
                    }
                    else
                    {
                        DateTime dob = DateTime.Parse(tbDateOfBirth.Text);
                        Dependant dependant = dependants.Where(p => p.DateOfBirth == dob).SingleOrDefault();

                        if (dependant.ResignationDate == null)
                        {
                            lblError.Text = "Member is active";
                        }
                        else
                        {
                            lblError.Text = "Member has resigned from the medical aid";
                        }
                    }
                }
            }
        }
    }
}