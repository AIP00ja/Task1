using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Collections;
using System.Drawing;
using System.IO;

namespace WebApplication1
{
    public partial class Signup : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["ABC"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            string query2 = "select * from Registration where Name=@Name";
            SqlCommand cmd2 = new SqlCommand(query2, con);
            cmd2.Parameters.AddWithValue("@Name", NameTextBox.Text);
            con.Open();
            SqlDataReader dr = cmd2.ExecuteReader();
            if (dr.HasRows == true)
            {
                Response.Write("<script>alert('Name Already Exists !!')</script>");
                con.Close();
                ClearControls();
            }
            else
            {
                con.Close();
                string query = "insert into Registration (Name, Email, Password, Mobile, Gender, UserType) values (@Name, @Email, @Password, @Mobile, @Gender, @UserType)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
                cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text);
                cmd.Parameters.AddWithValue("@Password", PasswordTextBox.Text);
                cmd.Parameters.AddWithValue("@Mobile", MobileTextBox.Text);
                cmd.Parameters.AddWithValue("@Gender", GenderDropDownList.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@UserType", UserTypeRadioButtonList.Text);
                con.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    Response.Write("<script>alert('Data Saved');window.location='Login1.aspx';</script>");
                   
                    ClearControls();
                }
                else
                {
                    Response.Write("<script>alert('Data Failed')</script>");
                }
                con.Close();
            }
        }
        void ClearControls()
        {
            NameTextBox.Text = EmailTextBox.Text = PasswordTextBox.Text = MobileTextBox.Text = "";
            GenderDropDownList.ClearSelection();
            UserTypeRadioButtonList.ClearSelection();
        }
    }
}