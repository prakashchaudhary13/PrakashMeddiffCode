using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrakashTest
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("StudentId");
                dt.Columns.Add("StudentName");
                dt.Columns.Add("Age");
                dt.Columns.Add("Gender");
                dt.Rows.Add(1, "Prakash", 25, "Male");
                dt.Rows.Add(2, "XYZ", 30, "Male");
                dt.Rows.Add(3, "ABC", 29, "Female");
                ViewState["dt"] = dt;
                BindGrid();
            }
        }
        protected void BindGrid()
        {
            GridView1.DataSource = ViewState["dt"] as DataTable;
            GridView1.Columns[0].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.Columns[1].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
            GridView1.Columns[2].ItemStyle.HorizontalAlign = HorizontalAlign.Center;

            GridView1.Columns[3].ItemStyle.HorizontalAlign = HorizontalAlign.Center;

            GridView1.DataBind();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void OnUpdate(object sender, EventArgs e)
        {
            GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
            string stuname = ((TextBox)row.Cells[1].Controls[0]).Text;
            int age = Convert.ToInt32(((TextBox)row.Cells[2].Controls[0]).Text);
            string gender = ((TextBox)row.Cells[3].Controls[0]).Text;

            DataTable dt = ViewState["dt"] as DataTable;
            dt.Rows[row.RowIndex]["StudentName"] = stuname;
            dt.Rows[row.RowIndex]["Age"] = age;
            dt.Rows[row.RowIndex]["Gender"] = gender;
            ViewState["dt"] = dt;
            GridView1.EditIndex = -1;
            BindGrid();
        }
        protected void OnCancel(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }
        protected void OnDelete(object sender, EventArgs e)
        {
            GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
            DataTable dt = ViewState["dt"] as DataTable;
            dt.Rows.RemoveAt(row.RowIndex);
            ViewState["dt"] = dt;
            BindGrid();
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            DataTable dt = ViewState["dt"] as DataTable;
            dt.Rows.Add(txtStudentId.Text, txtStudentName.Text, txtAge.Text, txtGender.Text);
            ViewState["dt"] = dt;
            BindGrid();
            txtStudentId.Text = string.Empty;
            txtStudentName.Text = string.Empty;
            txtAge.Text = string.Empty;
            txtGender.Text = string.Empty;
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string searchTerm = txtSearch.Text.ToLower();

                if (1==1)
                {
                   if (ViewState["dt"] == null)
                        return;

                    DataTable dt = ViewState["dt"] as DataTable;

                    DataTable dtNew = dt.Clone();

                   foreach (DataRow row in dt.Rows)
                    {
                        if (row["StudentName"].ToString().ToLower().Contains(searchTerm) || row["StudentId"].ToString().ToLower().Contains(searchTerm))
                        {
                            dtNew.Rows.Add(row.ItemArray);
                        }
                    }

                    GridView1.DataSource = dtNew;
                    GridView1.DataBind();
                }
            
            }
            catch(Exception E)
            {
                Console.WriteLine(E);
            }


        }

    }
}