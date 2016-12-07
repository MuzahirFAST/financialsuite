using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Sample1.DAL;

namespace Sample1
{
    public partial class Home : System.Web.UI.Page
    {
        myDAL homeObj = new myDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Chart1_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["currentUser"].DefaultValue = homeObj.getUserName();
        }
    }
}

