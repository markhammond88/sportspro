using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class CustomerList
{
    private List<Customer> customers;

	public CustomerList()
    { 
        customers = new List<Customer>();
    }

    public int Count
    {
        get
        {
            return customers.Count;
        }
    }

    public Customer this[int index]
    {
        get
        {
            return customers[index];
        }
        set
        {
            customers[index] = value;
        }
    }

    public Customer this[string name]
    {
        get
        {
            foreach (Customer c in customers)
            {
                if (c.Name == name)
                    return c;
            }
            return null;
        }
    }

    public static CustomerList GetCustomers()
    {
        CustomerList customers = (CustomerList) HttpContext.Current.Session["Customers"];
        if (customers == null)
        {
            HttpContext.Current.Session.Add("Customers", new CustomerList());
        }
        return (CustomerList) HttpContext.Current.Session["Customers"];
    }

    public void AddItem(Customer customer)
    {
        customers.Add(customer);
    }

    public void RemoveAt(int index)
    {
        customers.RemoveAt(index);
    }

    public void Clear()
    {
        customers.Clear();
    }
}