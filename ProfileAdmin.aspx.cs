using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Admin
{
    public partial class ProfileAdmin : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["ABC"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Name"] == null || Session["UserType"]?.ToString() != "Admin")
            {
                
            }
            ShowUserDetails();
        }
        private void ShowUserDetails()
        {
            
            using (SqlConnection con = new SqlConnection(CS))
            {

                string query = "SELECT * FROM Registration where Name=@Name";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", Session["Name"].ToString());
                    con.Open();
                    using (SqlDataReader reader1 = cmd.ExecuteReader())
                    {
                        if (reader1.Read())
                        {
                            
                            Label1.Text = reader1["Name"].ToString();
                            Label2.Text = reader1["Email"].ToString();
                            Label3.Text = reader1["Password"].ToString(); 
                            Label4.Text = reader1["Mobile"].ToString();
                            Label5.Text = reader1["Gender"].ToString();
                            Label6.Text = reader1["UserType"].ToString();
                        }
                        else
                        {
                            Label1.Text = "No user found with the provided Name.";
                        }
                    }
                }
            }
        }

        protected void ProfileUpdate_Click(object sender, EventArgs e)
        {

            Response.Redirect("UpdateAdminP.aspx");
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassA.aspx?name=" + Server.UrlEncode(Session["Name"].ToString()));
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard1.aspx");
        }
    }
}