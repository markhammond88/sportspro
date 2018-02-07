<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Map.aspx.cs" Inherits="Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <p>
        &nbsp;</p>
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" ImageSet="BulletedList2" ShowExpandCollapse="False">
        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
        <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
        <ParentNodeStyle Font-Bold="False" />
        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
    <p>
        &nbsp;</p>
</asp:Content>

