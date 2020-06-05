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
    public partial class EMembersNMP : System.Web.UI.MasterPage
    {
        UniversalEntities entity = new UniversalEntities();
        
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void tbLogin_Click(object sender, EventArgs e)
        {
            if (AuthenticateUser(tbLoginUsername.Text, tbLoginPassword.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(tbLoginUsername.Text, true);
                Response.Redirect("UsersHomePage.aspx");
            }
        }

        private bool AuthenticateUser(string username, string password)
        {

            bool isUser = false;
            using (UniversalEntities entity = new UniversalEntities())
            {
                User user = (from i in entity.Users
                             where i.Username == username
                             select i).SingleOrDefault();
                if (user == null)
                {
                    isUser = false;
                    lblLoginError.Text = "User not found in database";
                }
                else if (user.Password != password)
                {
                    isUser = false;
                    lblLoginError.Text = "Password Incorrect";
                }
                else if (!user.IsCompCare.Value)
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

        protected void btnRegister_Clicked(object s, EventArgs e)
        {
            string url = @"RegisterUser.aspx?MembershipNumber=" + tbMembershipNumber.Text + "&idNumber=" + tbIdNumber.Text;
            Response.Redirect(url);
        }
    }
}