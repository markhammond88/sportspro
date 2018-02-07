<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Administration.aspx.cs" Inherits="Administration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <p>
    <br />
</p>
<p>
    Welcome to the SportsPro Administration</p>
<p>
    <asp:LoginName ID="LoginName1" runat="server" />
&nbsp;
    <asp:LoginStatus ID="LoginStatus1" runat="server" />
</p>
<p>
</p>
</asp:Content>

