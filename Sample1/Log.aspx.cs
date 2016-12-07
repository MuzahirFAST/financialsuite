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
    public partial class Log : System.Web.UI.Page
    {
        myDAL loginObj = new myDAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["Check"] != null) && (Convert.ToBoolean(Session["Check"]) == true))
            {
                if (User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Transaction.aspx");
                }
            }
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            Boolean blnresult = false;
            string _uname = Login1.UserName;
            string _pass = Login1.Password;

            blnresult = loginObj.Authentication(_uname, _pass);
            if (blnresult == true)
            {
                e.Authenticated = true;
                Session["Check"] = true;
            }
            else
            {
                e.Authenticated = false;
            }
        }

       
    }
}