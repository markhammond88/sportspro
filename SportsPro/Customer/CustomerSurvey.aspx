<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="CustomerSurvey.aspx.cs" Inherits="CustomerSurvey" %>


<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <link href="Styles/Main.css" rel="stylesheet" />
    <style type="text/css">
        .style1 {
            width: 140px;
            vertical-align: top;
        }

        .style2 {
            width: 470px;
        }

        .style3 {
            width: 16px;
        }

        .style4 {
            width: 100px;
        }

        .auto-style1 {
            width: 130px;
        }
    </style>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" runat="server">
    <br />
    Enter your customer ID:
        <asp:TextBox ID="txtCustomerID" runat="server"></asp:TextBox>
    &nbsp;<asp:Button ID="btnGetIncidents" runat="server" OnClick="btnGetIncidents_Click" Text="Get Incidents" ValidationGroup="incident" />
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerID" CssClass="validator" Display="Dynamic" ErrorMessage="Customer ID is required" ValidationGroup="incident"></asp:RequiredFieldValidator>
    &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtCustomerID" CssClass="validator" Display="Dynamic" ErrorMessage="Customer ID must be numeric" Operator="DataTypeCheck" Type="Integer" ValidationGroup="incident"></asp:CompareValidator>
    &nbsp;&nbsp;
        &nbsp;
        <br />
    <asp:Label ID="lblNoIncidents" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label><br />
    <asp:ListBox ID="lstIncidents" runat="server" Width="450px"></asp:ListBox>
    &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lstIncidents" CssClass="validator" Display="Dynamic" ErrorMessage="An incident must be selected" ValidationGroup="submit"></asp:RequiredFieldValidator>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT [IncidentID], [CustomerID], [ProductCode], [TechID], [DateOpened], [DateClosed], [Title] FROM [Incidents] ORDER BY [DateClosed]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="lblHeading" runat="server" Font-Bold="True" Text="Please rate this incident by the following categories:" Enabled="False"></asp:Label><br />
    <table>
        <tr>
            <td class="style1">
                <asp:Label ID="lblResponseTime" runat="server" Enabled="False" Text="Response time"></asp:Label>
            </td>
            <td class="style2">
                <asp:RadioButtonList ID="rblResponseTime" runat="server" Enabled="False" RepeatDirection="Horizontal" Width="540px">
                    <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                    <asp:ListItem Value="3">Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblEfficiency" runat="server" Enabled="False" Text="Technician efficiency"></asp:Label>
            </td>
            <td class="style2">
                <asp:RadioButtonList ID="rblEfficiency" runat="server" Enabled="False" RepeatDirection="Horizontal" Width="540px">
                    <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                    <asp:ListItem Value="3">Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblResolution" runat="server" Enabled="False" Text="Problem resolution"></asp:Label>
            </td>
            <td class="style2">
                <asp:RadioButtonList ID="rblResolution" runat="server" Enabled="False" RepeatDirection="Horizontal" Width="540px">
                    <asp:ListItem Value="1">Not satisfied</asp:ListItem>
                    <asp:ListItem Value="2">Somewhat satisfied</asp:ListItem>
                    <asp:ListItem Value="3">Satisfied</asp:ListItem>
                    <asp:ListItem Value="4">Completely satisfied</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <br />
    <table>
        <tr>
            <td class="style1">
                <asp:Label ID="lblComments" runat="server" Text="Additional comments:" Width="136px" Enabled="False"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtComments" runat="server" Enabled="False" Rows="4" TextMode="MultiLine" Width="463px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:CheckBox ID="chkContact" runat="server" Enabled="False" Text="Please contact me to discuss this incident" />
    &nbsp;<asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="validator" Display="Dynamic" ErrorMessage="Please select either contact by email or phone" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="submit"></asp:CustomValidator>
    <br />
    <table>
        <tr>
            <td class="style3"></td>
            <td class="auto-style1">
                <asp:RadioButton ID="rdoContactByEmail" runat="server" Enabled="False" GroupName="contact" Text="Contact by Email" Width="150px" />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3">&nbsp;</td>
            <td class="auto-style1">
                <asp:RadioButton ID="rdoContactByPhone" runat="server" Enabled="False" GroupName="contact" Text="Contact by phone" Width="150px" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Enabled="False" Text="Submit" ValidationGroup="submit" />
    <br />


</asp:Content>
