using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace BusBookingProject.Terminal
{
    public partial class Default : System.Web.UI.Page
    {
        static SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string ScanQRCode(string code)
        {
            SqlCommand sqlCmd = new SqlCommand();
            if (connString.State == ConnectionState.Closed)
            {
                connString.Open();
            } else
            {
                connString.Close();
                connString.Open();
            }
            sqlCmd.CommandText = $"UPDATE PNRDetails SET IsUsed='1' WHERE PNRNo = '{code}' AND IsUsed = '0'";
            sqlCmd.Connection = connString;
            int noOfRecords = sqlCmd.ExecuteNonQuery();

            if (noOfRecords >= 1)
            {
                return "QR Code scanned successfully and marked ticket as used.";
            }
            else
            {
                return "Unable to find active ticket with this QR Code.";
            }
        }
    }
}