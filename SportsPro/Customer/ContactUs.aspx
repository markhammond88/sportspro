<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="Server">
    <style type="text/css">
        .style1 {
            width: 360px;
            padding: 4px;
        }
        .style2 {
            width: 60px;
        }
        .style3 {
            width: 300px;
        }
        .style4 {
            width: 60px;
            vertical-align: top;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" runat="Server">
    <br />
    <h3>How to contact us</h3>
    <p>
        If you ever have any questions or comments about our products,<br />
        please be sure to contact us in whatever way is most convenient for you.
    </p>
    <table class="style1">
        <tr>
            <td class="style4">Phone:</td>
            <td class="style3">1-800-555-0400<br />
                Weekdays, 8 to 5 Pacific Time</td>
        </tr>
        <tr>
            <td class="style2">E-mail:</td>
            <td class="style3"><a href="mailto:sportspro@sportsprosoftware.com">sportspro@sportsprosoftware.com</a> </td>
        </tr>
        <tr>
            <td class="style2">Fax:</td>
            <td class="style3">1-559-555-2732</td>
        </tr>
        <tr>
            <td class="style4">Address:</td>
            <td class="style3">SportsPro Software, Inc.<br />
                1500 N. Main Street<br />
                Fresno, California 93710</td>
        </tr>
    </table>
    <br />

</asp:Content>

