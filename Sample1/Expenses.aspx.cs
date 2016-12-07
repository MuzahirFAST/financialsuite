using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sample1.DAL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Sample1
{
    public partial class Expenses : System.Web.UI.Page
    {
        myDAL myExpensesObj = new myDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGrid();
            if (!this.IsPostBack)
            {
             
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //Required to verify that the control is rendered properly on page
        }
        protected void ExpensesGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
        protected void onPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ExpensesGrid.PageIndex = e.NewPageIndex;
            ExpensesGrid.DataBind();
        }

        public void LoadGrid()
        {
            ExpensesGrid.Visible = true;
            ExpensesGrid.DataSource = myExpensesObj.showAllExpenses();
            ExpensesGrid.DataBind();
        }

        protected void viewExpensesCategory(Object sender, EventArgs e)
        {
            ExpensesGrid.Visible = false;
            expensesTag.Visible = false;
            expensesDate.Visible = false;
            expensePeriod.Visible = false;

            if (catList.SelectedIndex == 0) LoadGrid();
            expensesCategory.DataSource = myExpensesObj.viewByCategory(catList.SelectedItem.Text);
            expensesCategory.DataBind();

            expensesCategory.Visible = true;
        }

        protected void viewExpensesTag(Object sender, EventArgs e)
        {    
            ExpensesGrid.Visible = false;
            expensesCategory.Visible = false;
            expensesDate.Visible = false;
            expensePeriod.Visible = false;
            
            expensesTag.DataSource = myExpensesObj.viewByTag(budgetTagList2.SelectedItem.Text);
            expensesTag.DataBind();

            expensesTag.Visible = true;
        }

        protected void viewExpensesDate(Object sender, EventArgs e)
        {
            expensesTag.Visible = false;
            expensesCategory.Visible = false;
            ExpensesGrid.Visible = false;
            expensePeriod.Visible = false;

            expensesDate.DataSource = myExpensesObj.viewByDate(startDate.Value, endDate.Value);
            expensesDate.DataBind();

            expensesDate.Visible = true;

        }

        protected void timePeriodBtn(Object sender, EventArgs e)
        {
            expensesTag.Visible = false;
            expensesCategory.Visible = false;
            ExpensesGrid.Visible = false;
            expensesDate.Visible = false;

            int _timePeriodIndex = 0;

            _timePeriodIndex = timePeriodList.SelectedIndex;

            switch (_timePeriodIndex)
            {
                case 0:
                     expensePeriod.Visible = true;
                     expensePeriod.DataSource = myExpensesObj.viewByPeriodLastWeek();
                     expensePeriod.DataBind();
                     break;
                case 1:
                     expensePeriod.DataSource = myExpensesObj.viewByPeriodTwoWeeks();
                     expensePeriod.DataBind();
                     expensePeriod.Visible = true;
                     break;
                case 2:
                     expensePeriod.DataSource = myExpensesObj.viewByPeriodLastMonth();
                     expensePeriod.DataBind();
                     expensePeriod.Visible = true;
                     break;
                case 3:
                     expensePeriod.DataSource = myExpensesObj.viewByPeriodSixMonths();
                     expensePeriod.DataBind();
                     expensePeriod.Visible = true;
                     break;
                case 4:
                     expensePeriod.DataSource = myExpensesObj.viewByPeriodYear();
                     expensePeriod.DataBind();
                     expensePeriod.Visible = true;
                     break;
            }                     
        }
    }//end partial class expenses
}