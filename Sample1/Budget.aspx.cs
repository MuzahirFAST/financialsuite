using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Sample1.DAL;

namespace Sample1
{
    public partial class Budget : System.Web.UI.Page
    {
        myDAL obj1 = new myDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGrid();
        }
        public void LoadGrid()
        {
            

            BudgetsGrid.Visible = true;
           // BudgetsGrid.DataSource = obj1.showAllBudgets();
            //BudgetsGrid.DataBind();
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

        protected void BudgetsGrid_Load(object sender, EventArgs e)
        {
            SqlDataSourceShowAllBudgets.SelectParameters["Username"].DefaultValue = obj1.getUserName();

        }
          
    }
}