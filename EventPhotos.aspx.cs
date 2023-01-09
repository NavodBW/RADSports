using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADSports
{
    public partial class EventPhotos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["user_session_key2"] == null)
                    Response.Write("<script language='javascript'>window.alert('You must login first!');window.location='Login.aspx';</script>");

                else
                    Response.Write("Welcome " + Session["user_session_key2"]);
            }
            catch (Exception ee)
            {
                Response.Write(ee.ToString());
            }
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            entereventdata();
        }

        private void entereventdata()
        {
            string cs2 = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
            using (SqlConnection con2 = new SqlConnection(cs2))
            {

                SqlCommand cmd2 = new SqlCommand("INSERT INTO EventPhotos VALUES" + "('" + TextBox1.Text + "', 'myfiles/" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + TextBox4.Text + " ')", con2);

                con2.Open();
                cmd2.ExecuteNonQuery();
                con2.Close();

            }


        }


        //Does not work after the first time for some reason
        //private void checkevent()
        //{
        //    string cs = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        con.Open();
        //        SqlCommand cmd1 = new SqlCommand();
        //        cmd1.CommandText = "Select * From Event";
        //        cmd1.Connection = con;

        //        SqlDataReader rd = cmd1.ExecuteReader();

        //        while (rd.Read())
        //        {
        //            if (rd[0].ToString() == TextBox1.Text)
        //            {


        //                entereventdata();


        //                break;
        //            }

        //            else
        //            {
        //                Response.Write("<script language='javascript'>window.alert('event already exists!');window.location='Reports.aspx';</script>");
                        
        //                break;


        //            }



        //        }
        //        con.Close();

        //    }

        //}

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchEventPhotos.aspx");
        }
    }
}