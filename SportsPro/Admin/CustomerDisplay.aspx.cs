using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

public partial class CustomerDisplay : System.Web.UI.Page
{
    private Customer selectedCustomer;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlCustomers.DataBind();
        }
        selectedCustomer = this.GetselectedCustomer();
        this.DisplayCustomer();
    }

    private Customer GetselectedCustomer()
    {
        DataView customerTable = (DataView)
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        customerTable.RowFilter = "CustomerID = " + ddlCustomers.SelectedValue;
        DataRowView row = customerTable[0];

        Customer customer = new Customer();
        customer.CustomerID = Convert.ToInt32(row["CustomerID"]);
        customer.Name = row["Name"].ToString();
        customer.Address = row["Address"].ToString();
        customer.City = row["City"].ToString();
        customer.State = row["State"].ToString();
        customer.ZipCode = row["ZipCode"].ToString();
        customer.Phone = row["Phone"].ToString();
        customer.Email = row["Email"].ToString();
        return customer;
    }

    private void DisplayCustomer()
    {
        lblAddress.Text = selectedCustomer.Address;
        lblCityStateZip.Text = selectedCustomer.City + ", "
                             + selectedCustomer.State + " "
                             + selectedCustomer.ZipCode;
        lblPhone.Text = selectedCustomer.Phone;
        lblEmail.Text = selectedCustomer.Email;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        CustomerList contacts = CustomerList.GetCustomers();
        Customer customer = contacts[selectedCustomer.Name];
        if (customer == null)
        {
            contacts.AddItem(selectedCustomer);
            Response.Redirect("ContactDisplay.aspx");
        }
        else
        {
            lblErrorMessage.Text = "This customer is already in the contact list.";
        }
    }
}