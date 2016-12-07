<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.Master" AutoEventWireup="true" CodeBehind="Log.aspx.cs" Inherits="Sample1.Log" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #form1
        {
            height: 417px;
        }
        .auto-style1
        {
            width: 650px;
            height: 46px;
        }
        .auto-style2
        {
            height: 46px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LogUser" runat="server">
          

    <br /><br /><br />


				 <form id="form1" runat="server">
            <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" Width="100%" FailureText="Unsuccessful attempt. Please try again." Font-Names="Segoe UI" Font-Size="Medium" PasswordLabelText="Password " RememberMeText="Remember me" TitleText="" UserNameLabelText="User Name " Height="416px">
                <CheckBoxStyle BorderStyle="None" Font-Bold="False" Font-Italic="True" Font-Names="Segoe UI" HorizontalAlign="Center" Wrap="True" />
                <LabelStyle Font-Names="Segoe UI Light" Font-Size="Large" HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                <LayoutTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0" style="height:206px;width:64%;">
                                    <tr>
                                        <td align="left" style="font-family:Segoe UI Light;font-size:Large;" valign="center" class="auto-style1">
                                            
                                            <asp:Label ID="UserNameLabel"  runat="server" AssociatedControlID="UserName" Width="108px">User Name </asp:Label>
                                        </td>
                                        <td class="auto-style2">
                                            <asp:TextBox ID="UserName" runat="server" BorderStyle="Outset" CssClass="form-control" Font-Names="Segoe UI" Font-Size="Large" Height="40px" Width="250px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="font-family:Segoe UI Light;font-size:Large;width:150px;" valign="top">
                                            
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Height="26px" Width="339px">Password </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" BorderStyle="Outset" CssClass="form-control" Font-Names="Segoe UI" Font-Size="Large" Height="40px" TextMode="Password" Width="250px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" BorderStyle="Dotted" CommandName="Login" CssClass="btn-primary" Text="Log In" ValidationGroup="Login1" Height="49px" Width="143px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <LoginButtonStyle BorderStyle="Dotted" CssClass="btn-primary" />
                <TextBoxStyle BorderStyle="Outset" CssClass="form-control" Font-Names="Segoe UI" Font-Size="Large" Width="250px" Height="40px" />
            </asp:Login>
        </form>
       
        
</asp:Content>
