using BusBookingProject.Helpers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject.Admin
{
    public partial class BusScheduleDetails : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["AdminUserName"] !=null)
                {

                }
                else
                {
                    Response.Redirect("/Admin/AdminLogin.aspx");
                }
            }
        }

        private int addBusScheduleData()
        {
            int ResultCout = 0;
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            }
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Date", Date.NormalizeToString(txtDate.Text));
            sqlCmd.Parameters.AddWithValue("@BusID", Convert.ToInt32(Request.QueryString["BusID"]));
            sqlCmd.Parameters.AddWithValue("@Fare", Convert.ToDecimal(txtFare.Text));
            sqlCmd.Parameters.AddWithValue("@EstimatdTime", txtTravelTime.Text);
            sqlCmd.Parameters.AddWithValue("@ArrivalTime", Time.NormalizeTo12Hour(txtArrival.Text));
            sqlCmd.Parameters.AddWithValue("@DepartureTime", Time.NormalizeTo12Hour(txtDeparture.Text));
            sqlCmd.Parameters.AddWithValue("@RouteID", Convert.ToInt32(Request.QueryString["RouteID"]));
            sqlCmd.CommandText = "ispAddBusSchedule";
            sqlCmd.Connection = connString;
            ResultCout = sqlCmd.ExecuteNonQuery(); ;
            return ResultCout;
        }
        protected void btnSaveSchedule_Click(object sender, EventArgs e)
        {
            var regex = new Regex("(0?[0-9]|1[0-9]|2[0-3])hr [0-9]+mins", RegexOptions.IgnoreCase);

            if (!regex.IsMatch(txtTravelTime.Text))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Total Travelling Time')", true);
            }

            int result = addBusScheduleData();
            if (result == -1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Bus Schedule Details has been added successfully')", true);
                txtDeparture.Text = "";
                txtDate.Text = "";
                txtArrival.Text = "";
                txtFare.Text = "";
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error occur please contact your system administrator')", true);
            }
        }
    }
}