<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.Master" AutoEventWireup="true" CodeBehind="SetNewBudget.aspx.cs" Inherits="Sample1.SetNewBudget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideExpenses" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="SideTransactions" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SideBudget" runat="server">
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
<asp:Content ID="Content6" ContentPlaceHolderID="Home" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="MainTransaction" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="LogUser" runat="server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="SetBudgets" runat="server">

        <br />
    <br />
    <div class="col-sm-10 text-left">
        <h2>Assign New Budget</h2>
        <i><h6>allocate a new budget to a category or tag</h6></i>
        <hr />

        <form id="Form1" class="form-horizontal" role="form" runat="server">
            <div class="form-group">
                <label class="control-label col-sm-2" for="budgetCategory">Category: </label>
                <div class="col-xs-5">
                    <asp:DropDownList ID="budgetCatList" class="form-control" runat="server">
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
            </div>
            <!--BudgetCategory-->

            <div class="form-group">
                <label class="control-label col-sm-2" for="budgetTagList">Tag: </label>
                <div class="col-xs-5">
                    <asp:DropDownList ID="budgetTagList" AppendDataBoundItems="true" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="TagDescription" DataValueField="TagID">
                        <Items>
                            <asp:ListItem Text="Select.." Value="" />
                        </Items>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlCon1 %>" SelectCommand="SELECT * FROM [Tags] WHERE ([Username] = @Username)">
                        <SelectParameters>
                            <asp:Parameter Name="Username" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <!--BUdgetTag-->
            </div>


            <div class="form-group">
                <label class="control-label col-sm-2" for="customTag">Custom Tag: </label>
                <div class="col-xs-4">
                    <asp:TextBox class="form-control" ID="tag" runat="server" Width="150px"></asp:TextBox>
                </div>
                <asp:Button ID="addBudgetTag" class="btn btn-warning" Text="Add tag" OnClick="addBudgetCustomTag" runat="server"></asp:Button>

            </div>
            <!--BudgetCustomTag-->


            <div class="form-group">
                <label class="control-label col-sm-2" for="timePeriod">Recurrence: </label>
                <div class="col-xs-3">
                    <asp:RadioButtonList
                        ID="RadioButtonList1"
                        runat="server"
                        AutoPostBack="false">
                        <asp:ListItem>Weekly</asp:ListItem>
                        <asp:ListItem>Monthly</asp:ListItem>
                        <asp:ListItem>Semi-Anually</asp:ListItem>
                        <asp:ListItem>Yearly</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <!--TimePeriod-->
            <div class="form-group">
                <label class="control-label col-sm-2" for="dateTransaction">Start On:</label>
                <div class="col-xs-5">
                    <input type="date" class="form-control" id="dateBudgetStart" runat="server" />
                </div>
            </div>
            <!--DATE-->
            <div class="form-group">
                <label class="control-label col-sm-2" for="amnt">Amount:</label>
                <div class="col-xs-3">
                    <asp:TextBox class="form-control" ID="budgetAmount" runat="server" TextMode="Number"></asp:TextBox>
                </div>
            </div>
            <!--AMOUNT-->
            <!--<div class="form-group">
                <div class="checkbox col-sm-10">
                    <label>
                        <input type="checkbox" value="">Allot remaining budget to next time period</label>
                </div>
            </div>-->
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="submitBudgetForm" Text="Submit" class="btn btn-success" OnClick="initNewBudget" runat="server"></asp:Button>
                </div>
            </div>
            <!--SUBMIT-->
        </form>
        <hr>
    </div>




</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="SetIncome" runat="server">
</asp:Content>
<asp:Content ID="Content11" ContentPlaceHolderID="Expenses" runat="server">
</asp:Content>
<asp:Content ID="Content12" ContentPlaceHolderID="CategoryExpenses" runat="server">
</asp:Content>
<asp:Content ID="Content13" ContentPlaceHolderID="ManageTransactions" runat="server">
</asp:Content>
