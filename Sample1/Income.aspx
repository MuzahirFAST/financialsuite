<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.Master" AutoEventWireup="true" CodeBehind="Income.aspx.cs" Inherits="Sample1.Income" %>
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

        <br /><br />
    <div class="col-sm-10 text-left">
        <h2>Add New Income</h2>
    <br /><br />
        <form class="form-horizontal" role="form">
            <div class="form-group">
                <label class="control-label col-sm-2" for="cmpnyName">Company:</label>
                <div class="col-xs-6">
                    <input type="text" class="form-control" id="cmpnyName" placeholder="Enter company name"/>
                </div>
            </div> <!--COMPANYNAME -->
            <div class="dropdown">
                <label class="control-label col-sm-2" for="incSource">Source: </label>
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
                    Select Source
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-center" role="menu" aria-labelledby="category">
                    <li><a href="#">Salary</a></li>
                    <li><a href="#">Grants</a></li>
                    <li><a href="#">Loans</a></li>
                </ul>
            </div>
            <!--IncomeSource--> <br />
            <div class="form-group">
                <label class="control-label col-sm-2" for="timePeriodIncome">Recurrence: </label>
                <label class="radio-inline">
                    <input type="radio" name="optradio">Daily</label>
                <label class="radio-inline">
                    <input type="radio" name="optradio">Weekly</label>
                <label class="radio-inline">
                    <input type="radio" name="optradio">Monthly</label>
                   <label class="radio-inline">
                    <input type="radio" name="optradio">Semi-Annual</label>
                <label class="radio-inline">
                    <input type="radio" name="optradio">Annually</label>
            </div>
            <!--IncomeRecurrence-->
            <div class="form-group">
                <label class="control-label col-sm-2" for="dateIncome">Start On:</label>
                <div class="col-xs-5">
                    <input type="date" class="form-control" id="dateIncome"/></div>
            </div>
            <!--DATE-->
            <div class="form-group">
                <label class="control-label col-sm-2" for="amnt">Amount:</label>
                <div class="col-xs-3">
                    <input type="number" class="form-control" id="amnt">
                </div>
            </div>
            <!--AMOUNT-->
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input type="submit" value="Submit" class="btn btn-primary">
                </div>
            </div> <!--SUBMIT-->
        </form> 
        <hr>
    </div>








</asp:Content>
<%--  --%>