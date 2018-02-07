<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductMaintenance.aspx.cs" Inherits="ProductMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headPlaceHolder" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 500px;
        }
        .auto-style2 {
            width: 100px;
        }
        .auto-style3 {
            width: 100px;
            height: 18px;
        }
        .auto-style4 {
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="formPlaceHolder" Runat="Server">
    <p>
        <br />
        <asp:SqlDataSource ID="SqlProducts" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @ProductCode" InsertCommand="INSERT INTO [Products] ([ProductCode], [Version], [Name], [ReleaseDate]) VALUES (@ProductCode, @Version, @Name, @ReleaseDate)" SelectCommand="SELECT [ProductCode], [Version], [Name], [ReleaseDate] FROM [Products]" UpdateCommand="UPDATE [Products] SET [Version] = @Version, [Name] = @Name, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @ProductCode">
            <DeleteParameters>
                <asp:Parameter Name="ProductCode" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                <asp:Parameter Name="ProductCode" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblErrorMessage" runat="server" CssClass="validator" EnableViewState="False"></asp:Label>
    </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validator" HeaderText="Please correct the following:" ValidationGroup="edit" />
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProductCode" DataSourceID="SqlProducts" ForeColor="#333333" GridLines="None" OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ProductCode" HeaderText="Product Code" ReadOnly="True" SortExpression="ProductCode" />
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="gridName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="gridName" CssClass="validator" Display="Dynamic" ErrorMessage="Product name is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Version" SortExpression="Version">
                    <EditItemTemplate>
                        <asp:TextBox ID="gridVersion" runat="server" Text='<%# Bind("Version") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="gridVersion" CssClass="validator" Display="Dynamic" ErrorMessage="Version is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="gridVersion" CssClass="validator" Display="Dynamic" ErrorMessage="Version must be numeric" Operator="DataTypeCheck" Type="Double" ValidationGroup="edit">*</asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Version") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Release Date" SortExpression="ReleaseDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="gridReleaseDate" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gridReleaseDate" CssClass="validator" Display="Dynamic" ErrorMessage="Release date is required" ValidationGroup="edit">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="gridReleaseDate" CssClass="validator" Display="Dynamic" ErrorMessage="Release date must be in mm/dd/yyyy format" Operator="DataTypeCheck" Type="Date" ValidationGroup="edit">*</asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" ValidationGroup="edit" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure?');" Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </p>
    <p>
        To add a new product, enter the product information and click Add Product</p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Product code:</td>
            <td>
                <asp:TextBox ID="txtProductCode" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Name:</td>
            <td>
                <asp:TextBox ID="txtProductName" runat="server" Width="219px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Version:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtVersion" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Release date:</td>
            <td>
                <asp:TextBox ID="txtReleaseDate" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <p>
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Product" />
    </p>
</asp:Content>

