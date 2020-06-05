using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentPlan.DataModel;
using System.Data;

namespace StudentPlan
{
    public partial class DependantMedical : System.Web.UI.Page
    {
        static int i;
        static int count;
        internal List<StudentDependant> dependants = new List<StudentDependant>();
        internal List<TreatmentDetail> treatmentDetail = new List<TreatmentDetail>();
        UniversalEntities entity = new UniversalEntities();

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
                    lbDependantTypes.DataSource = entity.DependantTypes.ToList();
                    lbDependantTypes.DataBind();
                    lbDGenders.DataSource = entity.Genders.ToList();
                    lbDGenders.DataBind();
                    hfReference.Value = Request["Reference"].ToString();
                    divAnyMore.Visible = false;
                }
            }
        }

        internal List<StudentDependant> GetExistingData()
        {
            Object objDS = Cache["Dependants"];
            return dependants = objDS != null ? (List<StudentDependant>)objDS : new List<StudentDependant>();
        }

        internal void BindData(List<StudentDependant> dependants)
        {
            gv.DataSource = dependants;
            gv.DataBind();
        }

        internal List<TreatmentDetail> GetExistingMHData()
        {
            Object objDS = Cache["TreatmentDetails"];
            return treatmentDetail = objDS != null ? (List<TreatmentDetail>)objDS : new List<TreatmentDetail>();
        }

        internal void BindMHData(List<TreatmentDetail> treatmentDetail)
        {
            gvMedicalHistory.DataSource = treatmentDetail;
            gvMedicalHistory.DataBind();
        }

        protected void Deletedata(object s, GridViewDeleteEventArgs e)
        {
            dependants = GetExistingData();
            //DataSet ds = gv.DataSource as DataSet;
            //ds.Tables[0].Rows[gv.Rows[e.RowIndex].DataItemIndex].Delete();
            //ds.WriteXml(Server.MapPath("empdata.xml"));
            int id = dependants[e.RowIndex].IdStudentDependant;
            StudentDependant sp = entity.StudentDependants.Where(p => p.IdStudentDependant == id).FirstOrDefault();
            entity.StudentDependants.DeleteObject(sp);
            entity.SaveChanges();
            dependants.RemoveAt(e.RowIndex);
            BindData(dependants);
            Cache["Dependants"] = dependants;
        }

        protected void DeleteMHdata(object s, GridViewDeleteEventArgs e)
        {
            treatmentDetail = GetExistingMHData();
            int id = treatmentDetail[e.RowIndex].IdTreatmentDetail;
            TreatmentDetail detail = entity.TreatmentDetails.Where(p => p.IdTreatmentDetail == id).FirstOrDefault();
            entity.TreatmentDetails.DeleteObject(detail);
            entity.SaveChanges();
            treatmentDetail.RemoveAt(e.RowIndex);
            BindMHData(treatmentDetail);
            Cache["TreatmentDetails"] = treatmentDetail;
        }

        protected void Canceldata(object s, GridViewCancelEditEventArgs e)
        {
            gv.EditIndex = -1;
            BindData(GetExistingData());
        }

        protected void CancelMHdata(object s, GridViewCancelEditEventArgs e)
        {
            gvMedicalHistory.EditIndex = -1;
            BindMHData(GetExistingMHData());
        }

        protected void pageddata(object s, GridViewPageEventArgs e)
        {
            gv.PageIndex = e.NewPageIndex;
            BindData(GetExistingData());
        }

        protected void pagedMHdata(object s, GridViewPageEventArgs e)
        {
            gvMedicalHistory.PageIndex = e.NewPageIndex;
            BindMHData(GetExistingMHData());
        }

        protected void insertinXML(object sender, EventArgs e)
        {
            tbDName.Text = string.Empty;
            tbDSurname.Text = string.Empty;
            tbDDateOfBirth.Text = string.Empty;
            count = 99;
            btninsert.Text = "Add";
            popup.Show();
        }


        protected void Edit(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {

                tbDName.Text = row.Cells[0].Text;
                tbDSurname.Text = row.Cells[1].Text;
                //lbDependantTypes.SelectedValue = row.Cells[2].Text;
                tbDDateOfBirth.Text = row.Cells[4].Text;
                popup.Show();
            }
        }

        protected void Save(object sender, EventArgs e)
        {
            dependants = GetExistingData();
            DateTime dob;
            DateTime.TryParse(tbDDateOfBirth.Text, out dob);
            int idGender = int.Parse(lbDGenders.SelectedValue);
            Gender gender = entity.Genders.Where(p => p.IdGender == idGender).FirstOrDefault();
            int idDependantType = int.Parse(lbDependantTypes.SelectedValue);
            DependantType dType = entity.DependantTypes.Where(p => p.IdDependantType == idDependantType).FirstOrDefault();
            Student student = entity.Students.Where(p => p.ReferenceNumber == hfReference.Value).FirstOrDefault();
            StudentDependant newDep = new StudentDependant
            {
                DateOfBirth = dob,
                IdDependantType = idDependantType,
                Gender = gender,
                Name = tbDName.Text,
                Surname = tbDSurname.Text,
                IdGender = idGender,
                DependantType = dType,
                IdStudent = student.IdStudent
            };
            dependants.Add(newDep);
            entity.AddToStudentDependants(newDep);
            entity.SaveChanges();
            //DataSet ds = gv.DataSource as DataSet;
            //DataRow dr = ds.Tables[0].NewRow();
            //dr[0] = txtempID.Text;
            //dr[1] = txtName.Text;
            //dr[2] = txtCity.Text;
            //dr[3] = txtSalary.Text;
            //ds.Tables[0].Rows.Add(dr);
            //ds.AcceptChanges();
            //ds.WriteXml(Server.MapPath("empdata.xml"));
            Cache["Dependants"] = dependants;
            BindData(dependants);
            tbDName.Text = string.Empty;
            tbDSurname.Text = string.Empty;
            tbDDateOfBirth.Text = string.Empty;
        }

        protected void btnAdd_Clicked(object sender, EventArgs e)
        {
            treatmentDetail = GetExistingMHData();
            DateTime treatDate;
            DateTime.TryParse(tbMHTreatmentDate.Text, out treatDate);
            Student student = entity.Students.Where(p => p.ReferenceNumber == hfReference.Value).FirstOrDefault();
            TreatmentDetail newTreat = new TreatmentDetail
            {
                Name = tbMHName.Text,
                DetailsOfCondition = tbMHDetailsOfCondition.Text,
                TreatmentDate = treatDate,
                DegreeOfRecovery = tbDegreeOfRecovery.Text,
                IdStudent = student.IdStudent
            };
            treatmentDetail.Add(newTreat);
            BindMHData(treatmentDetail);
            Cache["TreatmentDetails"] = treatmentDetail;
            entity.AddToTreatmentDetails(newTreat);
            entity.SaveChanges();
            tbMHName.Text = string.Empty;
            tbMHTreatmentDate.Text = string.Empty;
            tbMHDetailsOfCondition.Text = string.Empty;
            tbDegreeOfRecovery.Text = string.Empty;
            //txtSalary.Text = string.Empty;
        }

        protected void Update(object sender, EventArgs e)
        {
            gv.EditIndex = -1;
            //binddata();

            //DataSet ds = (DataSet)gv.DataSource;
            //int i = Convert.ToInt32(txtempID.Text);
            //ds.Tables[0].Rows[i - 1]["empid"] = txtempID.Text;
            //ds.Tables[0].Rows[i - 1]["empname"] = txtName.Text;
            //ds.Tables[0].Rows[i - 1]["empcity"] = txtCity.Text;
            //ds.Tables[0].Rows[i - 1]["empsalary"] = txtSalary.Text;
            //ds.WriteXml(Server.MapPath("empdata.xml"));
            //binddata();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Student student = entity.Students.Where(p => p.ReferenceNumber == hfReference.Value).FirstOrDefault();
            int numberOfAdultDependants = entity.StudentDependants.Where(p => p.IdStudent == student.IdStudent && p.IdDependantType != 1).ToList().Count();
            int numberOfChildDependants = entity.StudentDependants.Where(p => p.IdStudent == student.IdStudent && p.IdDependantType == 1).ToList().Count();
            student.Contribution = CalculateContribution(numberOfAdultDependants, numberOfChildDependants, 336, 174, student.StudyDuration.Value);
            entity.SaveChanges();  
            Response.Redirect("ConfirmDetails.aspx?Reference=" + hfReference.Value);
        }

        internal double CalculateContribution(int numberOfAdultDependants, int numberOfChildDependants, int adultRate, int childrenRate, double studyDuration)
        {
            double mainMemberContribution = adultRate * studyDuration;
            double adultContribution = adultRate * numberOfAdultDependants * studyDuration;
            double childContribution = childrenRate * numberOfChildDependants * studyDuration;
            return adultContribution + childContribution + mainMemberContribution;
        }

        protected void insertinMHXML(object sender, EventArgs e)
        {
            tbMHName.Text = string.Empty;
            tbMHTreatmentDate.Text = string.Empty;
            tbMHDetailsOfCondition.Text = string.Empty;
            tbDegreeOfRecovery.Text = string.Empty;
            count = 99;
            ModalPopupExtender1.Show();
        }

        protected void rbHasBeforeYes_CheckedChanged(object sender, EventArgs e)
        {
            if (rbHasBeforeYes.Checked)
            {
                tbMHName.Text = string.Empty;
                tbMHTreatmentDate.Text = string.Empty;
                tbMHDetailsOfCondition.Text = string.Empty;
                tbDegreeOfRecovery.Text = string.Empty;
                count = 99;
                ModalPopupExtender1.Show();
                divAnyMore.Visible = true;
            }
        }

        protected void rbLastTwelfeYes_CheckedChanged(object sender, EventArgs e)
        {
            if (rbLastTwelfeYes.Checked)
            {
                tbMHName.Text = string.Empty;
                tbMHTreatmentDate.Text = string.Empty;
                tbMHDetailsOfCondition.Text = string.Empty;
                tbDegreeOfRecovery.Text = string.Empty;
                count = 99;
                ModalPopupExtender1.Show();
                divAnyMore.Visible = true;
            }
        }

        protected void rbNextTwelfeYes_CheckedChanged(object sender, EventArgs e)
        {
            if (rbNextTwelfeYes.Checked)
            {
                tbMHName.Text = string.Empty;
                tbMHTreatmentDate.Text = string.Empty;
                tbMHDetailsOfCondition.Text = string.Empty;
                tbDegreeOfRecovery.Text = string.Empty;
                count = 99;
                ModalPopupExtender1.Show();
                divAnyMore.Visible = true;
            }
        }
    }
}