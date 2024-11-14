using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace WebApplication1.Admin
{
    public partial class ChangePassA : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["ABC"].ConnectionString;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string name = Request.QueryString["name"];
                Label2.Text = name;
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            string currentPass = CurrentPass.Text;
            string newPass = NewPass.Text;
            string conPass = ConPass.Text;
            string userName = Label2.Text;
            SqlConnection con = new SqlConnection(CS);
            con.Open();
            SqlCommand checkCmd = new SqlCommand("SELECT COUNT(*) FROM Registration WHERE Name=@Name AND Password=@CurrentPass", con);
            checkCmd.Parameters.AddWithValue("@Name",userName);
            checkCmd.Parameters.AddWithValue("@CurrentPass", currentPass);
            int userCount = (int)checkCmd.ExecuteScalar();
            if (userCount == 1)
            {
                if (newPass == conPass)
                {
                    SqlCommand updateCmd = new SqlCommand("UPDATE Registration SET Password=@NewPass WHERE Name=@Name", con);
                    updateCmd.Parameters.AddWithValue("@NewPass", newPass);
                    updateCmd.Parameters.AddWithValue("@Name", userName);
                    updateCmd.ExecuteNonQuery();
                    Label1.Text = "New Password updated!";
                    Label1.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    Label1.Text = "New Password and confirm password should be the same!";
                    Label1.ForeColor = System.Drawing.Color.Red;

                }
            }
            else
            {
                Label1.Text = "Current password is incorrect!";
                Label1.ForeColor = System.Drawing.Color.Red;
            }

        }
        protected void BackToPage_Click1(object sender, EventArgs e)
        {
            Response.Redirect("ProfileAdmin.aspx");
        }
    }
}