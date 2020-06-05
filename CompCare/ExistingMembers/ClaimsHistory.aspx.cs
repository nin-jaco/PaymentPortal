using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Universal.Data;
using System.Web.Security;
using System.Data;
using Universal.Common;

namespace CompCare.ExistingMembers
{
    public partial class ClaimsHistory : System.Web.UI.Page
    {
        private DateTime currentMonth = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
        private DateTime lastMonth = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1).AddMonths(-1);
        private DateTime monthBeforeLast = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1).AddMonths(-2);
        private DateTime twoMonthsAgo = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1).AddMonths(-3);
        string retrieveError = @"The system encountered and error retrieving your Claims History.  The <a href='mailto:webmaster@universal.co.za'>Webmaster</a> has been notified.  We will be attending to the problem shortly.";
        UniversalEntities entity = new UniversalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClaimsForMembersAndDependants("All");
            }
        }

        private void GetClaimsForMembersAndDependants(string function)
        {
            try
            {
                if (Session["IdMember"] == null)
                {
                    FormsAuthentication.RedirectToLoginPage();
                }
                else
                {
                    currentView.Value = function;
                    int idMember = int.Parse(Session["IdMember"].ToString());
                    Member member = entity.Members.Where(i => i.IdMember == idMember).SingleOrDefault();
                    List<ClaimWithStatus> allClaims = new List<ClaimWithStatus>();
                    List<Dependant> dependants = entity.Dependants.Where(i => i.IdMember == member.IdMember).ToList();
                    List<Claim> closedClaims = new List<Claim>();
                    List<OpenClaim> openClaims = new List<OpenClaim>();

                    foreach (var item in dependants)
                    {
                        List<Claim> dependantClosedClaims = entity.Claims.Where(i => i.IdDependant == item.IdDependant).ToList();
                        foreach (var p in dependantClosedClaims)
                        {
                            closedClaims.Add(p);
                        }
                        List<OpenClaim> dependantOpenClaims = entity.OpenClaims.Where(i => i.IdDependant == item.IdDependant).ToList();
                        foreach (var q in dependantOpenClaims)
                        {
                            openClaims.Add(q);
                        }
                    }
                    foreach (var item in closedClaims)
                    {
                        allClaims.Add(ClaimWithStatus.GetClosedClaim(item));
                    }
                    foreach (var item in openClaims)
                    {
                        allClaims.Add(ClaimWithStatus.GetOpenClaim(item));
                    }

                    GridView1.PageIndexChanging += new GridViewPageEventHandler(GridView1_PageIndexChanging);
                    switch (function)
                    {
                        case "CustomDates":
                            {
                                DateTime fromDate = DateTime.Parse(tbFromDate.Text);
                                DateTime toDate = DateTime.Parse(tbToDate.Text);
                                GridView1.DataSource = allClaims.Where(p => p.ServiceDate > fromDate && p.DateClaimPaid < toDate).OrderByDescending(p => p.ServiceDate).ToList();
                                break;
                            }
                        case "All":
                            {
                                GridView1.DataSource = allClaims.OrderByDescending(p => p.ServiceDate.Value).ToList();
                                break;
                            }
                        case "CurrentMonth":
                            {
                                GridView1.DataSource = allClaims.Where(p => p.ServiceDate > currentMonth).ToList();
                                break;
                            }
                        case "LastMonth":
                            {
                                GridView1.DataSource = allClaims.Where(p => p.ServiceDate < currentMonth && p.ServiceDate > lastMonth).ToList();
                                break;
                            }
                        case "MonthBeforeLast":
                            {
                                GridView1.DataSource = allClaims.Where(p => p.ServiceDate < lastMonth && p.ServiceDate > monthBeforeLast).ToList();
                                break;
                            }
                        default:
                            {
                                GridView1.DataSource = allClaims.OrderByDescending(p => p.ServiceDate.Value).ToList();
                                break;
                            }
                    }
                    GridView1.DataBind();
                }
            }
            catch
            {
                lblError.Text = retrieveError;
            }
        }

        void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            if (tbFromDate.Text != "" && tbToDate.Text != "")
            {
                GetClaimsForMembersAndDependants("CustomDates");
            }
            else
            {
                lblError.Text = "Please select values for both fields";
            }
        }

        protected void btnCurrentMonth_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            GetClaimsForMembersAndDependants("CurrentMonth");
        }

        protected void btnMonthLast_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            GetClaimsForMembersAndDependants("LastMonth");
        }

        protected void btnMonthBeforeLast_Click(object sender, EventArgs e)
        {
            lblError.Text = "";
            GetClaimsForMembersAndDependants("MonthBeforeLast");
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
            GetClaimsForMembersAndDependants(currentView.Value);
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GridViewRow row = ((GridViewRow)((LinkButton)sender).NamingContainer);
            AjaxControlToolkit.ModalPopupExtender mpe = (AjaxControlToolkit.ModalPopupExtender)row.FindControl("mpe");
            mpe.Show(); 
        }

        
    }
}