using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentPlan.DataModel;

namespace StudentPlan
{
    public partial class Unsuccessful : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string referenceNumber = Request.QueryString["p2"];
            lblReferenceNumber.Text = referenceNumber;
            lblReason.Text = Request.QueryString["p3"] != null ? Request.QueryString["p3"].Remove(0, 5) : "" ;
            lblAuthorisationNumber.Text = Request.QueryString["p3"] != null ? Request.QueryString["p3"].Remove(6, 10): "";
            lblCardHolderName.Text = Request.QueryString["p5"];
            lblAmount.Text = Request.QueryString["p6"];
            lblCartType.Text = Request.QueryString["p7"];
            lblDescriptionOfGoods.Text = Request.QueryString["p8"];
            lblCardHolderEmail.Text = Request.QueryString["p9"];
            lblMaskedCardNumber.Text = Request.QueryString["MaskedCardNumber"];
            
            using (UniversalEntities entity = new UniversalEntities())
            {
                Student student = entity.Students.Where(p => p.ReferenceNumber == referenceNumber).FirstOrDefault();
                student.TransactionSuccess = false;
                entity.SaveChanges();   
            }
        }
    }
}