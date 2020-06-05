using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentPlan.DataModel;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;

namespace StudentPlan
{
    public class RemotePost
    {
        private System.Collections.Specialized.NameValueCollection Inputs = new System.Collections.Specialized.NameValueCollection();

        public string Url = "";
        public string Method = "post";
        public string FormName = "form1";

        public void Add(string name, string value)
        {
            Inputs.Add(name, value);
        }

        public void Post()
        {
            System.Web.HttpContext.Current.Response.Clear();

            System.Web.HttpContext.Current.Response.Write("<html><head>");

            System.Web.HttpContext.Current.Response.Write(string.Format("</head><body onload=\"document.{0}.submit()\">", FormName));
            System.Web.HttpContext.Current.Response.Write(string.Format("<form name=\"{0}\" method=\"{1}\" action=\"{2}\" >", FormName, Method, Url));
            for (int i = 0; i < Inputs.Keys.Count; i++)
            {
                System.Web.HttpContext.Current.Response.Write(string.Format("<input name=\"{0}\" type=\"hidden\" value=\"{1}\">", Inputs.Keys[i], Inputs[Inputs.Keys[i]]));
            }
            System.Web.HttpContext.Current.Response.Write("</form>");
            System.Web.HttpContext.Current.Response.Write("</body></html>");

            System.Web.HttpContext.Current.Response.End();
        }
    }
    
    public partial class ConfirmDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Reference"] == null)
                {
                    Response.Redirect("PreliminaryQuestions.aspx");
                }
                else
                {
                    string reference = Request.QueryString["Reference"].ToString();
                    hfReference.Value = reference;
                    using (UniversalEntities entity = new UniversalEntities())
                    {
                        Student student = entity.Students.Where(p => p.ReferenceNumber == reference).FirstOrDefault();
                        Session.Add("IdStudent", student.IdStudent);
                        startDate.Text = student.CommencementDate.Value.ToShortDateString();
                        title.Text = entity.Titles.Where(p => p.IdTitle == student.IdTitle).FirstOrDefault().TitleAbbreviation;
                        endDate.Text = student.EndDate.Value.ToShortDateString();
                        surname.Text = student.Surname;
                        firstNames.Text = student.FirstNames;
                        tbDOB.Text = student.DateOfBirth.Value.ToShortDateString();
                        tbIdNumber.Text = student.IDPassport;
                        studyInstitution.Text = entity.Institutions.Where(p => p.IdInstitution == student.StudyInstitution).FirstOrDefault().InstitutionName;
                        studentNumber.Text = student.StudentNumber;
                        contribution.Text = "R " + student.Contribution.ToString();
                        studyDuration.Text = student.StudyDuration.ToString() + " months";
                        lblReference.Text = student.ReferenceNumber;
                        StudentAddress postalAddress = entity.StudentAddresses.Where(p => p.IdStudent == student.IdStudent && p.IsPostalAddress.Value).FirstOrDefault();
                        StudentAddress physAddress = entity.StudentAddresses.Where(p => p.IdStudent == student.IdStudent && !p.IsPostalAddress.Value).FirstOrDefault();
                        OAddress1.Text = postalAddress.Address1;
                        OAddress2.Text = postalAddress.Address2;
                        OAddress3.Text = postalAddress.Address3;
                        OAddress4.Text = postalAddress.Address4;
                        lblOProvince.Text = entity.Provinces.Where(p => p.IdProvince == postalAddress.IdProvince).FirstOrDefault().Name;
                        OPostal.Text = postalAddress.PostalCode;
                        PAddress1.Text = physAddress.Address1;
                        PAddress2.Text = physAddress.Address2;
                        PAddress3.Text = physAddress.Address3;
                        PAddress4.Text = physAddress.Address4;
                        lblPProvince.Text = entity.Provinces.Where(p => p.IdProvince == physAddress.IdProvince).FirstOrDefault().Name;
                        PPostal.Text = physAddress.PostalCode;
                        tbGettingIncome.Text = student.IsGettingIncome.ToString();
                        tbIncomeAmount.Text = student.IncomeAmount.ToString();
                        tbCountryOfIssue.Text = entity.Countries.Where(p => p.IdCountry == student.CountryOfIssue.Value).FirstOrDefault().Name;
                        tbGender.Text = entity.Genders.Where(p => p.IdGender == student.IdGender).FirstOrDefault().GenderDescription;
                        tbMaritalStatus.Text = entity.MaritalStatusses.Where(p => p.IdMaritalStatus == student.IdMaritalStatus).FirstOrDefault().Description;
                        int now = int.Parse(DateTime.Today.ToString("yyyyMMdd"));
                        int dob = int.Parse(student.DateOfBirth.Value.ToShortDateString().Replace("/", ""));
                        string dif = (now - dob).ToString();
                        string age = "0";
                        if (dif.Length > 4)
                        {
                            age = dif.Substring(0, dif.Length - 4);
                        }
                        tbAge.Text = age;
                        int numberOfDependants = entity.StudentDependants.Where(p => p.IdStudent == student.IdStudent).ToList().Count();
                        email.Text = student.Email;
                        workTel.Text = student.BusinessTelephone;
                        homeTel.Text = student.HomeTelephone;
                        fax.Text = student.Facsimile;
                        cell.Text = student.Cellular;
                        gvMedicalHistory.DataSource = entity.TreatmentDetails.Where(p => p.IdStudent == student.IdStudent).ToList();
                        gvDependants.DataSource = entity.StudentDependants.Where(p => p.IdStudent == student.IdStudent).ToList();
                        gvMedicalHistory.DataBind();
                        gvDependants.DataBind();
                    }
                }
            }
        }

        protected void btnNextButton_Click(object sender, EventArgs e)
        {
            if (IAccept.Checked)
            {
                using (UniversalEntities entity = new UniversalEntities())
                {
                    Student student = entity.Students.Where(p => p.ReferenceNumber == hfReference.Value).FirstOrDefault();

                    if (cbBrokerAccept.Checked)
                    {
                        student.AppointedABSA = true;
                    }
                    else
                    {
                        student.AppointedABSA = false;
                    }
                    entity.SaveChanges();
                };

                RemotePost myremotepost = new RemotePost();
                myremotepost.Url = @"https://www.vcs.co.za/vvonline/ccform.asp";
                myremotepost.Add("p1", "2672");
                myremotepost.Add("p2", lblReference.Text);
                myremotepost.Add("p3", "CompCare NetworX StudentPlan Membership");
                myremotepost.Add("p4", contribution.Text.Remove(0,2));
                myremotepost.Add("Hash", CalculateMD5Hash("2672", lblReference.Text, "CompCare NetworX StudentPlan Membership", contribution.Text.Remove(0, 2), ConfigurationManager.AppSettings.Get("MD5Key")));
                myremotepost.Post();
            }
            else
            {
                lblError.Text = @"You need to accept the <a href='TermsAndConditions.aspx' target='_blank'>Terms and Conditions</a>";
            }
        }

        private string CalculateMD5Hash(string p, string p_2, string p_3, string p_4, string p_5)
        {
            string concatString = p + p_2 + p_3 + p_4 + p_5;
            MD5 md5Hashed = MD5.Create();
            byte[] data = md5Hashed.ComputeHash(Encoding.UTF8.GetBytes(concatString));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            string result = sBuilder.ToString();
            return result;
        }
    }
}