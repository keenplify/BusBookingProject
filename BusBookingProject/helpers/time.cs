using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusBookingProject.Helpers
{
    public class Time
    {
        public static string NormalizeTo12Hour(string input)
        {
            Debug.WriteLine(input);
            var timeFromInput = DateTime.ParseExact(input, "H:m", null, DateTimeStyles.None);

            string timeIn12HourFormatForDisplay = timeFromInput.ToString(
                "hh:mm tt",
                CultureInfo.InvariantCulture);

            return timeIn12HourFormatForDisplay;
        }
    }
}
