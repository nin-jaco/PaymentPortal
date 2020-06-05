using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Universal.Data;
using System.Web.Security;
using System.Data;

namespace CompCare.ExistingMembers
{
    public partial class YourLimits : System.Web.UI.Page
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
                        List<Limit> limits = entity.Limits.Where(p => p.IdMember == idMember).ToList();
                        GridView1.DataSource = limits;
                        GridView1.DataBind();
                    }
                }
                catch(Exception ex)
                {
                    lblError.Text = @"The system encountered and error retrieving your limits.  Please report this error to the <a href='mailto:webmaster@universal.co.za'>Webmaster</a>";
                }
            }

            lblYear.Text = DateTime.Today.Year.ToString();
        }

    }
}