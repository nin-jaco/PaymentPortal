using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentPlan.DataModel;
using System.Configuration;
using iTextSharp.text.pdf;
using System.IO;

namespace StudentPlan
{
    public partial class DownloadForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (UniversalEntities entity = new UniversalEntities())
                {
                    lbStudyInstitution.DataSource = entity.Institutions.ToList();
                    lbStudyInstitution.DataBind();
                }
            }
        }

        protected void lbStudyInstitution_SelectedIndexChanged(object sender, EventArgs e)
        {
            int[] absaInstitutions = { 11, 41, 46, 61, 63, 55 };
            int[] estherInstitutions = { 54, 60, 69, 70, 67 };

            if (absaInstitutions.Contains(int.Parse(lbStudyInstitution.SelectedValue)))
            {
                string filename = ConfigurationManager.AppSettings.Get("DownloadPath") + "StudentPlanApplicationFormAbsa.pdf";
                PdfReader reader = new PdfReader(filename);
                var output = new MemoryStream();
                PdfStamper stamper = new PdfStamper(reader, Response.OutputStream);
                stamper.Close();
                reader.Close();
                Response.AddHeader("Content-Disposition", "attachment; filename=StudentPlanApplicationFormAbsa.pdf");
                Response.ContentType = "application/pdf";
                Response.BinaryWrite(output.ToArray());
                Response.End(); 
            }
            else if (estherInstitutions.Contains(int.Parse(lbStudyInstitution.SelectedValue)))
            {
                string filename = ConfigurationManager.AppSettings.Get("DownloadPath") + "StudentPlanApplicationForm.pdf";
                PdfReader reader = new PdfReader(filename);
                var output = new MemoryStream();
                PdfStamper stamper = new PdfStamper(reader, Response.OutputStream);
                stamper.Close();
                reader.Close();
                Response.AddHeader("Content-Disposition", "attachment; filename=StudentPlanApplicationFormEsther.pdf");
                Response.ContentType = "application/pdf";
                Response.BinaryWrite(output.ToArray());
                Response.End();
            }
            else
            {
                string filename = ConfigurationManager.AppSettings.Get("DownloadPath") + "StudentPlanApplicationForm.pdf";
                PdfReader reader = new PdfReader(filename);
                var output = new MemoryStream();
                PdfStamper stamper = new PdfStamper(reader, Response.OutputStream);
                stamper.Close();
                reader.Close();
                Response.AddHeader("Content-Disposition", "attachment; filename=StudentPlanApplicationForm.pdf");
                Response.ContentType = "application/pdf";
                Response.BinaryWrite(output.ToArray());
                Response.End(); 
            }
        }
    }
}