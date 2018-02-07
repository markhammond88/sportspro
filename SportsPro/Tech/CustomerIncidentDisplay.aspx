<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerIncidentDisplay.aspx.cs" Inherits="CustomerIncidentDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 620px;
        }
        .auto-style2 {
            width: 620px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <p>
        <br />
        Select a customer:&nbsp;
        <asp:DropDownList ID="ddlCustomers" runat="server" AutoPostBack="True" DataSourceID="SqlCustomers" DataTextField="Name" DataValueField="CustomerID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT [CustomerID], [Name] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlIncidents" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT Products.Name, Technicians.Name AS TechName, Incidents.DateOpened, Incidents.DateClosed, Incidents.Title, Incidents.Description, Incidents.CustomerID FROM Technicians INNER JOIN Incidents ON Technicians.TechID = Incidents.TechID INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode WHERE (Incidents.CustomerID = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCustomers" Name="CustomerID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataSourceID="SqlIncidents" ForeColor="#333333">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                <table class="auto-style1">
                    <tr>
                        <td style="width: 220px; font-size: small; font-weight: bold; vertical-align: top;">Product/<br /> Incident</td>
                        <td style="font-size: small; font-weight: bold; vertical-align: top; width: 180px">Tech name/<br /> Description</td>
                        <td style="font-size: small; font-weight: bold; vertical-align: top; width: 110px">Date opened</td>
                        <td style="font-size: small; font-weight: bold; vertical-align: top; width: 110px">Date closed</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemStyle BackColor="#EFF3FB" />
            <ItemTemplate>
                <table class="auto-style2">
                    <tr>
                        <td style="font-size: small; vertical-align: top; width: 220px">
                            <asp:Label ID="lblProduct" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </td>
                        <td style="font-size: small; vertical-align: top; width: 180px">
                            <asp:Label ID="lblTechnician" runat="server" Text='<%# Eval("TechName") %>'></asp:Label>
                        </td>
                        <td style="font-size: small; vertical-align: top; width: 110px">
                            <asp:Label ID="lblDateOpened" runat="server" Text='<%# Eval("DateOpened", "{0:d}") %>'></asp:Label>
                        </td>
                        <td style="font-size: small; vertical-align: top; width: 110px">
                            <asp:Label ID="lblDateClosed" runat="server" Text='<%# Eval("DateClosed", "{0:d}") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: small; vertical-align: top; width: 220px">
                            <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </td>
                        <td colspan="3" style="font-size: small; vertical-align: top;">
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
    </p>
</asp:Content>

