using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject.Admin
{
    public partial class BookingReport : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["AdminUserName"] !=null)
            {
                if (!IsPostBack)
                {
                    bingBookingReport();
                }
            }
            else
            {
                Response.Redirect("/Admin/AdminLogin.aspx");
            }
        }

        private void  bingBookingReport(string keyword = "")
        {
            DataSet dsGetData = new DataSet();
            SqlCommand sqlCmd = new SqlCommand();
            if(connString.State==ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.CommandText = "ispGetBookingReportByAdmin";
            sqlCmd.Parameters.AddWithValue("@Keyword", keyword);
            sqlCmd.Connection = connString;
            SqlDataAdapter sda = new SqlDataAdapter(sqlCmd);
            sda.Fill(dsGetData);
           if(dsGetData.Tables[0].Rows.Count>0)
           {
               gdTicketReport.DataSource = dsGetData.Tables[0];
               gdTicketReport.DataBind();
           }
           else
           {
               gdTicketReport.DataSource =null;
               gdTicketReport.EmptyDataText = "No Records Found";
               gdTicketReport.DataBind();
           }
        
        }

        protected void submitSearchBtn_Click(object sender, EventArgs e)
        {
            bingBookingReport(txtKeyword.Text);
        }

        protected void gdTicketReport_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var gv = sender as GridView;
            var id = gv.Rows[e.RowIndex].Cells[0].Text as string;

            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandText = $"DELETE FROM BookingMaster WHERE BookingId='{id}'";
            sqlCmd.Connection = connString;
            sqlCmd.ExecuteNonQuery();

            bingBookingReport();
        }
    }
}