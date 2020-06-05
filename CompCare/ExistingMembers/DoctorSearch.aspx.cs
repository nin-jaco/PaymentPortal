using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Universal.Data;
using System.Data;

namespace CompCare.ExistingMembers
{
    public partial class DoctorSearch : System.Web.UI.Page
    {
        UniversalEntities entity = new UniversalEntities();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string doctorName = Request.QueryString["name"];
            string city = Request.QueryString["city"];
            SearchProvider(doctorName, city);
        }

        private void SearchProvider(string doctorName, string city)
        {
            List<Supplier> doctors = new List<Supplier>();

            if (doctorName != "" && city != "")
            {
                doctors = entity.Suppliers.Where(p => p.SupplierPostalAddress2 == city && p.SupplierName.Contains(doctorName)).ToList();
            }
            else if (doctorName == "")
            {
                doctors = entity.Suppliers.Where(p => p.SupplierPostalAddress3 == city).ToList();
            }
            else if (city == "")
            {
                doctors = entity.Suppliers.Where(p => p.SupplierName.Contains(doctorName)).ToList();
            }

            GridView1.DataSource = doctors;
            GridView1.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SearchProvider(tbDoctorName.Text, tbCity.Text);
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

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dataTable = GridView1.DataSource as DataTable;

            if (dataTable != null)
            {
                DataView dataView = new DataView(dataTable);
                dataView.Sort = e.SortExpression + " " + ConvertSortDirection(e.SortDirection);

                GridView1.DataSource = dataView;
                GridView1.DataBind();
            }
        }

    }
}