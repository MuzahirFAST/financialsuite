using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sample1.DAL;
using System.Data;
using System.Data.SqlClient;

namespace Sample1
{
    public partial class Transaction : System.Web.UI.Page
    {
        myDAL myTransactionObj = new myDAL();


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

       protected virtual void initiateAddTransaction(Object sender, EventArgs e)
        {
            string _uname = Page.User.Identity.Name;
            string _payee = payee.Text;
            string _desc = description.Text;
            string _date = dateTransaction.Value;
            string _cat = catList.SelectedItem.Value;
            string _account = accountTypeList.SelectedItem.Value;
            string _tagListItem = myTagList.SelectedItem.Value;
            //int _tagListItemIndex = myTagList.SelectedIndex;
            string _amount = amount.Text;
            string _customTag = tag.Text;

            myTransactionObj.storeTransactionInDB(_uname, _payee, _desc, _date, _cat, _account, _tagListItem, 
                                                    _amount, _customTag);
            ClearControls(Page);
            string _msg = "Transaction successfully added!";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + _msg + "');", true);


        }

       protected virtual void initAddCustomTag(Object sender, EventArgs e)
       {
           string _tagDesc = tag.Text;

           myTransactionObj.storeCustomTagInDB(myTransactionObj.getUserName(), _tagDesc);
           string _msg = "Tag successfully added!";
           ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + _msg + "');", true);

        }

       public void TagDropDownLoad(object sender, EventArgs e)
       {
          myTransactionObj.fillTagDropDown();
          SqlDataSource1.SelectParameters["Username"].DefaultValue = myTransactionObj.getUserName();        
       }

    }//end partial class Transaction
}