using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CustomerSurvey : System.Web.UI.Page
{
    private DataView incidentsTable;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtCustomerID.Focus();
            Page.Form.DefaultButton = btnGetIncidents.UniqueID;
        }
    }

    protected void btnGetIncidents_Click(object sender, EventArgs e)
    {
        incidentsTable = (DataView)
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        incidentsTable.RowFilter = "CustomerID = " + txtCustomerID.Text
            + " And DateClosed Is Not Null";
        
        //Clear the listbox
        lstIncidents.Items.Clear();

        if (incidentsTable.Count > 0)
        {
            this.DisplayClosedIncidents();
            this.EnableControls(true);
            lstIncidents.Focus();
            Page.Form.DefaultButton = btnSubmit.UniqueID;
        }
        else
        {
            lblNoIncidents.Text = "There are no incidents for that customer.";
            this.EnableControls(false);
            txtCustomerID.Focus();
            Page.Form.DefaultButton = btnGetIncidents.UniqueID;
        }
    }

    private void DisplayClosedIncidents()
    {
        lstIncidents.Items.Add(new ListItem("--Select an incident--", ""));
        foreach (DataRowView row in incidentsTable)
        {
            Incident incident = new Incident();
            incident.IncidentID = Convert.ToInt32(row["IncidentID"]);
            incident.ProductCode = row["ProductCode"].ToString();
            incident.DateClosed = Convert.ToDateTime(row["DateClosed"]);
            incident.Title = row["Title"].ToString();
            lstIncidents.Items.Add(new ListItem(
                incident.CustomerIncidentDisplay(), incident.IncidentID.ToString()));
        }
        lstIncidents.SelectedIndex = 0;
        lblNoIncidents.Text = "";
    }

    private void EnableControls(bool enable)
    {
        lstIncidents.Enabled = enable;
        lblHeading.Enabled = enable;
        lblResponseTime.Enabled = enable;
        rblResponseTime.Enabled = enable;
        lblEfficiency.Enabled = enable;
        rblEfficiency.Enabled = enable;
        lblResolution.Enabled = enable;
        rblResolution.Enabled = enable;
        lblComments.Enabled = enable;
        txtComments.Enabled = enable;
        chkContact.Enabled = enable;
        rdoContactByEmail.Enabled = enable;
        rdoContactByPhone.Enabled = enable;
        btnSubmit.Enabled = enable;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Survey survey = new Survey();
            survey.CustomerID = Convert.ToInt32(txtCustomerID.Text);
            survey.IncidentID = Convert.ToInt32(lstIncidents.SelectedValue);
            if (rblResponseTime.SelectedIndex != -1)
            {
                survey.ResponseTime = Convert.ToInt32(rblResponseTime.SelectedValue);
            }
            if (rblEfficiency.SelectedIndex != -1)
            {
                survey.TechEfficiency = Convert.ToInt32(rblEfficiency.SelectedValue);
            }
            if (rblResolution.SelectedIndex != -1)
            {
                survey.Resolution = Convert.ToInt32(rblResolution.SelectedValue);
            }
            survey.Comments = txtComments.Text;
            if (chkContact.Checked)
            {
                survey.Contact = true;
                if (rdoContactByEmail.Checked)
                    survey.ContactBy = "Email";
                else
                    survey.ContactBy = "Phone";
                Session.Add("Contact", true);
            }
            else
            {
                survey.Contact = false;
                Session.Add("Contact", false);
            }
            Response.Redirect("SurveyComplete.aspx");
        }
    }

    //Custom validator - Contact by email or phone
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (chkContact.Checked)
        {
            if (!rdoContactByEmail.Checked &&
                !rdoContactByPhone.Checked)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
        else
        {
            rdoContactByEmail.Checked = false;
            rdoContactByPhone.Checked = false;
            args.IsValid = true;
        }



    }

   
}
