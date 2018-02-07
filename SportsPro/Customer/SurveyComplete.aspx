<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="SurveyComplete.aspx.cs" Inherits="SurveyComplete" %>


<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" runat="server">
    <link href="Styles/Main.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" runat="server">

    <br />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Black"></asp:Label><br />
    <br />
    <asp:Button ID="Button1" runat="server" PostBackUrl="~/CustomerSurvey.aspx" Text="Return to Survey" />

</asp:Content>
