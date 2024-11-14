using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Reflection.Emit;
using System.Reflection;
using System.Runtime.Remoting.Messaging;

namespace WebApplication1.Admin
{
    public partial class UpdateAdminP : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["ABC"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] == null || Session["UserType"]?.ToString() != "Admin")
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
            }
            if (!IsPostBack) 
            { 
                LoadUserDetails();
            }
       
        }
        void LoadUserDetails()
        {
            SqlConnection con = new SqlConnection(CS);
            string query = "SELECT * FROM Registration WHERE Name=@Name";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", Session["Name"].ToString());
            con.Open();
            SqlDataReader reader1 = cmd.ExecuteReader();
            if (reader1.Read())
            {
                Name.Text = reader1["Name"].ToString();
                TextboxEmail.Text = reader1["Email"].ToString();
                TextboxMobile.Text = reader1["Mobile"].ToString();
                DropDownList1.Text = reader1["Gender"].ToString();
                RadioButtonList1.Text = reader1["UserType"].ToString();
            }
            else
            {
                Response.Write("<script>alert('No user found with the provided Name.')</script>");
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            string query = "update Registration set Email=@Email, Mobile=@Mobile, Gender=@Gender, UserType=@UserType where Name=@Name";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", Name.Text);
            cmd.Parameters.AddWithValue("@Email", TextboxEmail.Text);
            cmd.Parameters.AddWithValue("@Mobile", TextboxMobile.Text);
            cmd.Parameters.AddWithValue("@Gender", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("UserType", RadioButtonList1.Text);
            con.Open();
            int rowsAffected = cmd.ExecuteNonQuery();
            if (rowsAffected > 0)
            {
                Response.Write("<script>alert('Data Updated')</script>");

            }
            else
            {
                Response.Write("<script>alert('Failed to Updated')</script>");
            }
            con.Close();
        }
        protected void BackPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfileAdmin.aspx");
        }
    }
}