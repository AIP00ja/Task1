using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["ABC"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            string query = "select * from Registration where Email=@Email";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Email", EmailTextBox);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                string myGUID = Guid.NewGuid().ToString();
                int Id = Convert.ToInt32(dt.Rows[0][0]);
                string query1 = "insert into Registration values() ";
            }


        }
    }
}