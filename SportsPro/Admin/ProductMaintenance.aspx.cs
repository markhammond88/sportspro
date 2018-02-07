using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductMaintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Capture database errors on the RowUpdated event
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "An error occurred. " +
                e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblErrorMessage.Text = "No rows were updated.  " +
                "Please try again or contact your Database Administrator.";
        }
    }

    //Capture database errors on the RowDeleted event
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblErrorMessage.Text = "An error occurred.  " +
                e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblErrorMessage.Text = "No rows were deleted.  " +
                "Please try again or contact your Database Administrator.";
        }
    }

    //Add a Product to the Database
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //Set the Insert Parameters (DefaultValue)
        SqlProducts.InsertParameters["ProductCode"].DefaultValue =
            txtProductCode.Text;
        SqlProducts.InsertParameters["Name"].DefaultValue =
            txtProductName.Text;
        SqlProducts.InsertParameters["Version"].DefaultValue =
            txtVersion.Text;
        SqlProducts.InsertParameters["ReleaseDate"].DefaultValue =
            txtReleaseDate.Text;

        //Insert the row into the database table
        try
        {
            SqlProducts.Insert();
            txtProductCode.Text = "";
            txtProductName.Text = "";
            txtVersion.Text = "";
            txtReleaseDate.Text = "";
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = "An exception occurred. " +
                ex.Message;
        }

    }
}