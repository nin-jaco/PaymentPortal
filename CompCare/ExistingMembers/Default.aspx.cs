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
    public partial class Default : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblLoginError.Text = "";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (AuthenticateUser(tbuserName.Text, tbPassword.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(tbuserName.Text, true);
            }
        }

        private bool AuthenticateUser(string username, string password)
        {
            lblLoginError.Text = "";
            bool isUser = false;
            using (UniversalEntities entity = new UniversalEntities())
            {
                User user = (from i in entity.Users
                             where i.Username == username
                             select i).FirstOrDefault();
                if (user == null)
                {
                    isUser = false;
                    lblLoginError.Text = "User not found in database";
                }
                else if (user.Password == "" || user.Password == null)
                {
                    isUser = false;
                    lblLoginError.Text = "No password saved in the database.  Please register as a user.";
                }
                else if (user.Password != password)
                {
                    isUser = false;
                    lblLoginError.Text = "Password Incorrect";
                }
                else if (!user.IsCompCare.HasValue || !user.IsCompCare.Value)
                {
                    isUser = false;
                    lblLoginError.Text = "You are not a CompCare member and may not access this website";
                }
                else
                {
                    isUser = true;
                    Session.Add("IdMember", user.IdMember);
                }
            }
            return isUser;
        }
    }
}