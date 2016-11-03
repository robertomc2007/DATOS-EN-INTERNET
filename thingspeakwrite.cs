using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;

namespace THINGSPEAK_WRITE
{
    class thingspeakwrite
    {
        static void Main(string[] args)
        {
            try
            {
                //Channel 177724
                const string WRITEKEY = "XXXXXXXXXXXXXXXX"; //reemplazar

                string strUpdateBase = "http://api.thingspeak.com/update";
                string strUpdateURI = strUpdateBase + "?key=" + WRITEKEY;
                string strField1 = "18";
                string strField2 = "42";
                HttpWebRequest ThingsSpeakReq;
                HttpWebResponse ThingsSpeakResp;

                strUpdateURI += "&field1=" + strField1;
                strUpdateURI += "&field2=" + strField2;

                ThingsSpeakReq = (HttpWebRequest)WebRequest.Create(strUpdateURI);

                ThingsSpeakResp = (HttpWebResponse)ThingsSpeakReq.GetResponse();

                if (!(string.Equals(ThingsSpeakResp.StatusDescription, "OK")))
                {
                    Console.WriteLine(ThingsSpeakResp.StatusDescription);
                }
                else
                {
                    Console.WriteLine("OK");
                }

                ThingsSpeakResp.Close();

            }
            catch (Exception ex)
            {
                Console.WriteLine("Catch " + ex.Message.ToString());
            }

            Console.ReadKey();
        }
    }
}
