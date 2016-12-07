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
    public partial class SetNewBudget : System.Web.UI.Page
    {
        myDAL mySetNewBudgetObj = new myDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
      
        public static void ClearControls(Control Parent)
        {
            if (Parent is TextBox)
            {
                (Parent as TextBox).Text = string.Empty;
            }
            else
            {
                foreach (Control c in Parent.Controls)
                    ClearControls(c);
            }
        }

        protected virtual void addBudgetCustomTag(Object sender, EventArgs e)
        {
            string _tagDesc = tag.Text;
            

            mySetNewBudgetObj.storeCustomTagInDB(mySetNewBudgetObj.getUserName(), _tagDesc);
            string _msg = "Tag successfully added!";  
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + _msg + "');", true);
              
        }

        protected virtual void initNewBudget(Object sender, EventArgs e)
        {             
            string _uname = Page.User.Identity.Name;
            string _recurrence = RadioButtonList1.SelectedItem.Text;
            string _budgetCat = budgetCatList.SelectedItem.Text;
            string _budgetStartDate = dateBudgetStart.Value;
            string _budgetAmount = budgetAmount.Text;
            string _budgetAmountLeft = budgetAmount.Text;
            int _budgetAmountSpent = 0;
            int _budgetTagListIndex = budgetTagList.SelectedIndex;
            string _budgetTagListItemText = null;

            if (_budgetTagListIndex == 0)
            {
                _budgetTagListItemText = "none";
            }
            else
            {
                _budgetTagListItemText = "NONE";
            }

            mySetNewBudgetObj.storeBudgetInDB(mySetNewBudgetObj.getUserName(), _recurrence, _budgetCat, _budgetStartDate, 
                                                _budgetAmount, _budgetAmountLeft, _budgetAmountSpent, _budgetTagListIndex,
                                                _budgetTagListItemText);
            ClearControls(Page);
            string _msg = "New budget successfully assigned!";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + _msg + "');", true);
        }












    }
}