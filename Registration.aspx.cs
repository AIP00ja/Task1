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
    public partial class Registration : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["ABC"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SaveButton_Click(object sender, EventArgs e)
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
                    Response.Write("<script>alert('Data Saved')</script>");
                    ClearControls();
                }
                else
                {
                    Response.Write("<script>alert('Data Failed')</script>");
                }
                con.Close();
            }
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            string query = "update Registration set Email=@Email, Password=@Password, Mobile=@Mobile, Gender=@Gender, UserType=@UserType where Name=@Name";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
            cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text);
            cmd.Parameters.AddWithValue("@Password", PasswordTextBox.Text);
            cmd.Parameters.AddWithValue("@Mobile", MobileTextBox.Text);
            cmd.Parameters.AddWithValue("@Gender", GenderDropDownList.SelectedItem.Value);
            cmd.Parameters.AddWithValue("UserType", UserTypeRadioButtonList.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data Updated')</script>");
                ClearControls();

            }
            else
            {
                Response.Write("<script>alert('Failed to Updated')</script>");
            }
            con.Close();

        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            string query = "delete from Registration where Name=@Name";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
            con.Open();
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script>alert('Data Delete')</script>");
                ClearControls();
            }
            else
            {
                Response.Write("<script>alert('Data Failed')</script>");
            }
        }
        protected void ReadButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            string query = "select Email, Password, Mobile, Gender, UserType from Registration where Name=@Name";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
            con.Open();
            SqlDataReader reader1;
            reader1 = cmd.ExecuteReader();
            if (reader1.Read())
            {
                EmailTextBox.Text = reader1["Email"].ToString();
                PasswordTextBox.Text = reader1["Password"].ToString();
                MobileTextBox.Text = reader1["Mobile"].ToString();
                GenderDropDownList.SelectedValue = reader1["Gender"].ToString();
                UserTypeRadioButtonList.SelectedValue = reader1["UserType"].ToString();
            }
            else
            {
                Response.Write("<script>alert('No Data Found')</script>");
             
            }
            con.Close();
        }
        void ClearControls()
        {
            NameTextBox.Text = EmailTextBox.Text = PasswordTextBox.Text = MobileTextBox.Text = "";
            GenderDropDownList.ClearSelection();
            UserTypeRadioButtonList.ClearSelection();  
        }
        protected void ResetButton_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        
    }
}