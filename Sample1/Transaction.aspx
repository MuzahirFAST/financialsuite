<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.Master" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="Sample1.Transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainTransaction" runat="server">
    <br />

    <br />
    <div class="col-sm-8 text-left">
        <h2>Transaction details</h2>
        <i>
            <h6>add a new transaction</h6>
        </i>
        <hr />

        <form class="form-horizontal" role="form" runat="server">
            <asp:ScriptManager ID="scriptManager1" runat="server"></asp:ScriptManager>
            <div class="form-group">
                <label class="control-label col-sm-2" for="payee">Payee:</label>
                <div class="col-xs-6">
                    <asp:TextBox class="form-control" ID="payee" runat="server"></asp:TextBox>
                </div>
            </div>
            <!--PAYEE-->

            <div class="form-group">
                <label class="control-label col-sm-2" for="amnt">Amount:</label>
                <div class="col-xs-3">
                    <asp:TextBox class="form-control" ID="amount" runat="server" TextMode="Number"></asp:TextBox>
                </div>
            </div>
            <!--AMOUNT-->

            <div class="form-group">
                <label class="control-label col-sm-2" for="dateTransaction">Date: </label>
                <div class="col-xs-5">
                    <input type="date" class="form-control" id="dateTransaction" runat="server" />

                </div>
            </div>
            <!--DATE-->

            <div class="form-group">
                <label class="control-label col-sm-2" for="acctType">Account: </label>
                <div class="col-xs-5">
                    <asp:DropDownList class="form-control" ID="accountTypeList" runat="server" DataSourceID="SqlDataSourceAccountType" DataTextField="Account" DataValueField="AccountID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceAccountType" runat="server" ConnectionString="<%$ ConnectionStrings:sqlCon1 %>" SelectCommand="SELECT * FROM [Account]"></asp:SqlDataSource>
                </div>
            </div>
            <!--ACCOUNT TYPE-->

            <div class="form-group">
                <label class="control-label col-sm-2" for="cat">Category: </label>
                <div class="col-xs-5">
                    <asp:DropDownList ID="catList" class="form-control" runat="server" DataSourceID="SqlDataSourceCatList" DataTextField="CategoryDescription" DataValueField="CategoryID">
                       </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCatList" runat="server" ConnectionString="<%$ ConnectionStrings:sqlCon1 %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
                </div>

            </div>
            <!--CATEGORY-->


            <div class="form-group">
                <label class="control-label col-sm-2" for="TagList">Tag: </label>
                <div class="col-xs-5">
                    <asp:DropDownList ID="myTagList" AppendDataBoundItems="true" class="form-control" OnLoad="TagDropDownLoad" runat="server" DataTextField="TagDescription" DataValueField="TagID" DataSourceID="SqlDataSource1">
                         <Items>
                            <asp:ListItem Text="Select.." Value="" />
                         </Items>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlCon1 %>" SelectCommand="SELECT [TagDescription],[TagID] FROM [Tags] WHERE ([Username] = @Username)">
                        <SelectParameters>
                            <asp:Parameter Name="Username" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <!--MyCustomTags-->
            </div>


            <div class="form-group">
                <label class="control-label col-sm-2" for="customTag">Custom: </label>
                <div class="col-xs-6">
                    <asp:TextBox class="form-control" ID="tag" runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="addTag" class="btn btn-warning" Text="Add tag" OnClick="initAddCustomTag" runat="server"></asp:Button>
            </div>
            <!--CUSTOM TAG-->




            <div class="form-group">
                <label class="control-label col-sm-2" for="description">Description:</label>
                <div class="col-xs-6">
                    <asp:TextBox class="form-control" mode="multiline" ID="description" runat="server"></asp:TextBox>
                </div>
            </div>
            <!--DESCRIPTION-->

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="submitForm" Text="Submit" class="btn btn-success" OnClick="initiateAddTransaction" runat="server"></asp:Button>
                </div>
            </div>
            <!--SUBMIT-->
        </form>
        <hr>
    </div>
    <script>
        function tagConfirm() {
            if (confirm("Tag added successfully!")) {

            } else {

            }
        }
    </script>
</asp:Content>


<asp:Content ContentID="Content4" ContentPlaceHolderID="SideTransactions" runat="server">


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
    <p><a href="ManageTransactions.aspx">Update</a></p>



</asp:Content>




