<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Sample1.Home" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Home" runat="server">


    <form id="form1" runat="server">


    <br />
    <br />
    <h1><asp:LoginName ID="LoginName1" runat="server"
        FormatString="Welcome, {0}"></asp:LoginName></h1>
    <hr />

    <p><i><h4>Here is an overview of your budget spendings</h4></i></p>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" OnLoad="Chart1_Load" Width="722px">
        <Series>
            <asp:Series Name="Amount Spent" ChartType="StackedBar" XValueMember="BudgetCategory" YValueMembers="BudgetAmountSpent" Font="Segoe UI, 9pt, style=Bold" IsValueShownAsLabel="True" LabelForeColor="White" Legend="Legend1" >
                <SmartLabelStyle CalloutLineColor="Transparent" />
            </asp:Series>
            <asp:Series Name="Amount Left" ChartType="StackedBar" XValueMember="BudgetCategory" YValueMembers="BudgetAmountLeft" Font="Segoe UI, 9pt, style=Bold" IsValueShownAsLabel="True" LabelForeColor="White" Legend="Legend1" ></asp:Series>

        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY IntervalType="Number">
                    <MajorGrid Enabled="False" />
                </AxisY>
                <AxisX TitleFont="Segoe UI, 9pt">
                    <MajorGrid Enabled="False" LineDashStyle="DashDotDot" />
                    <MajorTickMark Enabled="False" />
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
        <Legends>
            <asp:Legend Alignment="Center" AutoFitMinFontSize="9" Docking="Bottom" Font="Segoe UI, 9.75pt" IsTextAutoFit="False" LegendStyle="Row" Name="Legend1">
            </asp:Legend>
        </Legends>
        <BorderSkin BackGradientStyle="LeftRight" />
    </asp:Chart>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:sqlCon1 %>" 
            SelectCommand="SELECT BudgetAmountLeft, BudgetAmountSpent, BudgetCategory FROM Budget WHERE (Username = @currentUser)">
            <SelectParameters>
                <asp:Parameter Name="currentUser" type="String" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>










</asp:Content>
