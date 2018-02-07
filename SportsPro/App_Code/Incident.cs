using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Incident
/// </summary>
public class Incident
{
	public Incident()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Properties
    public int IncidentID { get; set; }
    public int CustomerID { get; set; }
    public string ProductCode { get; set; }
    public int TechID { get; set; }
    public DateTime DateOpened { get; set; }
    public DateTime DateClosed { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }

    //Methods
    public string CustomerIncidentDisplay()
    {
        return "Incident for product " + ProductCode
            + " closed " + DateClosed.ToShortDateString()
            + " (" + Title + ")";
    }



}