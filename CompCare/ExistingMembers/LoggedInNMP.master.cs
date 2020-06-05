using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Universal.Data;

namespace CompCare.ExistingMembers
{
    public partial class LoggedInNMP : System.Web.UI.MasterPage
    {
        UniversalEntities entity = new UniversalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /*
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string url = @"DoctorSearch.aspx?name=" + tbDoctorName.Text + "&city=" + tbCity.Text;
            Response.Redirect(url);
        }
         * */
    }
}