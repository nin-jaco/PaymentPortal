using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentPlan.DataModel;
using iTextSharp;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;
using System.Net.Mail;
using System.Configuration;
using System.Data;

namespace StudentPlan
{
    public partial class Success : System.Web.UI.Page
    {
        UniversalEntities entity = new UniversalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string referenceNumber = Request.QueryString["p2"];
                lblReferenceNumber.Text = referenceNumber;
                lblAuthorisationNumber.Text = Request.QueryString["p3"].Remove(6, 10);
                lblCardHolderName.Text = Request.QueryString["p5"];
                lblAmount.Text = Request.QueryString["p6"];
                lblCartType.Text = Request.QueryString["p7"];
                lblDescriptionOfGoods.Text = Request.QueryString["p8"];
                lblCardHolderEmail.Text = Request.QueryString["p9"];
                lblMaskedCardNumber.Text = Request.QueryString["MaskedCardNumber"];
                
                //string test = Request.QueryString.ToString();
                Student stud = entity.Students.Where(p => p.ReferenceNumber == referenceNumber).FirstOrDefault();

                SuccessText.Text = "Before we process your certificate, please choose your preferred General practitioner.";
                //int idStudent = int.Parse(Session["IdStudent"].ToString());
                //Student stud = entity.Students.Where(p => p.IdStudent == idStudent).FirstOrDefault();
                hfIdStudent.Value = stud.IdStudent.ToString();
                StudentAddress physAddress = entity.StudentAddresses.Where(p => p.IdStudent == stud.IdStudent && !p.IsPostalAddress.Value).FirstOrDefault();
                List<Supplier> sups = entity.Suppliers.Where(p => (p.IdDiscipline.Value == 10 || p.IdDiscipline.Value == 11) && p.IsNetworkSupplier.Value && p.SupplierPhysicalAddress3.Contains(physAddress.Address3)).ToList();
                if (sups.Count < 1)
                {
                    gvProviders.DataSource = entity.Suppliers.Where(p => (p.IdDiscipline.Value == 10 || p.IdDiscipline.Value == 11) && p.IsNetworkSupplier.Value && p.SupplierPhysicalAddress4.Contains(physAddress.Address4)).ToList().OrderBy(p => p.SupplierName).Take(5);
                }
                else
                {
                    gvProviders.DataSource = sups.OrderBy(p => p.SupplierName).Take(5);
                }
                gvProviders.DataBind();
                btnAccept.Enabled = true;
            }
            
        }



        private void SendCertificateAndNotifyABSA()
        {
            Student student = entity.Students.Where(p => p.ReferenceNumber == lblReferenceNumber.Text).FirstOrDefault();
            student.TransactionSuccess = true;
            //student.PreferredSupplier = hfSupplierSelected.Value != "" ? int.Parse(hfSupplierSelected.Value) : null;
            entity.SaveChanges();

            //
            string fileNameExisting = ConfigurationManager.AppSettings.Get("FilePath") + "certificateTemplate.pdf";
            string fileNameNew = ConfigurationManager.AppSettings.Get("FilePath") + "Cert_" + student.ReferenceNumber + ".pdf";

            // open the reader 
            PdfReader reader = new PdfReader(fileNameExisting);
            Rectangle size = reader.GetPageSizeWithRotation(1);
            Document document = new Document(size);

            // open the writer 
            FileStream fs = new FileStream(fileNameNew, FileMode.Create, FileAccess.Write);
            PdfWriter writer = PdfWriter.GetInstance(document, fs);
            document.Open();

            // the pdf content 
            PdfContentByte cb = writer.DirectContent;

            // select the font properties 
            BaseFont bf = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            cb.SetColorFill(BaseColor.DARK_GRAY);
            cb.SetFontAndSize(bf, 10);

            // write the text in the pdf content 
            cb.BeginText();
            //line1
            cb.ShowTextAligned(3, DateTime.Today.ToShortDateString(), 140, 575, 0);
            cb.ShowTextAligned(3, student.CommencementDate.Value.ToShortDateString(), 430, 575, 0);
            //line2
            cb.ShowTextAligned(3, student.FirstNames, 140, 555, 0);
            cb.ShowTextAligned(3, student.EndDate.Value.ToShortDateString(), 430, 555, 0);
            //line3
            cb.ShowTextAligned(3, student.Surname, 140, 530, 0);
            cb.ShowTextAligned(3, student.MembershipNumber, 430, 530, 0);
            //line4
            cb.ShowTextAligned(3, student.StudentNumber, 140, 510, 0);
            cb.ShowTextAligned(3, "R " + student.Contribution.ToString() + ".00", 430, 510, 0);
            //line5
            cb.ShowTextAligned(3, student.IDPassport, 140, 488, 0);
            cb.ShowTextAligned(3, student.StudyDuration.ToString(), 430, 488, 0);
            //line6
            Institution ins = entity.Institutions.Where(p => p.IdInstitution == student.StudyInstitution).FirstOrDefault();
            cb.ShowTextAligned(3, ins.InstitutionName, 140, 468, 0);
            cb.EndText();
            //add template to content
            PdfImportedPage page = writer.GetImportedPage(reader, 1);
            cb.AddTemplate(page, 0, 0);
            // close the streams and voilá the file should be changed :) 
            document.Close();
            fs.Close();
            writer.Close();
            reader.Close();

            //

            //create pdf Document
            //var pdf = new Document(PageSize.A4, 50, 50, 0, 0);
            //string filename = ConfigurationManager.AppSettings.Get("FilePath") + student.ReferenceNumber + ".pdf";
            //PdfWriter writer = PdfWriter.GetInstance(pdf, new FileStream(filename, FileMode.Create));
            //pdf.Open();

            ////Fonts----//
            //var titleFont = FontFactory.GetFont("Calibri", 13, Font.BOLD);
            //var bodyFont = FontFactory.GetFont("Calibri", 11, Font.NORMAL);

            ////Header and Footer
            //var header = iTextSharp.text.Image.GetInstance(Server.MapPath("~/Images/DocHeader.jpg"));
            //header.SetAbsolutePosition(0, 750);
            //header.ScaleAbsolute(600, 100);
            //pdf.Add(header);
            //var footer = iTextSharp.text.Image.GetInstance(Server.MapPath("~/Images/DocFooter.jpg"));
            //footer.SetAbsolutePosition(0, 0);
            //footer.ScaleAbsolute(600, 100);
            //pdf.Add(footer);

            //populate document
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph("Date: " + DateTime.Today.ToShortDateString(), bodyFont));
            //pdf.Add(new Paragraph("Name: " + student.FirstNames, bodyFont));
            //pdf.Add(new Paragraph("Surname: " + student.Surname, bodyFont));
            //pdf.Add(new Paragraph("Student No: " + student.StudentNumber, bodyFont));
            //pdf.Add(new Paragraph("Passport No: " + student.IDPassport, bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph("Membership Application", titleFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph("We are pleased to welcome you to the CompCare Wellness NetworX option for students with effect from " + student.CommencementDate.Value.ToShortDateString() + " to " + student.EndDate.Value.ToShortDateString() + ". CompCare Wellness is a Registered Medical Scheme and qualifies as an approved Medical Insurance product for foreign students as required by the Department of Home affairs.", bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph("Your medical aid number is " + student.MembershipNumber + ". Your new medical aid card, which shows your medical aid number, will follow shortly.", bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph("We acknowledge receipt of your contribution of ZAR" + student.Contribution + ", which covers membership of the Scheme for " + student.StudyDuration + " months.", bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph("Please note the following:", titleFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph("1. This cover will not be cancelled for any reason unless we are requested to do so by the Institution at which you are studying.", bodyFont));
            //pdf.Add(new Paragraph("2. Please ensure that you consult your selected contracted Universal Healthcare Doctor for all your medical requirements. Two out-of-area visits per beneficiary will be covered per annum. The member is required to pay the out-of-area provider in cash and claim back. Reimbursement is at 80% of the cost of the claim to a maximum of R750 per event (i.e. for the GP consultation and all related costs).", bodyFont));
            //pdf.Add(new Paragraph("3. If your contracted Doctor refers you to a Hospital or a Specialist, please ensure that you contact us for an authorisation. If you are referred without an authorisation, the account will not be paid.", bodyFont));
            //pdf.Add(new Paragraph("4. In the rare case that you receive an account from a Doctor, please send it to us and we will reimburse your costs at the agreed rate.", bodyFont));
            //pdf.Add(new Paragraph("5. Should you wish to change your selected Doctor, please contact us at least 30 days in advance of the change.", bodyFont));
            //pdf.Add(new Paragraph("6. A 12 month exclusion applies to pregnancy and related claims if applicable.", bodyFont));
            //pdf.Add(new Paragraph("We sincerely hope that your membership of the Scheme will be long and mutually beneficial. Please contact us by phone, fax or e-mail should you have any query.", bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph("Yours sincerely", bodyFont));
            //pdf.Add(new Paragraph(" ", bodyFont));
            //pdf.Add(new Paragraph("CompCare Wellness Medical Scheme", titleFont));

            
            //string filename = @"C:\\Users\\jaco.kleynhans\\Documents\\Visual Studio 2010\\Projects\\CompCare\\StudentPlan\\Certificates\\" + student.IDPassport + "-" + DateTime.Today + ".pdf";
            //iTextSharp.text.Image header = iTextSharp.text.Image.GetInstance(ConfigurationManager.AppSettings.Get("FilePath") + "header.jpg");
            //iTextSharp.text.Image footer = iTextSharp.text.Image.GetInstance(ConfigurationManager.AppSettings.Get("FilePath") + "footer.jpg");            
            
            //pdf.Close();

            NotifyNetworks(student);
            NotifyABSA(student);
            NotiFyMembership(student, fileNameNew);
            NotifyEsther(student);
            NotifyNewBiz(student);
            NotifyWebmaster(student);
            SendApplicationForm(student);
            string toAddress = student.Email;
            string mailTitle = "StudentPlan Membership Certificate";
            string mailBody = string.Format("Dear {0}, please find your membership certificate attached. \r\n Kind Regards. \r\n StudentPlan Webmaster.", student.FirstNames);
            SendEmail(toAddress, mailTitle, mailBody, fileNameNew);

            btnAccept.Enabled = false;
            SuccessText.Text = "Certificate emailed.";
            gvProviders.Visible = false;
            dvSuppliers.Visible = false;
            Response.Redirect("ThankYou.aspx");
        }

        private void NotifyWebmaster(Student student)
        {
            string toAddress2 = @"webmaster@universal.co.za";
            string title2 = "New Student Registration on StudentPlan Website";
            string mailBody2 = string.Format("Dear Master of the Interweb. Please be advised the following student has registered on the StudentPlan website. \r\n  " +
                "Name: {0}, Surname: {1}, Commencement Date: {2}, End Date: {3}, Membership Number: {4}, Reference Number: {5}, Amount Paid: {6}", student.FirstNames, student.Surname, student.CommencementDate, student.EndDate, student.MembershipNumber, student.ReferenceNumber, student.Contribution);
            SendEmail(toAddress2, title2, mailBody2, null);
        }

        private void NotifyNewBiz(Student student)
        {
            string toAddress2 = @"newbiz@universal.co.za";
            string title2 = "New Student Registration on StudentPlan Website";
            string mailBody2 = string.Format("Dear Marketing team. Please be advised the following student has registered on the StudentPlan website. \r\n  " +
                "Name: {0}, Surname: {1}, Commencement Date: {2}, End Date: {3}, Membership Number: {4}, Reference Number: {5}, Amount Paid: {6}", student.FirstNames, student.Surname, student.CommencementDate, student.EndDate, student.MembershipNumber, student.ReferenceNumber, student.Contribution);
            SendEmail(toAddress2, title2, mailBody2, null);
        }

        private void NotifyABSA(Student student)
        {
           int[] idInstitutions = {11,67,41,46,61,63,55};

           int ins = entity.Institutions.Where(p => p.IdInstitution == student.StudyInstitution.Value).FirstOrDefault().IdInstitution;
            
            if (student.AppointedABSA != null)
            {
                if (student.AppointedABSA.Value && idInstitutions.Contains(ins))
                {
                    string toAddress2 = @"international.students@absa.co.za";
                    string title2 = "New Student Registration on StudentPlan Website";
                    string mailBody2 = string.Format("Dear ABSA Broker team. Please be advised the following student has registered on the StudentPlan website and has selected to appoint you as his/her broker. \r\n  Name: {0}, Surname: {1}, Commencement Date: {2}, End Date: {3}, Membership Number: {4}", student.FirstNames, student.Surname, student.CommencementDate, student.EndDate, student.MembershipNumber);
                    SendEmail(toAddress2, title2, mailBody2, null);
                }
            }
        }

        private void NotifyEsther(Student student)
        {
            int[] idInstitutions = { 69,54,70,63,60 };

            Institution ins = entity.Institutions.Where(p => p.IdInstitution == student.StudyInstitution.Value).FirstOrDefault();

            if (idInstitutions.Contains(ins.IdInstitution))
            {
                string toAddress2 = @"esther.oosthuizen@universal.co.za";
                string title2 = "New Student Registration on StudentPlan Website";
                string mailBody2 = string.Format("Dear Esther. Please be advised the following student has registered on the StudentPlan website. \r\n  Name: {0}, Surname: {1}, Commencement Date: {2}, End Date: {3}, Membership Number: {4} \r\n  He will be studying at {5}", student.FirstNames, student.Surname, student.CommencementDate, student.EndDate, student.MembershipNumber, ins.InstitutionName);
                SendEmail(toAddress2, title2, mailBody2, null);
            }
        }

        private void NotiFyMembership(Student student, string fileName)
        {
            string toAddress2 = @"kamini.nagar@universal.co.za";
            string title2 = "New Student Registration on StudentPlan Website";
            string mailBody2 = string.Format("Dear Membership team. Please be advised the following student has registered on the StudentPlan website. \r\n  " + 
                "Name: {0}, Surname: {1}, Commencement Date: {2}, End Date: {3}, Membership Number: {4}, Reference Number: {5}, Amount Paid: {6}", student.FirstNames, student.Surname, student.CommencementDate, student.EndDate, student.MembershipNumber, student.ReferenceNumber, student.Contribution);
            SendEmail(toAddress2, title2, mailBody2, fileName);
        }

        private void SendApplicationForm(Student student)
        {
            CompletePage1AndSend(student);
            CompletePage2AndSend(student);        
        }

        private void CompletePage2AndSend(Student student)
        {
            //page 2
            string fileNameExisting = ConfigurationManager.AppSettings.Get("ApplicationFormFilePath") + "TemplatePage2.pdf";
            string fileNameNew = ConfigurationManager.AppSettings.Get("ApplicationFormFilePath") + "App_" + student.ReferenceNumber + "Page2" + ".pdf";

            // open the reader 
            PdfReader reader = new PdfReader(fileNameExisting);
            Rectangle size = reader.GetPageSizeWithRotation(1);
            Document document = new Document(size);

            // open the writer 
            FileStream fs = new FileStream(fileNameNew, FileMode.Create, FileAccess.Write);
            PdfWriter writer = PdfWriter.GetInstance(document, fs);
            document.Open();

            // the pdf content 
            PdfContentByte cb = writer.DirectContent;

            // select the font properties 
            BaseFont bf = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            cb.SetColorFill(BaseColor.DARK_GRAY);
            cb.SetFontAndSize(bf, 8);

            // write the text in the pdf content 
            cb.BeginText();
            //line1
            cb.ShowTextAligned(3, student.AccountHolderName, 140, 640, 0);
            //line 2
            cb.ShowTextAligned(3, student.BankName, 140, 620, 0);
            cb.ShowTextAligned(3, student.BranchCode, 450, 620, 0);
            //line3
            cb.ShowTextAligned(3, student.AccountNumber, 140, 600, 0);
            //line4
            AccountType acType = entity.AccountTypes.Where(p => p.IdAccountType == student.IdAccountType).FirstOrDefault();
            cb.ShowTextAligned(3, acType.TypeName, 140, 580, 0);
            //line5
            cb.ShowTextAligned(3, student.AppointedABSA != null ? (student.AppointedABSA.Value != false ? "ABSA" : "n/a") : "n/a", 210, 165, 0);
            cb.ShowTextAligned(3, student.AppointedABSA != null ? (student.AppointedABSA.Value != false ? "3401" : "n/a") : "n/a", 470, 165, 0);
            cb.ShowTextAligned(3, student.RegistrationDate.Value.ToShortDateString(), 210, 150, 0);
            cb.EndText();
            //add template to content
            PdfImportedPage page = writer.GetImportedPage(reader, 1); 
            cb.AddTemplate(page, 0, 0); 
            // close the streams and voilá the file should be changed :) 
            document.Close();
            fs.Close();
            writer.Close();
            reader.Close();
            SendEmail("kamini.nagar@universal.co.za", "StudentPlan Application Form", "See Attached", fileNameNew);
        }

        private void CompletePage1AndSend(Student student)
        {
            string fileNameExisting = ConfigurationManager.AppSettings.Get("ApplicationFormFilePath") + "TemplatePage1.pdf";
            string fileNameNew = ConfigurationManager.AppSettings.Get("ApplicationFormFilePath") + "App_" + student.ReferenceNumber + ".pdf";

            // open the reader 
            PdfReader reader = new PdfReader(fileNameExisting);
            Rectangle size = reader.GetPageSizeWithRotation(1);
            Document document = new Document(size);

            // open the writer 
            FileStream fs = new FileStream(fileNameNew, FileMode.Create, FileAccess.Write);
            PdfWriter writer = PdfWriter.GetInstance(document, fs);
            document.Open();

            // the pdf content 
            PdfContentByte cb = writer.DirectContent;

            // select the font properties 
            BaseFont bf = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            cb.SetColorFill(BaseColor.DARK_GRAY);
            cb.SetFontAndSize(bf, 8);

            // write the text in the pdf content 
            cb.BeginText();
            //line1
            cb.ShowTextAligned(3, student.CommencementDate.Value.ToShortDateString(), 140, 670, 0);
            cb.ShowTextAligned(3, student.EndDate.Value.ToShortDateString(), 450, 670, 0);
            //line2
            cb.ShowTextAligned(3, student.MembershipNumber, 140, 650, 0);
            cb.ShowTextAligned(3, student.ReferenceNumber, 450, 650, 0);
            //line3
            cb.ShowTextAligned(3, student.Surname, 140, 610, 0);
            cb.ShowTextAligned(3, student.Contribution.ToString(), 450, 610, 0);
            //line4
            cb.ShowTextAligned(3, student.FirstNames, 140, 590, 0);
            Gender gender = entity.Genders.Where(p => p.IdGender == student.IdGender).FirstOrDefault();
            cb.ShowTextAligned(3, gender.GenderDescription, 450, 590, 0);
            //line5
            Title title = entity.Titles.Where(p => p.IdTitle == student.IdTitle).FirstOrDefault();
            cb.ShowTextAligned(3, title.TitleAbbreviation, 110, 570, 0);
            MaritalStatuss status = entity.MaritalStatusses.Where(p => p.IdMaritalStatus == student.IdMaritalStatus).FirstOrDefault();
            cb.ShowTextAligned(3, status.Description, 200, 570, 0);
            Country country = entity.Countries.Where(p => p.IdCountry == student.CountryOfIssue).FirstOrDefault();
            cb.ShowTextAligned(3, country.Name, 450, 570, 0);
            //line6
            cb.ShowTextAligned(3, student.DateOfBirth.Value.ToShortDateString(), 140, 550, 0);
            cb.ShowTextAligned(3, student.IDPassport, 450, 550, 0);
            //line7
            StudentAddress postal = entity.StudentAddresses.Where(p => p.IdStudent == student.IdStudent && p.IsPostalAddress.Value).FirstOrDefault();
            string postalAddy = postal != null ? postal.Address1 + ", " + postal.Address2 + ", " + postal.Address3 + ", " + postal.Address4 + ", " + entity.Provinces.Where(p => p.IdProvince == postal.IdProvince).FirstOrDefault().Name + " ," + postal.PostalCode : "Not provided.";
            cb.ShowTextAligned(3, postalAddy, 140, 530, 0);
            //line8
            StudentAddress physical = entity.StudentAddresses.Where(p => p.IdStudent == student.IdStudent && !p.IsPostalAddress.Value).FirstOrDefault();
            string physAddy = physical != null ? physical.Address1 + ", " + physical.Address2 + ", " + physical.Address3 + ", " + physical.Address4 + ", " + entity.Provinces.Where(p => p.IdProvince == physical.IdProvince).FirstOrDefault().Name + " ," + physical.PostalCode : "Not provided.";
            cb.ShowTextAligned(3, physAddy, 140, 500, 0);
            //line9
            cb.ShowTextAligned(3, student.Email, 140, 480, 0);
            //line10
            cb.ShowTextAligned(3, student.BusinessTelephone, 140, 460, 0);
            cb.ShowTextAligned(3, student.HomeTelephone, 450, 460, 0);
            //line11
            cb.ShowTextAligned(3, student.Facsimile, 140, 440, 0);
            cb.ShowTextAligned(3, student.Cellular, 450, 440, 0);
            //line12
            Institution ins = entity.Institutions.Where(p => p.IdInstitution == student.StudyInstitution).FirstOrDefault();
            cb.ShowTextAligned(3, ins.InstitutionName, 140, 420, 0);
            cb.ShowTextAligned(3, student.StudentNumber, 450, 420, 0);
            //line13
            cb.ShowTextAligned(3, student.IncomeAmount != null ? student.IncomeAmount.Value.ToString() : "n/a", 140, 375, 0);
            //group 14
            List<StudentDependant> deps = entity.StudentDependants.Where(p => p.IdStudent == student.IdStudent).ToList();
            if (deps != null)
            {
                int y = 350;

                foreach (var item in deps)
                {
                    cb.ShowTextAligned(3, item.Name, 140, y, 0);
                    cb.ShowTextAligned(3, item.Surname, 200, y, 0);
                    DependantType type = entity.DependantTypes.Where(p => p.IdDependantType == item.IdDependantType).FirstOrDefault();
                    cb.ShowTextAligned(3, type != null ? type.DependantTypeDescription : "n/a", 260, y, 0);
                    Gender gen = entity.Genders.Where(p => p.IdGender == item.IdGender).FirstOrDefault();
                    cb.ShowTextAligned(3, gen != null ? gen.GenderDescription : "n/a", 310, y, 0);
                    cb.ShowTextAligned(3, item.DateOfBirth != null ? item.DateOfBirth.Value.ToShortDateString() : "n/a", 370, y, 0);
                    y = y - 20;
                }
            }
            //group 15
            cb.ShowTextAligned(3, student.MedicalQ1 != null ? "yes" : "no", 450, 205, 0);
            cb.ShowTextAligned(3, student.MedicalQ1 != null ? "yes" : "no", 450, 195, 0);
            cb.ShowTextAligned(3, student.MedicalQ1 != null ? "yes" : "no", 450, 185, 0);
            List<TreatmentDetail> meds = entity.TreatmentDetails.Where(p => p.IdStudent == student.IdStudent).ToList();
            if (meds != null)
            {
                int y = 120;

                foreach (var item in meds)
                {
                    cb.ShowTextAligned(3, item.Name, 80, y, 0);
                    cb.ShowTextAligned(3, item.DetailsOfCondition, 160, y, 0);
                    cb.ShowTextAligned(3, item.TreatmentDate != null ? item.TreatmentDate.Value.ToShortDateString() : "n/a", 300, y, 0);
                    cb.ShowTextAligned(3, item.DegreeOfRecovery, 470, y, 0);
                    y = y - 20;
                }
            }
            //line 16
            Supplier sup = entity.Suppliers.Where(p => p.IdSupplier == student.PreferredSupplier).FirstOrDefault();
            cb.ShowTextAligned(3, sup != null ? sup.SupplierBHFNumber : "Not Selected", 140, 30, 0);
            cb.EndText();
            //add template to content
            PdfImportedPage page = writer.GetImportedPage(reader, 1);
            cb.AddTemplate(page, 0, 0); 
            // close the streams and voilá the file should be changed :) 
            document.Close();
            fs.Close();
            writer.Close();
            reader.Close();
            SendEmail("kamini.nagar@universal.co.za", "StudentPlan Application Form", "See Attached", fileNameNew);
        }

        private void NotifyNetworks(Student student)
        {
            Supplier sup = entity.Suppliers.Where(p => p.IdSupplier == student.PreferredSupplier).FirstOrDefault();
            
            string toAddress2 = @"kantha.naidoo@universal.co.za";
            string title2 = "New Student Registration on StudentPlan Website";
            string mailBody2 = string.Format("Dear Networks team. Please be advised the following student has registered on the StudentPlan website. \r\n  " +
                "Name: {0}, Surname: {1}, Commencement Date: {2}, End Date: {3}, Membership Number: {4}, Reference Number: {5}, and his/her prefered supplier is {6}, BHF Number: {7}", student.FirstNames, student.Surname, student.CommencementDate, student.EndDate, student.MembershipNumber, student.ReferenceNumber, sup != null ? sup.SupplierName : "", sup != null ? sup.SupplierBHFNumber: "");
            SendEmail(toAddress2, title2, mailBody2, null);
        }

        void SendEmail(string toAddress, string title, string mailBody, string filename)
        {
            try
            {
                if (toAddress != null)
                {
                    MailMessage mailMessage = new MailMessage("webmaster@universal.co.za", toAddress, title, mailBody);
                    if (filename != null)
                    {
                        mailMessage.Attachments.Add(new Attachment(filename));
                    }
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SuccessText.Text = @"Your request has been successfully processed.  Your confirmation certificate has been forwarded to your email address on record and the administration department has been notified.&nbsp; Please direct any queries to <a href='mailto:webmaster@universal.co.za'>webmaster@universal.co.za</a>.";
        }

        protected void gvProviders_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnAccept.Enabled = true;
            try
            {
                int id = gvProviders.SelectedValue != null ? int.Parse(gvProviders.SelectedValue.ToString()) : int.Parse(((GridView)sender).SelectedValue.ToString());
                List<Supplier> supplier = entity.Suppliers.Where(i => i.IdSupplier == id).ToList();
                hfSupplierSelected.Value = id.ToString();
                dvSuppliers.DataSource = supplier;
                dvSuppliers.DataBind();
            }
            catch
            {
                //lblError.Text = @"The system encountered an error.  The webmaster has been notified.";
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            SendCertificateAndNotifyABSA();
        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            int idStudent = int.Parse(hfIdStudent.Value);
            Student stud = entity.Students.Where(p => p.IdStudent == idStudent).FirstOrDefault();
            StudentAddress physAddress = entity.StudentAddresses.Where(p => p.IdStudent == stud.IdStudent && !p.IsPostalAddress.Value).FirstOrDefault();
            gvProviders.DataSource = null;
            gvProviders.DataBind();
            gvProviders.DataSource = entity.Suppliers.Where(p => p.IdDiscipline.Value == 10 || p.IdDiscipline.Value == 11 && p.IsNetworkSupplier.Value && p.SupplierPhysicalAddress4.Contains(physAddress.Address4)).ToList();
            gvProviders.PageIndex = e.NewPageIndex;
            gvProviders.DataBind();
        }

        protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dataTable = gvProviders.DataSource as DataTable;

            if (dataTable != null)
            {
                DataView dataView = new DataView(dataTable);
                dataView.Sort = e.SortExpression + " " + ConvertSortDirection(e.SortDirection);

                gvProviders.DataSource = dataView;
                gvProviders.DataBind();
            }
        }

        private string ConvertSortDirection(SortDirection sortDirection)
        {
            string newSortDirection = String.Empty;

            switch (sortDirection)
            {
                case SortDirection.Ascending:
                    newSortDirection = "ASC";
                    break;

                case SortDirection.Descending:
                    newSortDirection = "DESC";
                    break;
            }

            return newSortDirection;
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{

        //}
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            //Student student = entity.Students.Where(p => p.ReferenceNumber == lblReferenceNumber.Text).FirstOrDefault();
            Student student = entity.Students.Where(p => p.ReferenceNumber == tbManualApp.Text).FirstOrDefault();
            SendApplicationForm(student);
            tbManualApp.Text = "";
        }
    }
}