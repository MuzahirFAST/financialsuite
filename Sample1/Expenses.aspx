<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.Master" AutoEventWireup="true" CodeBehind="Expenses.aspx.cs" 
    Inherits="Sample1.Expenses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainTransaction" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LogUser" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SetBudgets" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="SetIncome" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="Expenses" runat="server">

    <br />
         <br />

    <h2>Recent Expenses</h2>
    <i><h6>narrow your search by selecting an option below</h6></i>
    <hr />


    <form class="form-inline" role="form" runat="server">
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

            <asp:DropDownList ID="budgetTagList2" AppendDataBoundItems="true" class="form-control" runat="server">
            </asp:DropDownList>

            <div class="form-group">
                <asp:Button ID="viewTagBtn" class="btn btn-primary" Text="Search" OnClick="viewExpensesTag" runat="server"></asp:Button>
            </div>
        </div>


        <hr />


        <div class="form-group">
            <label class="control-label col-sm-3" for="budgetTimePeriod">Time Period: </label>

            <asp:DropDownList ID="timePeriodList" AppendDataBoundItems="true" class="form-control" runat="server">
                
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
        <asp:GridView ID="ExpensesGrid" runat="server" CellPadding="0" CellSpacing="1" HorizontalAlign="Center" 
            OnPageIndexChanging="onPageIndexChanging" Width="798px" EnableSortingAndPagingCallbacks="True" BorderStyle="None" 
            CssClass="table" Font-Names="Segoe UI" GridLines="Horizontal" AllowPaging="False" ShowFooter="True">

            <FooterStyle HorizontalAlign="Center" />
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>

        <asp:GridView ID="expensesCategory" runat="server" AllowSorting="True" CellPadding="0" CellSpacing="1" HorizontalAlign="Center" 
            OnSelectedIndexChanged="ExpensesGrid_SelectedIndexChanged" Width="798px" BorderStyle="None" CssClass="table" 
            Font-Names="Segoe UI" GridLines="Horizontal" AllowPaging="True" ShowFooter="True">
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>

        <asp:GridView ID="expensesTag" runat="server"   AllowSorting="True" CellPadding="0" CellSpacing="1" HorizontalAlign="Center" 
            OnSelectedIndexChanged="ExpensesGrid_SelectedIndexChanged" Width="798px" BorderStyle="None" CssClass="table" 
            Font-Names="Segoe UI" GridLines="Horizontal" AllowPaging="True">
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>

           <asp:GridView ID="expensesDate"   AllowSorting="True" runat="server" CellPadding="0" CellSpacing="1" HorizontalAlign="Center"
                OnSelectedIndexChanged="ExpensesGrid_SelectedIndexChanged" Width="798px" BorderStyle="None" CssClass="table" 
               Font-Names="Segoe UI" GridLines="Horizontal" AllowPaging="True">
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>

          <asp:GridView ID="expensePeriod" AllowPaging="true"  AllowSorting="True" runat="server" CellPadding="0" CellSpacing="1" 
              HorizontalAlign="Center" OnSelectedIndexChanged="ExpensesGrid_SelectedIndexChanged" Width="798px" BorderStyle="None" 
              CssClass="table" Font-Names="Segoe UI" GridLines="Horizontal">
            <HeaderStyle BackColor="#0066FF" Font-Names="Segoe UI" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>
    </form>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="SideExpenses" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <h4>Navigate to..</h4>
    <br />
    <p><a href="Transaction.aspx">Manage Transaction</a></p>
    <p><a href="Budget.aspx">Manage Budgets</a></p>

</asp:Content>


