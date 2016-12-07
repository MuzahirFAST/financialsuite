<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.Master" AutoEventWireup="true" CodeBehind="Budget.aspx.cs" Inherits="Sample1.Budget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SideBudget" runat="server">

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <h4>Manage Budgets</h4>
    <br />
    <p><a href="SetNewBudget.aspx">New Budget</a></p>
    <p><a href="Budget.aspx">View Budgets</a></p>


</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="SetBudgets" runat="server">

    <br />
    <br />

    <h2><%--Currently assigned budgets</h2>
    <i><h6>--%>you have assigned budgets to the following categories</h6></i>
    <hr />

    <form id="Form1" class="form-inline" role="form" runat="server">

        <asp:GridView ID="BudgetsGrid" OnLoad="BudgetsGrid_Load" runat="server" AutoGenerateColumns="False" CellPadding="0" CellSpacing="1" HorizontalAlign="Center" Width="798px" EnableSortingAndPagingCallbacks="True" BorderStyle="None" CssClass="table" Font-Names="Segoe UI" GridLines="Horizontal" DataSourceID="SqlDataSourceShowAllBudgets" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Starts" HeaderText="Starts" SortExpression="Starts" />
                <asp:BoundField DataField="Amount Assigned" HeaderText="Amount Assigned" SortExpression="Amount Assigned" />
                <asp:BoundField DataField="Amount Spent" HeaderText="Amount Spent" SortExpression="Amount Spent" />
                <asp:BoundField DataField="Amount left" HeaderText="Amount left" SortExpression="Amount left" />
                <asp:BoundField DataField="Recurrence" HeaderText="Recurrence" SortExpression="Recurrence" />
                <asp:BoundField DataField="Tag" HeaderText="Tag" SortExpression="Tag" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            </Columns>
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceShowAllBudgets" runat="server" ConnectionString="<%$ ConnectionStrings:sqlCon1 %>" SelectCommand="SELECT        dbo.Categories.CategoryDescription AS Category, dbo.Budget.BudgetStartDate AS Starts, dbo.Budget.BudgetAmount AS [Amount Assigned], dbo.Budget.BudgetAmountSpent AS [Amount Spent], dbo.Budget.BudgetAmountLeft AS [Amount left], 
                         dbo.Budget.Recurrence,  dbo.Tags.TagDescription AS Tag, 
                         dbo.Budget.Username
FROM            dbo.Budget INNER JOIN
                         dbo.Users ON dbo.Budget.Username = dbo.Users.Username LEFT OUTER JOIN
                         dbo.Categories ON dbo.Budget.CategoryID = dbo.Categories.CategoryID LEFT OUTER JOIN
                         dbo.Tags ON dbo.Budget.TagID = dbo.Tags.TagID
WHERE            dbo.Budget.Username = @Username
">
            <SelectParameters>
                <asp:Parameter Name="Username" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
