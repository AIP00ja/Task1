using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Login1 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["ABC"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            string query = ("select Name, UserType from Registration where Name=@Name and Password=@Password");
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
            cmd.Parameters.AddWithValue("@Password", PasswordTextBox.Text);
            con.Open();
            SqlDataReader reader1;
            reader1 = cmd.ExecuteReader();
            if (reader1.Read())
            {
                Session["Name"] = reader1["Name"];
                Session["UserType"] = reader1["UserType"].ToString();
                if (Session["UserType"].ToString() == "Admin")
                {
                    ClearControls();
                    Response.Redirect("Admin/Dashboard1.aspx");
                    Session.RemoveAll();
                }
                else
                {
                    Response.Redirect("User/DashboardUser.aspx");
                }

            }
            else
            {
                Response.Write("<script>alert('No details found')</script>");
            }
            con.Close();
        }
        void ClearControls()
        {
            NameTextBox.Text = "";
        }
    }
}