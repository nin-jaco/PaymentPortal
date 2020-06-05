using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentPlan.DataModel;

namespace StudentPlan
{
    public partial class SubmitForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (UniversalEntities entity = new UniversalEntities())
                {
                    AccountType.DataSource = entity.AccountTypes.ToList();
                    AccountType.DataBind();
                    lbMaritalStatus.DataSource = entity.MaritalStatusses.ToList();
                    lbMaritalStatus.DataBind();
                }
            }
        }
    }
}