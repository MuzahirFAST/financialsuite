<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageTransactions.aspx.cs" Inherits="Sample1.ManageTransactions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideExpenses" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="SideTransactions" runat="server">

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <h4>Manage Transactions</h4>
    <br />
    <p><a href="Transaction.aspx">Add</a></p>
    <p><a href="Expenses.aspx">View</a></p>





</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Home" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainTransaction" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="LogUser" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="SetBudgets" runat="server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="SetIncome" runat="server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="Expenses" runat="server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="CategoryExpenses" runat="server">
</asp:Content>



<asp:Content ID="Content12" ContentPlaceHolderID="ManageTransactions" runat="server">

    <br />
    <br />
    <h2>Search for Transaction</h2>
    <h4></h4>
    <br />

    <form id="Form1" class="form-inline" role="form" runat="server">
        <div class="form-group">
            <label class="control-label col-sm-4" for="cat">Category: </label>

            <asp:DropDownList ID="catList" class="form-control" runat="server">
                <asp:ListItem>All</asp:ListItem>
                <asp:ListItem>Misc</asp:ListItem>
                <asp:ListItem>Auto & Transport</asp:ListItem>
                <asp:ListItem>Bills & Utilities</asp:ListItem>
                <asp:ListItem>Education</asp:ListItem>
                <asp:ListItem>Entertainment</asp:ListItem>
                <asp:ListItem>Fees & Charges</asp:ListItem>
                <asp:ListItem>Financial</asp:ListItem>
                <asp:ListItem>Food & Dining</asp:ListItem>
                <asp:ListItem>Gifts & Donations</asp:ListItem>
                <asp:ListItem>Health & Fitness</asp:ListItem>
                <asp:ListItem>Kids</asp:ListItem>
                <asp:ListItem>Personal Care</asp:ListItem>
                <asp:ListItem>Pets</asp:ListItem>
                <asp:ListItem>Shopping</asp:ListItem>
                <asp:ListItem>Taxes</asp:ListItem>
                <asp:ListItem>Travel</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Button ID="viewCatBtn" class="btn btn-primary" Text="Search" OnClick="viewExpensesCategory" runat="server"></asp:Button>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="budgetTagList">Tag: </label>

            <asp:DropDownList ID="expenseTagList" class="form-control" runat="server">
            </asp:DropDownList>

            <div class="form-group">
                <asp:Button ID="viewTagBtn" class="btn btn-primary" Text="Search" OnClick="viewExpensesTag" runat="server"></asp:Button>
            </div>
        </div>

        <hr />

        <div class="form-group">
            <label class="control-label col-sm-3" for="budgetTimePeriod">Time Period: </label>

            <asp:DropDownList ID="timePeriodList" class="form-control" runat="server">
                <asp:ListItem>Last Week</asp:ListItem>
                <asp:ListItem>2 Weeks</asp:ListItem>
                <asp:ListItem>Last Month</asp:ListItem>
                <asp:ListItem>6 Months</asp:ListItem>
                <asp:ListItem>Last Year</asp:ListItem>

            </asp:DropDownList>

            <div class="form-group">
                <asp:Button ID="periodBtn1" class="btn btn-primary" OnClick="timePeriodBtn" Text="Search" runat="server"></asp:Button>
            </div>
        </div>

        <hr />

        <label class="control-label col-sm-2" for="dateTransaction">Start Date: </label>
        <div class="col-xs-3">
            <input type="date" class="form-control" id="startDate" runat="server" />
        </div>

        <label class="control-label col-sm-2" for="dateTransaction">End Date: </label>
        <div class="col-xs-3">
            <input type="date" class="form-control" id="endDate" runat="server" />
        </div>

        <asp:Button ID="dateSearchBtn" class="btn btn-primary" Text="Search" OnClick="viewExpensesDate" runat="server"></asp:Button>

        <hr />

        <asp:GridView ID="ExpensesGrid" runat="server" AllowSorting="True" OnLoad="ExpensesGrid_Load" CellPadding="0" CellSpacing="1" HorizontalAlign="Center" 
            OnSelectedIndexChanged="ExpensesGrid_SelectedIndexChanged" Width="798px" EnableSortingAndPagingCallbacks="True" 
            BorderStyle="None" CssClass="table" Font-Names="Segoe UI" GridLines="Horizontal" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="TransactionID" DataSourceID="SqlDataSource1" 
            OnRowEditing="ExpensesGrid_RowEditing" OnRowDeleting="ExpensesGrid_RowDeleting" OnRowUpdating="ExpensesGrid_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" InsertVisible="False" ReadOnly="True" SortExpression="TransactionID" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Payee" HeaderText="Payee" SortExpression="Payee" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Account" HeaderText="Account" SortExpression="Account" />
                <asp:BoundField DataField="Tag" HeaderText="Tag" SortExpression="Tag" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            </Columns>
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>


        <!--//
        //......................SQL DATA SOURCE 1----------------------
        //
        //-->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:sqlCon1 %>" 
            DeleteCommand="DELETE FROM [Transactions] WHERE [TransactionID] = @original_TransactionID AND [Date] = @original_Date AND (([Payee] = @original_Payee) OR ([Payee] IS NULL AND @original_Payee IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL)) AND (([Account] = @original_Account) OR ([Account] IS NULL AND @original_Account IS NULL)) AND (([Tag] = @original_Tag) OR ([Tag] IS NULL AND @original_Tag IS NULL)) AND [Amount] = @original_Amount" 
            
            InsertCommand="INSERT INTO [Transactions] ([Date], [Payee], [Description], [Category], [Account], [Tag], [Amount]) VALUES (@Date, @Payee, @Description, @Category, @Account, @Tag, @Amount)" 

            OldValuesParameterFormatString="original_{0}" 
            
            SelectCommand="SELECT [TransactionID], [Date], [Payee], [Description], [Category], [Account], [Tag], [Amount] FROM [Transactions] WHERE ([Username] = @Username)" 
            
            UpdateCommand="UPDATE [Transactions] SET [Date] = @Date, [Payee] = @Payee, [Description] = @Description, [Category] = @Category, [Account] = @Account, [Tag] = @Tag, [Amount] = @Amount WHERE [TransactionID] = @original_TransactionID AND [Date] = @original_Date AND (([Payee] = @original_Payee) OR ([Payee] IS NULL AND @original_Payee IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL)) AND (([Account] = @original_Account) OR ([Account] IS NULL AND @original_Account IS NULL)) AND (([Tag] = @original_Tag) OR ([Tag] IS NULL AND @original_Tag IS NULL)) AND [Amount] = @original_Amount">

            <DeleteParameters>
                <asp:Parameter Name="original_TransactionID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_Payee" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Category" Type="String" />
                <asp:Parameter Name="original_Account" Type="String" />
                <asp:Parameter Name="original_Tag" Type="String" />
                <asp:Parameter Name="original_Amount" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Payee" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Account" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="Amount" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="Username" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Payee" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Account" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="original_TransactionID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_Payee" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Category" Type="String" />
                <asp:Parameter Name="original_Account" Type="String" />
                <asp:Parameter Name="original_Tag" Type="String" />
                <asp:Parameter Name="original_Amount" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>



        <asp:GridView ID="expensesCategory" runat="server" OnLoad="expensesCategory_Load" CellPadding="0" CellSpacing="1" HorizontalAlign="Center" OnSelectedIndexChanged="ExpensesGrid_SelectedIndexChanged" 
            Width="798px" BorderStyle="None" CssClass="table" Font-Names="Segoe UI" GridLines="Horizontal" 
            DataSourceID="SqlDataSourceExpensesCategory" AllowPaging="True" AutoGenerateColumns="False" 
            DataKeyNames="TransactionID" OnRowEditing="expensesCategory_RowEditing" OnRowDeleting="expensesCategory_RowDeleting"
            onRowUpdating="expensesCategory_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" InsertVisible="False" ReadOnly="True" SortExpression="TransactionID" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Payee" HeaderText="Payee" SortExpression="Payee" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Account" HeaderText="Account" SortExpression="Account" />
                <asp:BoundField DataField="Tag" HeaderText="Tag" SortExpression="Tag" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            </Columns>
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceExpensesCategory" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:sqlCon1 %>" DeleteCommand="DELETE FROM [Transactions] WHERE [TransactionID] = @original_TransactionID AND [Date] = @original_Date AND (([Payee] = @original_Payee) OR ([Payee] IS NULL AND @original_Payee IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL)) AND (([Account] = @original_Account) OR ([Account] IS NULL AND @original_Account IS NULL)) AND (([Tag] = @original_Tag) OR ([Tag] IS NULL AND @original_Tag IS NULL)) AND [Amount] = @original_Amount" InsertCommand="INSERT INTO [Transactions] ([Date], [Payee], [Description], [Category], [Account], [Tag], [Amount]) VALUES (@Date, @Payee, @Description, @Category, @Account, @Tag, @Amount)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [TransactionID], [Date], [Payee], [Description], [Category], [Account], [Tag], [Amount] FROM [Transactions] WHERE (([Category] = @Category) AND ([Username] = @Username))" UpdateCommand="UPDATE [Transactions] SET [Date] = @Date, [Payee] = @Payee, [Description] = @Description, [Category] = @Category, [Account] = @Account, [Tag] = @Tag, [Amount] = @Amount WHERE [TransactionID] = @original_TransactionID AND [Date] = @original_Date AND (([Payee] = @original_Payee) OR ([Payee] IS NULL AND @original_Payee IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL)) AND (([Account] = @original_Account) OR ([Account] IS NULL AND @original_Account IS NULL)) AND (([Tag] = @original_Tag) OR ([Tag] IS NULL AND @original_Tag IS NULL)) AND [Amount] = @original_Amount">
            <DeleteParameters>
                <asp:Parameter Name="original_TransactionID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_Payee" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Category" Type="String" />
                <asp:Parameter Name="original_Account" Type="String" />
                <asp:Parameter Name="original_Tag" Type="String" />
                <asp:Parameter Name="original_Amount" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Payee" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Account" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="Amount" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="catList" Name="Category" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Payee" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Account" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="original_TransactionID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_Payee" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Category" Type="String" />
                <asp:Parameter Name="original_Account" Type="String" />
                <asp:Parameter Name="original_Tag" Type="String" />
                <asp:Parameter Name="original_Amount" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="expensesTag" runat="server" CellPadding="0" CellSpacing="1" HorizontalAlign="Center" OnSelectedIndexChanged="ExpensesGrid_SelectedIndexChanged" Width="798px" BorderStyle="None" CssClass="table" Font-Names="Segoe UI" GridLines="Horizontal" DataSourceID="SqlDataSourceExpensesTag" AutoGenerateColumns="False" DataKeyNames="TransactionID" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" InsertVisible="False" ReadOnly="True" SortExpression="TransactionID" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Payee" HeaderText="Payee" SortExpression="Payee" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Account" HeaderText="Account" SortExpression="Account" />
                <asp:BoundField DataField="Tag" HeaderText="Tag" SortExpression="Tag" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            </Columns>
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceExpensesTag" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:sqlCon1 %>" DeleteCommand="DELETE FROM [Transactions] WHERE [TransactionID] = @original_TransactionID AND [Date] = @original_Date AND (([Payee] = @original_Payee) OR ([Payee] IS NULL AND @original_Payee IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL)) AND (([Account] = @original_Account) OR ([Account] IS NULL AND @original_Account IS NULL)) AND (([Tag] = @original_Tag) OR ([Tag] IS NULL AND @original_Tag IS NULL)) AND [Amount] = @original_Amount" InsertCommand="INSERT INTO [Transactions] ([Date], [Payee], [Description], [Category], [Account], [Tag], [Amount]) VALUES (@Date, @Payee, @Description, @Category, @Account, @Tag, @Amount)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [TransactionID], [Date], [Payee], [Description], [Category], [Account], [Tag], [Amount] FROM [Transactions] WHERE (([Tag] = @Tag) AND ([Username] = @Username))" UpdateCommand="UPDATE [Transactions] SET [Date] = @Date, [Payee] = @Payee, [Description] = @Description, [Category] = @Category, [Account] = @Account, [Tag] = @Tag, [Amount] = @Amount WHERE [TransactionID] = @original_TransactionID AND [Date] = @original_Date AND (([Payee] = @original_Payee) OR ([Payee] IS NULL AND @original_Payee IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL)) AND (([Account] = @original_Account) OR ([Account] IS NULL AND @original_Account IS NULL)) AND (([Tag] = @original_Tag) OR ([Tag] IS NULL AND @original_Tag IS NULL)) AND [Amount] = @original_Amount">
            <DeleteParameters>
                <asp:Parameter Name="original_TransactionID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_Payee" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Category" Type="String" />
                <asp:Parameter Name="original_Account" Type="String" />
                <asp:Parameter Name="original_Tag" Type="String" />
                <asp:Parameter Name="original_Amount" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Payee" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Account" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="Amount" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="expenseTagList" Name="Tag" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="Username" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Payee" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="Account" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="original_TransactionID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="original_Date" />
                <asp:Parameter Name="original_Payee" Type="String" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_Category" Type="String" />
                <asp:Parameter Name="original_Account" Type="String" />
                <asp:Parameter Name="original_Tag" Type="String" />
                <asp:Parameter Name="original_Amount" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="expensesDate" runat="server" OnLoad="expensesDate_Load" CellPadding="0" CellSpacing="1" 
            HorizontalAlign="Center" OnSelectedIndexChanged="ExpensesGrid_SelectedIndexChanged" Width="798px" 
            BorderStyle="None" CssClass="table" Font-Names="Segoe UI" GridLines="Horizontal" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourceExpensesDate" OnRowEditing="expensesDate_RowEditing" OnRowDeleting="expensesDate_RowDeleting"
            onRowUpdating="expensesDate_RowUpdating" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Payee" HeaderText="Payee" SortExpression="Payee" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Tag" HeaderText="Tag" SortExpression="Tag" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            </Columns>
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceExpensesDate" runat="server" ConnectionString="<%$ ConnectionStrings:sqlCon1 %>" DeleteCommand="DELETE FROM [Transactions] 
WHERE [TransactionID] = @original_TransactionID AND [Date] = @original_Date AND (([Payee] = @original_Payee) OR ([Payee] IS NULL AND @original_Payee IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL)) AND (([Account] = @original_Account) OR ([Account] IS NULL AND @original_Account IS NULL)) AND (([Tag] = @original_Tag) OR ([Tag] IS NULL AND @original_Tag IS NULL)) AND [Amount] = @original_Amount" InsertCommand="INSERT INTO [Transactions] ([Date], [Payee], [Description], [Category], [Account], [Tag], [Amount]) 
VALUES (@Date, @Payee, @Description, @Category, @Account, @Tag, @Amount)" SelectCommand="SELECT Transactions.Date, Transactions.Payee, Transactions.Description, Transactions.Category, Transactions.Tag, Transactions.Amount 
FROM Transactions 
WHERE Transactions.Username= @uname  AND Transactions.Date BETWEEN @_startDate AND @_endDate 
ORDER BY Date DESC" UpdateCommand="UPDATE [Transactions] 
SET [Date] = @Date, [Payee] = @Payee, [Description] = @Description, [Category] = @Category, [Account] = @Account, [Tag] = @Tag, [Amount] = @Amount WHERE [TransactionID] = @original_TransactionID AND [Date] = @original_Date AND (([Payee] = @original_Payee) OR ([Payee] IS NULL AND @original_Payee IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([Category] = @original_Category) OR ([Category] IS NULL AND @original_Category IS NULL)) AND (([Account] = @original_Account) OR ([Account] IS NULL AND @original_Account IS NULL)) AND (([Tag] = @original_Tag) OR ([Tag] IS NULL AND @original_Tag IS NULL)) AND [Amount] = @original_Amount
">
            <DeleteParameters>
                <asp:Parameter Name="original_TransactionID" />
                <asp:Parameter Name="original_Date" />
                <asp:Parameter Name="original_Payee" />
                <asp:Parameter Name="original_Description" />
                <asp:Parameter Name="original_Category" />
                <asp:Parameter Name="original_Account" />
                <asp:Parameter Name="original_Tag" />
                <asp:Parameter Name="original_Amount" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Date" />
                <asp:Parameter Name="Payee" />
                <asp:Parameter Name="Description" />
                <asp:Parameter Name="Category" />
                <asp:Parameter Name="Account" />
                <asp:Parameter Name="Tag" />
                <asp:Parameter Name="Amount" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="uname" />
                <asp:FormParameter FormField="_startDate" Name="_startDate" />
                <asp:FormParameter FormField="_endDate" Name="_endDate" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Date" />
                <asp:Parameter Name="Payee" />
                <asp:Parameter Name="Description" />
                <asp:Parameter Name="Category" />
                <asp:Parameter Name="Account" />
                <asp:Parameter Name="Tag" />
                <asp:Parameter Name="Amount" />
                <asp:Parameter Name="original_TransactionID" />
                <asp:Parameter Name="original_Date" />
                <asp:Parameter Name="original_Payee" />
                <asp:Parameter Name="original_Description" />
                <asp:Parameter Name="original_Category" />
                <asp:Parameter Name="original_Account" />
                <asp:Parameter Name="original_Tag" />
                <asp:Parameter Name="original_Amount" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="expensePeriod" AllowSorting="True" runat="server" CellPadding="0" CellSpacing="1" HorizontalAlign="Center" OnSelectedIndexChanged="ExpensesGrid_SelectedIndexChanged" Width="798px" BorderStyle="None" CssClass="table" Font-Names="Segoe UI" GridLines="Horizontal" DataSourceID="SqlDataSourceExpensesPeriod">
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>


        <asp:SqlDataSource ID="SqlDataSourceExpensesPeriod" runat="server"></asp:SqlDataSource>


    </form>






</asp:Content>
