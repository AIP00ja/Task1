using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Drawing;

namespace WebApplication1.Admin
{
    public partial class Dashboard1 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["ABC"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] == null || Session["UserType"]?.ToString() != "Admin")
            {
                
                Response.Redirect("~/Login1.aspx");
            }
            if (!IsPostBack)
                {
                    this.BindGridView();
                }
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

        }
        private void BindGridView()
        {
            SqlConnection con = new SqlConnection(CS);
            string query = "select * from Registration where UserType !='Admin'";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                SqlConnection con = new SqlConnection(CS);
                string query2 = "select * from Registration where Name=@Name";
                SqlCommand cmd2 = new SqlCommand(query2, con);
                cmd2.Parameters.AddWithValue("@Name", (GridView1.FooterRow.FindControl("NameTextBox") as TextBox).Text.Trim());
                con.Open();
                SqlDataReader dr = cmd2.ExecuteReader();
                if (dr.HasRows == true)
                {
                    Response.Write("<script>alert('Name Already Exists !!')</script>");
                    con.Close();

                }
                else
                {
                    con.Close();
                    string query = "insert into Registration (Name, Email, Password, Mobile, Gender, UserType, ProfileImage) values (@Name, @Email, @Password, @Mobile, @Gender, @UserType, @ProfileImage)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", (GridView1.FooterRow.FindControl("NameTextBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", (GridView1.FooterRow.FindControl("EmailTextBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", (GridView1.FooterRow.FindControl("PasswordTextBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", (GridView1.FooterRow.FindControl("MobileTextBox") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", (GridView1.FooterRow.FindControl("GenderFooter") as DropDownList).SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@UserType", (GridView1.FooterRow.FindControl("FooterRadioButtonList") as RadioButtonList).Text);
                    FileUpload fl1 = (FileUpload)GridView1.FooterRow.FindControl("FileUpload2");
                    if (fl1.HasFile)
                    {
                        
                        string imgPath = "~/Images/" + fl1.FileName;
                        fl1.SaveAs(Server.MapPath(imgPath));
                        cmd.Parameters.AddWithValue("@ProfileImage", imgPath);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@ProfileImage", DBNull.Value); 
                    }
                    con.Open();
                    cmd.ExecuteNonQuery();
                    BindGridView();

                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('New Record Added');", true);
                    lblSuccessMessage.Text = "";
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            con.Open();
            string query = "update Registration set Name=@Name, Email=@Email, Password=@Password, Mobile=@Mobile, Gender=@Gender, UserType=@UserType, ProfileImage=@ProfileImage where Id=@Id ";
            SqlCommand cmd = new SqlCommand(query, con);
            TextBox nameTextBox = (TextBox)GridView1.Rows[e.RowIndex].FindControl("NameTextBox");
            TextBox emailTextBox = (TextBox)GridView1.Rows[e.RowIndex].FindControl("EmailTextBox");
            TextBox passwordTextBox = (TextBox)GridView1.Rows[e.RowIndex].FindControl("PasswordTextBox");
            TextBox mobileTextBox = (TextBox)GridView1.Rows[e.RowIndex].FindControl("MobileTextBox");
            DropDownList genderDropDownList = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("GenderDropDownList1");
            RadioButtonList userTypeRadioButtonList = (RadioButtonList)GridView1.Rows[e.RowIndex].FindControl("UserTypeRadioButtonList");
            cmd.Parameters.AddWithValue("@Name", nameTextBox.Text);
            cmd.Parameters.AddWithValue("@Email", emailTextBox.Text);
            cmd.Parameters.AddWithValue("@Password", passwordTextBox.Text);
            cmd.Parameters.AddWithValue("@Mobile", mobileTextBox.Text);
            cmd.Parameters.AddWithValue("@Gender", genderDropDownList.SelectedValue);
            cmd.Parameters.AddWithValue("@UserType", userTypeRadioButtonList.SelectedValue);
            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));

            FileUpload fl1 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            if (fl1.HasFile)
            {
                string imgPath = "~/Images/" + fl1.FileName;
                fl1.SaveAs(Server.MapPath(imgPath));
                cmd.Parameters.AddWithValue("@ProfileImage", imgPath);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ProfileImage", DBNull.Value);
            }
            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            BindGridView();
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Selected Record Updated');", true);
            lblSuccessMessage.Text = "";
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            string query = "delete from Registration where Id=@Id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
            con.Open();
            cmd.ExecuteNonQuery();
            BindGridView();
            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Selected Record Deleted');", true);
            lblSuccessMessage.Text = "";

        }
        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login1.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProfileAdmin.aspx");

        }

       protected void ExportToExcel(object sender, EventArgs e)
{
    // Disable paging to get all data for export
    GridView1.AllowPaging = false;

    // Rebind the GridView with the current data
    BindGridView();

    // Clear the response
    Response.Clear();
    Response.Buffer = true;
    Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
    Response.Charset = "";
    Response.ContentType = "application/vnd.ms-excel";

    using (StringWriter sw = new StringWriter())
    {
        using (HtmlTextWriter hw = new HtmlTextWriter(sw))
        {
            // Set header styles
            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }

            // Set row styles
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BorderColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            // Render the GridView
            GridView1.RenderControl(hw);
                    string style = @"<style>.textmode{}</style>";
                    Response.Write(style);
                    Response.Output.Write(sw.ToString());
                    Response.Flush();
                    Response.End();
        }
    }
}

public override void VerifyRenderingInServerForm(Control control)
{
    // This is required for exporting to Excel
}
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGridView();
        }

    }
}