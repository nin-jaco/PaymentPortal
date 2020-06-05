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
    public partial class YourDependants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IdMember"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                try
                {
                    using (UniversalEntities entity = new UniversalEntities())
                    {
                        int idMember = int.Parse(Session["IdMember"].ToString());
                        Member member = entity.Members.Where(p => p.IdMember == idMember).SingleOrDefault();
                        List<Dependant> dependants = entity.Dependants.Where(p => p.IdMember == idMember && p.IdDependantType != 5).ToList();
                        GridView1.DataSource = dependants;
                        GridView1.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = @"The system encountered and error retrieving information on your Dependants.  Please report this error to the <a href='mailto:webmaster@universal.co.za'>Webmaster</a>";
                }
            }
        }
    }
}