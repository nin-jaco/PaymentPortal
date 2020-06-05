using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentPlan.DataModel;
using System.Data;
using System.Net.Mail;
using System.Configuration;


namespace StudentPlan
{
    public partial class OnlineApplicationForm : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["SANational"] == null)
                {
                    Response.Redirect("PreliminaryQuestions.aspx");
                }
                else
                {
                    using (UniversalEntities entity = new UniversalEntities())
                    {
                        rblAccountType.DataSource = entity.AccountTypes.ToList();
                        rblAccountType.DataBind();
                        lbMaritalStatus.DataSource = entity.MaritalStatusses.ToList();
                        lbMaritalStatus.DataBind();
                        lbStudyInstitution.DataSource = entity.Institutions.ToList();
                        lbStudyInstitution.DataBind();
                        lbTitles.DataSource = entity.Titles.ToList();
                        lbTitles.DataBind();
                        lbOProvinces.DataSource = entity.Provinces.ToList();
                        lbPProvinces.DataSource = entity.Provinces.ToList();
                        lbOProvinces.DataBind();
                        lbPProvinces.DataBind();
                        string[] months = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
                        string[] years = { "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020" };
                        lbEndMonth.DataSource = months;
                        lbStartMonth.DataSource = months;
                        lbStartMonth.DataBind();
                        lbEndMonth.DataBind();
                        lbStartYear.DataSource = years;
                        lbEndYear.DataSource = years;
                        lbStartYear.DataBind();
                        lbEndYear.DataBind();
                        trIncomeAmount.Visible = false;

                        if (Request.QueryString["SANational"].ToString() == "True")
                        {
                            lblIdPassport.Text = @"Id Number:";
                            lbCountryOfIssue.DataSource = entity.Countries.Where(p => p.Name == "South Africa").ToList();
                            lbIncome.Text = @"Will you be earning a salary while studying?";
                            lbCountryOfIssue.DataBind();
                            hfIsSaNational.Value = "true";
                        }
                        else
                        {
                            lblIdPassport.Text = @"Passport Number:";
                            lbCountryOfIssue.DataSource = entity.Countries.ToList();
                            lbIncome.Text = @"Will you be receiving some sort of income during your study period, while in South Africa?";
                            lbCountryOfIssue.DataBind();
                            hfIsSaNational.Value = "false";
                        }
                    }
                    trExistingMembership.Visible = false;
                }
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            using (UniversalEntities entity = new UniversalEntities())
            {
                DateTime dob;
                DateTime commencementDate = new DateTime(int.Parse(lbStartYear.SelectedValue), ConvertToInt(lbStartMonth.SelectedValue), 01);
                DateTime endDate = new DateTime(int.Parse(lbEndYear.SelectedValue), ConvertToInt(lbEndMonth.SelectedValue), GetLastDayOfTheMonth(lbEndMonth.SelectedValue));
                User user = entity.Users.Where(p => p.Username == tbUsername.Text).FirstOrDefault();

                if (!DateTime.TryParse(DateOfBirth.Text, out dob))
                {
                    lblError.Text = "Please enter a valid Date of Birth";
                }
                else if (!CheckIfLongerThanSixMonths(endDate, commencementDate))
                {
                    lblError.Text = "We can unfortunately only consider cover of periods longer than 6 months.";
                }
                else if (rblGettingIncome.SelectedValue == "yes" && GrossIncome.Text == "")
                {
                    lblError.Text = "Please specify the approximate income amount you will be receiving during your study.";
                }
                else if (user != null)
                {
                    lblError.Text = "Username taken. Please supply a different username";
                }
                else if (tbPassword.Text != tbConfirmPassword.Text)
                {
                    lblError.Text = "Password fields does not match";
                }
                else
                {
                    string reference = tbIdNumber.Text + DateTime.Today.ToShortDateString().Replace("/", "") + DateTime.Now.ToShortTimeString().Replace(":", "").Remove(4, 3);
                    TimeSpan duration = endDate - commencementDate;
                    int s = int.Parse(lbStudyInstitution.SelectedValue);
                    int ins = entity.Institutions.Where(p => p.IdInstitution == s).FirstOrDefault().IdInstitution;
                    double months = Math.Round(duration.TotalDays / 30.4);
                    double contribution = Math.Round(months * 336);
                    int idTitle = int.Parse(lbTitles.SelectedItem.Value);
                    int idMaritalStatus = int.Parse(lbMaritalStatus.SelectedItem.Value);
                    int idCountryofIssue = int.Parse(lbCountryOfIssue.SelectedItem.Value);
                    int idAccountType = rblAccountType.SelectedItem != null ? int.Parse(rblAccountType.SelectedItem.Value) : 1;
                    string membershipNumber = "";
                    bool isExistingMember = false;

                    if (hfIsExisting.Value == "true")
                    {
                        isExistingMember = true;
                        membershipNumber = tbExistingMembershipNumber.Text;
                    }
                    else
                    {
                        List<Student> students = entity.Students.Where(p => !p.IsExistingMember.Value).OrderByDescending(p => p.MembershipNumber).ToList();
                        if (students.Count < 1)
                        {
                            membershipNumber = "4900000";
                        }
                        else
                        {
                            membershipNumber = (int.Parse(students[0].MembershipNumber) + 1).ToString();
                            if (membershipNumber.StartsWith("48"))
                            {
                                membershipNumber = "4900000";
                            }
                        }
                    }
                    bool isGettingIncome = false;
                    decimal incomeAmount = 0;
                    if (rblGettingIncome.SelectedValue == "yes")
                    {
                        isGettingIncome = true;
                        incomeAmount = decimal.Parse(GrossIncome.Text);
                    }
                    int idGender = int.Parse(listbGenders.SelectedValue);
                    Student student = new Student
                    {
                        Surname = surname.Text,
                        FirstNames = firstNames.Text,
                        DateOfBirth = dob,
                        RegistrationDate = DateTime.Today,
                        CommencementDate = commencementDate,
                        EndDate = endDate,
                        StudyInstitution = ins,
                        StudentNumber = studentNumber.Text,
                        Email = email.Text,
                        StudyDuration = months,
                        Contribution = contribution,
                        IDPassport = tbIdNumber.Text,
                        IdTitle = idTitle,
                        IdMaritalStatus = idMaritalStatus,
                        CountryOfIssue = idCountryofIssue,
                        BusinessTelephone = workTel.Text,
                        HomeTelephone = homeTel.Text,
                        Facsimile = fax.Text,
                        Cellular = cell.Text,
                        AccountHolderName = AccountHolderName.Text,
                        BankName = BankName.Text,
                        BranchCode = BranchCode.Text,
                        AccountNumber = AccountNumber.Text,
                        IdAccountType = idAccountType,
                        ReferenceNumber = reference,
                        MembershipNumber = membershipNumber,
                        IsExistingMember = isExistingMember,
                        IsGettingIncome = isGettingIncome,
                        IncomeAmount = incomeAmount,
                        IdGender = idGender
                    };
                    entity.AddObject("Students", student);
                    entity.SaveChanges();

                    Student savedStudent = entity.Students.Where(p => p.ReferenceNumber == reference).FirstOrDefault();
                    int postalProvince = int.Parse(lbOProvinces.SelectedItem.Value);
                    int physProvince = int.Parse(lbPProvinces.SelectedItem.Value);

                    StudentAddress postal = new StudentAddress
                    {
                        Address1 = OAddress1.Text,
                        Address2 = OAddress2.Text,
                        Address3 = OAddress3.Text,
                        Address4 = OAddress4.Text,
                        IdProvince = postalProvince,
                        IdStudent = savedStudent.IdStudent,
                        PostalCode = OPostal.Text,
                        IsPostalAddress = true,
                        Country = "South Africa",
                        DateCreated = DateTime.Today
                    };

                    StudentAddress phys = new StudentAddress
                    {
                        Address1 = PAddress1.Text,
                        Address2 = PAddress2.Text,
                        Address3 = PAddress3.Text,
                        Address4 = PAddress4.Text,
                        IdProvince = physProvince,
                        IdStudent = savedStudent.IdStudent,
                        PostalCode = PPostal.Text,
                        IsPostalAddress = false,
                        Country = "South Africa",
                        DateCreated = DateTime.Today
                    };

                    User newUser = new User
                    {
                        Username = tbUsername.Text,
                        Password = tbPassword.Text,
                        DateCreated= DateTime.Today,
                        IdStudent = savedStudent.IdStudent,
                        IsActive = true,
                        IsAdmin = false,
                        IsBCIMA = false,
                        IsBroker = false,
                        IsCompany = false,
                        IsCompCare = true,
                        IsGrintek = false,
                        IsLifestyle = false,
                        IsNHBRCFLI = false,
                        IsPartner = false,
                        IsStudent = true,
                        IsSupplier = false,
                        IsTiger = false,
                        IsWorkerPlan = false,
                        UserLevel = 0
                    };

                    entity.AddObject("Users", newUser);
                    entity.AddObject("StudentAddresses", postal);
                    entity.AddObject("StudentAddresses", phys);
                    entity.SaveChanges();

                    User savedUser =  entity.Users.Where(p => p.IdStudent == savedStudent.IdStudent).FirstOrDefault();
                    SendEmail(savedStudent.Email, "You have been successfully registered on the CompCare StudentPlan website", string.Format("Dear {0}, \r\n You have been successfully registered on the CompCare StudentPlan website.  Your Username have been saved to the database as {1}. \r\n Kind regards, \r\n CompCare Webmaster", savedStudent.FirstNames, savedUser.Username));

                    if (hfIsSaNational.Value == "false")
                    {
                        Response.Redirect("DependantMedical.aspx?Reference=" + reference);
                    }
                    else
                    {
                        Response.Redirect("ConfirmDetails.aspx?Reference=" + reference);

                    }
                }
            }
        }

        private int GetLastDayOfTheMonth(string p)
        {
            int dayInt = 0;

            switch (p)
            {
                case "December":
                    dayInt = 31;
                    break;
                case "November":
                    dayInt = 30;
                    break;
                case "January":
                    dayInt = 31;
                    break;
                case "February":
                    dayInt = 28;
                    break;
                case "March":
                    dayInt = 31;
                    break;
                case "April":
                    dayInt = 30;
                    break;
                case "May":
                    dayInt = 31;
                    break;
                case "June":
                    dayInt = 30;
                    break;
                case "July":
                    dayInt = 31;
                    break;
                case "August":
                    dayInt = 31;
                    break;
                case "September":
                    dayInt = 30;
                    break;
                case "October":
                    dayInt = 31;
                    break;
                default:
                    dayInt = 31;
                    break;
            }
            return dayInt;
        }

        private int ConvertToInt(string p)
        {
            int monthInt = 0;
            
            switch (p)
            {
                case "December":
                    monthInt = 12;
                    break;
                case "November":
                    monthInt = 11;
                    break;
                case "January":
                    monthInt = 1;
                    break;
                case "February":
                    monthInt = 2;
                    break;
                case "March":
                    monthInt = 3;
                    break;
                case "April":
                    monthInt = 4;
                    break;
                case "May":
                    monthInt = 5;
                    break;
                case "June":
                    monthInt = 6;
                    break;
                case "July":
                    monthInt = 7;
                    break;
                case "August":
                    monthInt = 8;
                    break;
                case "September":
                    monthInt = 9;
                    break;
                case "October":
                    monthInt = 10;
                    break;
                default:
                    monthInt = 1;
                    break;
            }
            return monthInt;
        }

        private bool CheckIfLongerThanSixMonths(DateTime endDate, DateTime commencementDate)
        {
            TimeSpan duration = endDate - commencementDate;
            double months = Math.Round(duration.TotalDays / 30.4);
            if (months >= 6)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private string PadToFive(string p)
        {
            for (int i = 0; i < 5; i++)
            {
                p = "0" + p;
            }
            return p;
        }

        protected void rblExisting_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((RadioButtonList)sender).SelectedItem.Value == "extension")
            {
                trExistingMembership.Visible = true;
                hfIsExisting.Value = "true";
            }
            else if(((RadioButtonList)sender).SelectedItem.Value == "new")
            {
                trExistingMembership.Visible = false;
                hfIsExisting.Value = "false";
            }
        }

        protected void rblGettingIncome_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (((RadioButtonList)sender).SelectedItem.Value == "yes")
            {
                hfGettingIncome.Value = "true";
                trIncomeAmount.Visible = true;
                GrossIncome.Focus();
            }
            else
            {
                hfGettingIncome.Value = "false";
                trIncomeAmount.Visible = false;
                rblGettingIncome.Focus();
            }
        }

        void SendEmail(string toAddress, string title, string mailBody)
        {
            try
            {
                if (toAddress != null)
                {
                    MailMessage mailMessage = new MailMessage("webmaster@universal.co.za", toAddress, title, mailBody);
                    SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings.Get("SaoMailIP"), int.Parse(ConfigurationManager.AppSettings.Get("MailPort")));
                    client.UseDefaultCredentials = true;
                    client.Send(mailMessage);
                }
            }
            catch
            {
                //lblError.Text = "The system was unable to send you the confirmation email.  Have you provided us with a valid email address?";
            }
        }

        protected void valMembershipNumber_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length > 0 && args.Value.Length > 13)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void valSurname_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value == "")
            {
                args.IsValid = false;
            }
            else if(args.Value.Length > 50)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void valFirstNames_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value == "")
            {
                args.IsValid = false;
            }
            else if (args.Value.Length > 50)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void valDOB_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dob;
            if (args.Value == "")
            {
                args.IsValid = false;
            }
            else if (!DateTime.TryParse(args.Value.ToString(), out dob))
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void valGrossIncome_ServerValidate(object source, ServerValidateEventArgs args)
        {
            double amnt;
            if (double.TryParse(args.Value, out amnt))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

    }
}