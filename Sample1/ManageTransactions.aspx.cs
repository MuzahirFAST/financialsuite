using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Sample1.DAL;

namespace Sample1
{
    public partial class ManageTransactions : System.Web.UI.Page
    {
        myDAL mngTransactObj = new myDAL();


        //
        //......................PAGE LOAD------------------------------------
        //
        //
        protected void Page_Load(object sender, EventArgs e)
        {
            /*LoadGrid();
            if (!this.IsPostBack)
            {
                using (SqlConnection conn = new SqlConnection(GetConnectionString()))
                {
                    string uname = null;

                    if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
                    {
                        uname = System.Web.HttpContext.Current.User.Identity.Name;
                    }
                    using (SqlCommand cmd = new SqlCommand("SELECT TagDescription, TagID FROM Tags WHERE Tags.Username= '" + uname + "'"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = conn;
                        conn.Open();
                        budgetTagList2.DataSource = cmd.ExecuteReader();
                        budgetTagList2.DataTextField = "TagDescription";
                        budgetTagList2.DataValueField = "TagID";
                        budgetTagList2.DataBind();
                        conn.Close();
                    }
                }
            }*/
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //Required to verify that the control is rendered properly on page
        }
        public void LoadGrid()
        {
           /* myDAL obj1 = new myDAL();

            ExpensesGrid.Visible = false;

            if (catList.SelectedIndex == 1)
            {
                ExpensesGrid.Visible = true;
                ExpensesGrid.DataSource = obj1.showAllExpenses();
                ExpensesGrid.DataBind();
            }*/
        }

        //
        //......................Button queries--------------------------------
        //
        //
        protected void viewExpensesCategory(Object sender, EventArgs e)
        {
            ExpensesGrid.Visible = false;
            expensesTag.Visible = false;
            expensesDate.Visible = false;
            expensePeriod.Visible = false;
            /*if (catList.SelectedIndex == 0)
            {
                LoadGrid();
            }
            expensesCategory.DataSource = obj1.viewByCategory(catList.SelectedItem.Text);
            expensesCategory.DataBind();*/
            expensesCategory.Visible = true;
        }
        protected void viewExpensesTag(Object sender, EventArgs e)
        {

           // myDAL obj1 = new myDAL();

            
            ExpensesGrid.Visible = false;
            expensesCategory.Visible = false;
            expensesDate.Visible = false;
            expensePeriod.Visible = false;

           /* expensesTag.DataSource = obj1.viewByTag(budgetTagList2.SelectedItem.Text);
            expensesTag.DataBind();*/

            expensesTag.Visible = true;

        }
        protected void viewExpensesDate(Object sender, EventArgs e)
        {

            //Hide other grids
            expensesTag.Visible = false;
            expensesCategory.Visible = false;
            ExpensesGrid.Visible = false;
            expensePeriod.Visible = false;

            /*myDAL obj1 = new myDAL();
            expensesDate.DataSource = obj1.viewByDate(startDate.Value, endDate.Value);
            expensesDate.DataBind();*/

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
                    expensePeriod.DataSource = mngTransactObj.viewByPeriodLastWeek();
                    expensePeriod.DataBind();
                    break;
                case 1:
                    expensePeriod.DataSource = mngTransactObj.viewByPeriodTwoWeeks();
                    expensePeriod.DataBind();
                    expensePeriod.Visible = true;
                    break;
                case 2:
                    expensePeriod.DataSource = mngTransactObj.viewByPeriodLastMonth();
                    expensePeriod.DataBind();
                    expensePeriod.Visible = true;
                    break;
                case 3:
                    expensePeriod.DataSource = mngTransactObj.viewByPeriodSixMonths();
                    expensePeriod.DataBind();
                    expensePeriod.Visible = true;
                    break;
                case 4:
                    expensePeriod.DataSource = mngTransactObj.viewByPeriodYear();
                    expensePeriod.DataBind();
                    expensePeriod.Visible = true;
                    break;
            } 
        }


        //
        //......................Expenses Grid operations----------------------
        //
        //
        protected void ExpensesGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ExpensesGrid_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["Username"].DefaultValue = mngTransactObj.getUserName();
            ExpensesGrid.Visible = true;
        }
        protected void ExpensesGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ExpensesGrid.EditIndex = e.NewEditIndex;
        }
        protected void ExpensesGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)ExpensesGrid.Rows[e.RowIndex];
            int tid = Convert.ToInt32(ExpensesGrid.DataKeys[e.RowIndex].Value.ToString());

            mngTransactObj.GridEditHelper(tid);
        }
        protected void ExpensesGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)ExpensesGrid.Rows[e.RowIndex];
            int tid = Convert.ToInt32(ExpensesGrid.DataKeys[e.RowIndex].Value.ToString());
           /*
            TextBox date = (TextBox)row.Cells[0].Controls[0];
            TextBox payee = (TextBox)row.Cells[1].Controls[0];
            TextBox desc = (TextBox)row.Cells[2].Controls[0];
            TextBox category = (TextBox)row.Cells[3].Controls[0];
            TextBox account = (TextBox)row.Cells[4].Controls[0];
            TextBox tag = (TextBox)row.Cells[5].Controls[0];
            TextBox amount = (TextBox)row.Cells[6].Controls[0];

            mngTransactObj.GridUpdtHelper(tid, date.Text, payee.Text, desc.Text, category.Text, account.Text, tag.Text, amount.Text);


            ExpensesGrid.EditIndex = -1;*/
      
                        
        }

        //
        //......................Category Grid operations----------------------
        //
        //
        protected void expensesCategory_Load(object sender, EventArgs e)
        {
            SqlDataSourceExpensesCategory.SelectParameters["Username"].DefaultValue = mngTransactObj.getUserName();
            expensesCategory.Visible = true;
        }
        protected void expensesCategory_RowEditing(object sender, GridViewEditEventArgs e)
        {
            expensesCategory.EditIndex = e.NewEditIndex;
        }
        protected void expensesCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)expensesCategory.Rows[e.RowIndex];
            int tid = Convert.ToInt32(expensesCategory.DataKeys[e.RowIndex].Value.ToString());

            mngTransactObj.GridEditHelper(tid);
        }
        protected void expensesCategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        //
        //......................Date Between Grid operations----------------------
        //
        //
        protected void expensesDate_Load(object sender, EventArgs e)
        {
            SqlDataSourceExpensesDate.SelectParameters["uname"].DefaultValue = mngTransactObj.getUserName();
            SqlDataSourceExpensesDate.SelectParameters["_startDate"].DefaultValue = startDate.Value;
            SqlDataSourceExpensesDate.SelectParameters["_endDate"].DefaultValue = endDate.Value;
            expensesDate.Visible = false;
        }
        protected void expensesDate_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
        protected void expensesDate_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
        protected void expensesDate_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }


   
    }//class end

}//namespace end
