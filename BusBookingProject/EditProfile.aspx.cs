using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusBookingProject
{
    public partial class EditProfile : System.Web.UI.Page
    {
        #region Global Variable
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineBusBookingConnectionString"].ToString());
        int userId;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            userId = (int)Session["UserID"];

            if (!IsPostBack) {
                SqlCommand sqlCmd = new SqlCommand();
                if (connString.State == ConnectionState.Closed)
                {
                    connString.Open();
                }
                sqlCmd.CommandText = "SELECT * FROM Registration WHERE regId = @RegId";
                sqlCmd.Parameters.AddWithValue("@RegId", Convert.ToString(userId));
                sqlCmd.Connection = connString;
                
                using (SqlDataReader reader = sqlCmd.ExecuteReader()) {
                    while (reader.Read())
                    {
                        txtFirstName.Text = (string)reader[1];
                        txtLastName.Text = (string)reader[2];
                        txtEmailID.Text = (string)reader[3];
                        txtAddress.Text = (string)reader[4];
                        txtCity.Text = (string)reader[5];
                        txtPincode.Text = (string)reader[6];
                        txtMobileNo.Text = (string)reader[7];
                    }
                }
            }
            
        }

         private int Regitration()
        {
            try
            {
                int ResultCout = 0;
                SqlCommand sqlCmd = new SqlCommand();
                if (connString.State == ConnectionState.Closed)
                {
                    connString.Open();
                }
                // sqlCmd.CommandText = "UPDATE dbo.Registration SET (Fname, Lname, EmailId, Address, Address, City, Picode, Contact) VALUES (@FName, @LName, @EmailId, @Address, @City, @PinCode, @ContactNo) WHERE regId = @RegId";
                sqlCmd.CommandText = $"UPDATE Registration SET Fname = '{txtFirstName.Text}', Lname = '{txtLastName.Text}', EmailId = '{txtEmailID.Text}', Address = '{txtAddress.Text}', City = '{txtCity.Text}', Picode = '{txtPincode.Text}', Contact = '{txtMobileNo.Text}' WHERE regId = {userId}";
                sqlCmd.Connection = connString;
                sqlCmd.ExecuteNonQuery();
                Session["FName"] = txtFirstName.Text;
                return ResultCout;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int RegistrationStatuis = 0;
            RegistrationStatuis = Regitration();
            if(RegistrationStatuis == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Edit user successful')", true); 
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error Occur Please contact your system Administrator')", true); 
            }
        }
    }
}