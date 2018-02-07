using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactDisplay : System.Web.UI.Page
{
    private CustomerList contacts;

    protected void Page_Load(object sender, EventArgs e)
    {
        contacts = CustomerList.GetCustomers();
        if (!IsPostBack)
            this.DisplayContacts();
    }

    private void DisplayContacts()
    {
        lstContacts.Items.Clear();
        Customer customer;
        for (int i = 0; i < contacts.Count; i++)
        {
            customer = contacts[i];
            lstContacts.Items.Add(customer.ContactDisplay());
        }
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (lstContacts.SelectedIndex > -1 && contacts.Count > 0)
        {
            contacts.RemoveAt(lstContacts.SelectedIndex);
            this.DisplayContacts();
        }
    }

    protected void btnEmpty_Click(object sender, EventArgs e)
    {
        contacts.Clear();
        lstContacts.Items.Clear();
    }
}