using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Universal.Data;

namespace CompCare.ExistingMembers
{
    public partial class HealthAndWellness : System.Web.UI.Page
    {
        private int idMember =0;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IdMember"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
               idMember = int.Parse(Session["IdMember"].ToString());
                
               using (UniversalEntities entity = new UniversalEntities())
               {
                   try
                   {
                       Member member = entity.Members.Where(p => p.IdMember == idMember).SingleOrDefault();
                       Dependant dependant = entity.Dependants.Where(i => i.IdMember == idMember && i.IdDependantType == 0).SingleOrDefault();
                       LifestylePlan plan = entity.LifestylePlans.Where(i => i.IdLifestylePlan == member.IdLifestylePlan).SingleOrDefault();
                       lbl360MemberhipNumber.Text = member.LifestyleMembershipNumber != null ? member.LifestyleMembershipNumber : "Not Available";
                       lbl360Plan.Text = plan != null ? plan.LifestylePlanName : "Not Available";
                       lblDiabeticStartDate.Text = dependant.DiabeticStartDate != null ? dependant.DiabeticStartDate.Value.ToShortDateString() : "n/a";
                       lblDiabeticEndDate.Text = dependant.DiabeticEndDate != null ? dependant.DiabeticEndDate.Value.ToShortDateString() : "n/a";
                       lblHeight.Text = dependant.Height != null ? dependant.Height.ToString() + "m" : "Not Available";
                       lblWeight.Text = dependant.Weight != null ? dependant.Weight.ToString() + "kg" : "Not Available";
                       lblIsDiabetic.Text = dependant.IsDiabetic != null ? (dependant.IsDiabetic.Value ? "Yes" : "No") : "Not Available";
                       lblIsSmoker.Text = dependant.IsSmoking != null ? (dependant.IsSmoking.Value ? "Yes" : "no") : "Not Available";
                   }
                   catch
                   {
                       lblError.Text = @"The website encountered a problem retrieving your health related information. Please report this error to the <a href='mailto:webmaster@universal.co.za'>Webmaster</a>";
                   }
               }
            }
        }
    }
}