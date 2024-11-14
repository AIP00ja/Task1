using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml.Linq;
using System.Drawing;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    // On first load, clear the password textbox
            //    PasswordTextBox.Text = string.Empty;
            //}
        }

        //protected void ShowPasswordCheckBox_CheckedChanged(object sender, EventArgs e)
        //{
        //    // Check the state of the checkbox and toggle password visibility
        //    if (ShowPasswordCheckBox.Checked)
        //    {
        //        PasswordTextBox.TextMode = TextBoxMode.SingleLine; // Show password
        //    }
        //    else
        //    {
        //        PasswordTextBox.TextMode = TextBoxMode.Password; // Hide password
        //    }

        //    // Reassign the text after changing the mode to retain the value
        //    PasswordTextBox.Text = PasswordTextBox.Text;
        //}
        //protected void ShowPasswordCheckBox_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (ShowPasswordCheckBox.Checked)
        //    {
        //        PasswordTextBox.TextMode = TextBoxMode.SingleLine; // Show password
        //    }
        //    else
        //    {
        //        PasswordTextBox.TextMode = TextBoxMode.Password; // Hide password
        //    }

        //    // Ensure the state of the password textbox updates
        //    PasswordTextBox.Attributes.Remove("value"); // To update the client side
        //}
    }
}
