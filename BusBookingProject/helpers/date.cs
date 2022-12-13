using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusBookingProject.Helpers
{
    public class Date
    {
        public static string NormalizeToString(DateTime date)
        {
            return date.ToString("dd/MM/yyyy");
        }

        public static string NormalizeToString(string date)
        {
            return NormalizeToString(DateTime.Parse(date));
        }
    }
}
