using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentPlan
{
    public partial class PreliminaryQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnNext.Enabled = false;
                divUnderwriting.Visible = false;
            }
        }

        protected void rblIsSACitizen_SelectedIndexChanged(object sender, EventArgs e)
        {
            rblIsSACitizen.Enabled = false;
            if (((RadioButtonList)sender).SelectedItem.Value == "yes")
            {
                hfSACit.Value = "yes";
                divCitizenship.Visible = false;
                divUnderwriting.Visible = true;
                btnNext.Enabled = true;
            }
            else
            {
                Response.Redirect("OnlineApplicationForm.aspx?SANational=False");
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            DateTime dateOfBirth;
            if (DateOfBirth.Text == "")
            {
                lblDateError.Text = "Please select a date.";
            }
            else if (!DateTime.TryParse(DateOfBirth.Text, out dateOfBirth))
            {
                lblDateError.Text = "Please enter a valid date";
            }
            else
            {
                int now = int.Parse(DateTime.Today.ToString("yyyyMMdd"));
                int dob = int.Parse(DateTime.Parse(DateOfBirth.Text).ToString("yyyyMMdd"));
                string dif = (now - dob).ToString();
                string age = "0";
                if (dif.Length > 4)
                {
                    age = dif.Substring(0, dif.Length - 4);
                }
                if (int.Parse(age) >= 35 || rbHasBeforeYes.Checked || rbLastTwelfeYes.Checked || rbNextTwelfeYes.Checked)
                {
                    Response.Redirect("ApplyNow.aspx");
                }
                else
                {
                    Response.Redirect("OnlineApplicationForm.aspx?SANational=True");
                }
            }
        }
    }
}