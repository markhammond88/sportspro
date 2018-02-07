<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="CustomerDisplay.aspx.cs" Inherits="CustomerDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <link href="Styles/Main.css" rel="stylesheet" />
    <style type="text/css">
        .style1
        {
            width: 72px;
        }
        .style2
        {
            width: 170px;
        }
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" runat="server">


        <br />


        Select a customer:&nbsp;
        <asp:DropDownList ID="ddlCustomers" runat="server" DataSourceID="SqlDataSource1"
            DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
            SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
        <br />
        <br />
        <table>
            <tr>
                <td class="style1">
                    Address:</td>
                <td class="style2">
                    <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="style1">
                    </td>
                <td class="style2">
                    <asp:Label ID="lblCityStateZip" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="style1">
                    Phone:</td>
                <td class="style2">
                    <asp:Label ID="lblPhone" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="style1">
                    Email:</td>
                <td class="style2">
                    <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add to Contact List" Width="144px" 
            onclick="btnAdd_Click" />&nbsp;
        <asp:Button ID="btnDisplay" runat="server" PostBackUrl="~/ContactDisplay.aspx" Text="Display Contact List"
            Width="144px" /><br />
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>

        <br />

    </asp:Content>
