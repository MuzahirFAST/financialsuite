using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Sample1.DAL
{
    public class myDAL
    {
        private static readonly string connString =
            System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;

        public string getUserName()
        {
            string uname = null;
            uname = System.Web.HttpContext.Current.User.Identity.Name;

            return uname;
        }

        public Boolean Authentication(string _username, string _password)
        {

            string sqlstring = "SELECT Username, Password FROM [Users] WHERE Username='" + _username + "' AND Password='" + _password + "'";

            if (this.connectToApp(sqlstring)) return true;
            else return false;
        }

        protected Boolean connectToApp(string _query)
       {
            SqlConnection conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(_query,conn);
            SqlDataReader reader;

            conn.Open();
            reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
       }



        public virtual void storeTransactionInDB(string _unameStore, string _payeeStore, string _descStore, string _dateStore, 
                                                string _catStore, string _accountStore, string _tagListItemStore, 
                                                string _amountStore, string _customTagT)
       {
           SqlConnection conn = new SqlConnection(connString);

           try
           {
               conn.Open();
               SqlCommand cmd = new SqlCommand();
               cmd.CommandText = "SELECT * FROM Transactions";
               cmd.Connection = conn;
               SqlDataAdapter da = new SqlDataAdapter();
               da.SelectCommand = cmd;
               DataSet ds = new DataSet();

               da.Fill(ds, "Transactions");
               SqlCommandBuilder cb = new SqlCommandBuilder(da);
               DataRow drow = ds.Tables["Transactions"].NewRow();
               drow["Username"] = _unameStore;
               drow["Payee"] = _payeeStore;
               drow["Description"] = _descStore;
               drow["Date"] = _dateStore;
               drow["CategoryID"] = _catStore;
               drow["AccountID"] = _accountStore;

               if (string.IsNullOrEmpty(_customTagT))
               {
                   
               }
               else
               {
                   drow["TagID"] = _tagListItemStore;
               }
               drow["Amount"] = _amountStore;
               ds.Tables["Transactions"].Rows.Add(drow);
               da.Update(ds, "Transactions");


               updateBudgetRow(_amountStore, _catStore);




           }
           catch (System.Data.SqlClient.SqlException ex)
           {
               string msg = "Some error: ";
               msg += ex.Message;
               throw new Exception(msg);
           }
           finally
           {
               conn.Close();
           }
       }

        public virtual void storeBudgetInDB(string _unameBudgetF, string _recurrenceBudgetF, string _budgetCategoryF,
                                            string _budgetStartDateF, string _budgetAmountF, string _budgetAmountLeftF,
                                            int _budgetAmountSpentF, int _budgetTagListIndexF, string _budgetTagListItemTextF)
        {
               SqlConnection conn = new SqlConnection(connString);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT * FROM Budget";
                cmd.Connection = conn;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();

                da.Fill(ds, "Budget");
                SqlCommandBuilder cb = new SqlCommandBuilder(da);
                DataRow drow = ds.Tables["Budget"].NewRow();

                if (_budgetTagListIndexF == 0)
                {
                    drow["BudgetTag"] = "none";
                }
                else
                {
                    drow["BudgetTag"] = _budgetTagListItemTextF; ;
                }
                drow["Username"] = _unameBudgetF;
                drow["Recurrence"] = _recurrenceBudgetF;
                drow["BudgetCategory"] = _budgetCategoryF;
                drow["BudgetStartDate"] = _budgetStartDateF;
                drow["BudgetAmount"] = _budgetAmountF;
                drow["BudgetAmountLeft"] = _budgetAmountLeftF;
                drow["BudgetAmountSpent"] = _budgetAmountSpentF;

                ds.Tables["Budget"].Rows.Add(drow);
                da.Update(ds, "Budget");

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Some error: ";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                conn.Close();
            }
        }

        public void updateBudgetRow(string _bAmountSpent, string _updtCat)
       {
           using (

           SqlConnection conn = new SqlConnection(connString))
           {
               try
               {
                   DataSet ds = new DataSet();
                   SqlDataAdapter da = new SqlDataAdapter();
                   int _amountSpentFromDB = 0;
                   int _budgetAmountLeftInDB = 0;

                   conn.Open();
                   SqlCommand cmd2 = new SqlCommand();

                   cmd2.CommandText = "SELECT * FROM Budget WHERE Budget.Username='" + System.Web.HttpContext.Current.User.Identity.Name + "' AND Budget.CategoryID = '" + _updtCat + "'";
                   cmd2.Connection = conn;
                   da.SelectCommand = cmd2;
                   da.Fill(ds, "Budget");

                   SqlCommandBuilder cb = new SqlCommandBuilder(da);

                   SqlDataReader rdr = cmd2.ExecuteReader();
              
                   while (rdr.Read())
                   {
                       _amountSpentFromDB = Convert.ToInt32(rdr["BudgetAmountSpent"]);
                       _budgetAmountLeftInDB = Convert.ToInt32(rdr["BudgetAmountLeft"]);
                   }
                   rdr.Close();
                   _amountSpentFromDB = _amountSpentFromDB + Convert.ToInt32(_bAmountSpent);
                   _budgetAmountLeftInDB = _budgetAmountLeftInDB - Convert.ToInt32(_bAmountSpent);
                   ds.Tables["Budget"].Rows[0]["BudgetAmountSpent"] = _amountSpentFromDB;
                   ds.Tables["Budget"].Rows[0]["BudgetAmountLeft"] = _budgetAmountLeftInDB;

                   da.Update(ds, "Budget");

               }
               catch (System.Data.SqlClient.SqlException ex)
               {
                   string msg = "Some error: ";
                   msg += ex.Message;
                   throw new Exception(msg);
               }
               finally
               {
                   conn.Close();
               }
           }
       }

        public DataSet showAllExpenses() 
        {
            DataSet ds = new DataSet(); 
            SqlConnection con = new SqlConnection(connString);

            string uname = null;

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated) 
                        uname = System.Web.HttpContext.Current.User.Identity.Name;           
  
            try
            { 
                SqlCommand cmd;
                cmd = new SqlCommand("SELECT Transactions.Date, Transactions.Payee, Transactions.Description, Transactions.Category, Transactions.Tag, Transactions.Amount FROM Transactions WHERE Transactions.Username= '" + uname + "' ORDER BY Date DESC", con);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds); 
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            if (ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }

        public SqlDataReader showAllBudgets() 
        {

            //DataSet ds = new DataSet(); 
            SqlConnection con = new SqlConnection(connString); 
            con.Open();
            SqlCommand cmd;

            string uname = null;

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
                        uname = System.Web.HttpContext.Current.User.Identity.Name;

            //try
            //{
            cmd = new SqlCommand("SELECT BudgetCategory, BudgetTag, BudgetStartDate, BudgetAmount, BudgetAmountSpent, BudgetAmountLeft, Recurrence FROM View_1 WHERE Username= '" + uname + "' ORDER BY BudgetCategory DESC", con);  
            cmd.CommandType = CommandType.Text; 
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return rdr;
               // using (SqlDataAdapter da = new SqlDataAdapter(cmd))
               // {
               //     da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
               // }
            }
            /*catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }

            if (ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }*/

        public DataSet viewByCategory(string _cat) 
        {
            SqlConnection conn = new SqlConnection(connString);

            DataSet ds = new DataSet(); 
            conn.Open();
            SqlCommand cmd;

            string uname = null;

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                uname = System.Web.HttpContext.Current.User.Identity.Name;
            }

            try
            {
                cmd = new SqlCommand("SELECT Transactions.Date, Transactions.Payee, Transactions.Description, Transactions.Category, Transactions.Tag, Transactions.Amount FROM Transactions WHERE Transactions.Username='" + uname + "' AND Transactions.Category='" + _cat + "' ORDER BY Date DESC", conn);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {

                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                    
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }

            if (ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }

        public DataSet viewByTag(string _tag) 
        {
            SqlConnection conn = new SqlConnection(connString);

            DataSet ds = new DataSet(); 
            conn.Open();
            SqlCommand cmd;

            string uname = null;

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                uname = System.Web.HttpContext.Current.User.Identity.Name;
            }

            try
            {
                cmd = new SqlCommand("SELECT Transactions.Date, Transactions.Payee, Transactions.Description, Transactions.Category, Transactions.Tag, Transactions.Amount FROM Transactions WHERE Transactions.Username='" + uname + "' AND Transactions.Tag='" + _tag + "' ORDER BY Tag", conn);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {

                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds

                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }

            if (ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }

        public DataSet viewByDate(string _startDate, string _endDate) 
        {
            SqlConnection conn = new SqlConnection(connString);
            DataSet ds = new DataSet(); 
            conn.Open();
            SqlCommand cmd;
            string uname = null;

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                uname = System.Web.HttpContext.Current.User.Identity.Name;
            }
            try
            {
                cmd = new SqlCommand("SELECT Transactions.Date, Transactions.Payee, Transactions.Description, Transactions.Category, Transactions.Tag, Transactions.Amount FROM Transactions WHERE Transactions.Username='" + uname + "' AND Transactions.Date BETWEEN '" + _startDate + "' AND '" + _endDate + "' ORDER BY Date DESC", conn);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text; //set type of sqL Command
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                
                    da.Fill(ds); //Add the result  set  returned from SQLCommand to ds
                
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }
            if (ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }

        public DataSet viewByPeriodLastWeek() 
        {
            SqlConnection conn = new SqlConnection(connString);

            DataSet ds = new DataSet(); 
            conn.Open();
            SqlCommand cmd;

            string uname = null;

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                uname = System.Web.HttpContext.Current.User.Identity.Name;
            }

            try
            {
                cmd = new SqlCommand("SELECT Transactions.Date, Transactions.Payee, Transactions.Description, Transactions.Category, Transactions.Tag, Transactions.Amount FROM Transactions WHERE Transactions.Username='" + uname + "' AND DATEDIFF(day,Transactions.Date, GETDATE()) BETWEEN 0 AND 7 ", conn);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                
                    da.Fill(ds);
                
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }

            if (ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }

        public DataSet viewByPeriodTwoWeeks()
        {
            SqlConnection conn = new SqlConnection(connString);

            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd;

            string uname = null;

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                uname = System.Web.HttpContext.Current.User.Identity.Name;
            }

            try
            {
                cmd = new SqlCommand("SELECT Transactions.Date, Transactions.Payee, Transactions.Description, Transactions.Category, Transactions.Tag, Transactions.Amount FROM Transactions WHERE Transactions.Username='" + uname + "' AND DATEDIFF(day,Transactions.Date, GETDATE()) BETWEEN 0 AND 14 ", conn);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(ds);

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }

            if (ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }

        public DataSet viewByPeriodLastMonth()
        {
            SqlConnection conn = new SqlConnection(connString);

            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd;

            string uname = null;

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                uname = System.Web.HttpContext.Current.User.Identity.Name;
            }

            try
            {
                cmd = new SqlCommand("SELECT Transactions.Date, Transactions.Payee, Transactions.Description, Transactions.Category, Transactions.Tag, Transactions.Amount FROM Transactions WHERE Transactions.Username='" + uname + "' AND DATEDIFF(month,Transactions.Date, GETDATE()) BETWEEN 0 AND 1 ", conn);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(ds);

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }

            if (ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }

        public DataSet viewByPeriodSixMonths()
        {
            SqlConnection conn = new SqlConnection(connString);

            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd;

            string uname = null;

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                uname = System.Web.HttpContext.Current.User.Identity.Name;
            }

            try
            {
                cmd = new SqlCommand("SELECT Transactions.Date, Transactions.Payee, Transactions.Description, Transactions.Category, Transactions.Tag, Transactions.Amount FROM Transactions WHERE Transactions.Username='" + uname + "' AND DATEDIFF(month,Transactions.Date, GETDATE()) BETWEEN 0 AND 6 ", conn);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(ds);

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }

            if (ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }

        public DataSet viewByPeriodYear()
        {
            SqlConnection conn = new SqlConnection(connString);

            DataSet ds = new DataSet();
            conn.Open();
            SqlCommand cmd;

            string uname = null;

            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                uname = System.Web.HttpContext.Current.User.Identity.Name;
            }

            try
            {
                cmd = new SqlCommand("SELECT Transactions.Date, Transactions.Payee, Transactions.Description, Transactions.Category, Transactions.Tag, Transactions.Amount FROM Transactions WHERE Transactions.Username='" + uname + "' AND DATEDIFF(month,Transactions.Date, GETDATE()) BETWEEN 0 AND 12 ", conn);  //instantiate SQL command 
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(ds);

            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                conn.Close();
            }

            if (ds.Tables.Count > 0)
            {
                return ds;
            }
            else
            {
                return null;
            }
        }

        public virtual void storeCustomTagInDB(string _uname, string _tagDesc)
        {
            SqlConnection conn = new SqlConnection(connString);

            if (string.IsNullOrEmpty(_tagDesc) == false)
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "SELECT * FROM Tags";
                    cmd.Connection = conn;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();

                    da.Fill(ds, "Tags");
                    SqlCommandBuilder cb = new SqlCommandBuilder(da);
                    DataRow drow = ds.Tables["Tags"].NewRow();
                    drow["Username"] = _uname;
                    drow["TagDescription"] = _tagDesc;

                    ds.Tables["Tags"].Rows.Add(drow);
                    da.Update(ds, "Tags");

                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    string msg = "Some error: ";
                    msg += ex.Message;
                    throw new Exception(msg);
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        public DataSet fillTagDropDown()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string uname = null;
                DataSet ds = new DataSet();

                if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    uname = System.Web.HttpContext.Current.User.Identity.Name;
                }
                using (SqlCommand cmd = new SqlCommand("SELECT TagDescription, TagID FROM Tags WHERE Tags.Username= '" + uname + "'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;
                    conn.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }

                    cmd.ExecuteReader();

                    if (ds.Tables.Count > 0)
                    {
                        return ds;
                    }
                    else
                    {
                        return null;
                    }

                }
            }  //end using 
        }//end filltagDD

        public void GridEditHelper(int _key)
        {
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM Transactions WHERE TransactionID='" + _key +"'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        public void GridUpdtHelper(int _key, string date, string payee, string desc, string cat, string account, string tag, string amount)
        {
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Transactions SET Payee='" + payee + "', Description='" + desc + "', Category='" + cat + "', Account='" + account + "', Tag='" + tag + "', Amount='" + amount + "', WHERE TransactionID='" + _key + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();



        }

    }
}
