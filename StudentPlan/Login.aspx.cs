using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentPlan.DataModel;
using System.Web.Security;

namespace StudentPlan
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                    lblLoginError.Text = "Please register as a user.";
                }
                else if (user.Password != password)
                {
                    isUser = false;
                    lblLoginError.Text = "Password Incorrect";
                }
                else if (!user.IsStudent.Value)
                {
                    isUser = false;
                    lblLoginError.Text = "Access not allowed";
                }
                else
                {
                    isUser = true;
                    Session.Add("IdUser", user.IdUser);
                }
            }
            return isUser;
        }
    }
}