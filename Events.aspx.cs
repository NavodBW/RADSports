using Microsoft.Ajax.Utilities;
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
    public partial class Events : System.Web.UI.Page
    {
        int gold = 0;
        int bronze = 0;
        int silver = 0;
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
            TextBox6.Text = DateTime.Now.ToString("HH:mm:ss");

         

        }

        //protected void TextBox2_TextChanged(object sender, EventArgs e)
        //{




        //    string gameendtime = "";
        //    string cs6 = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
        //    using (SqlConnection con6 = new SqlConnection(cs6))
        //    {
        //        con6.Open();
        //        //"SELECT cast((select Game_DurationInHours FROM Game WHERE Game_ID= '" + TextBox2.Text + "')AS datetime) +getdate()"
                

        //        SqlCommand cmd6 = new SqlCommand("SELECT format(cast((select Game_DurationInHours FROM Game WHERE Game_ID = 2)AS string) +getdate(),'hh:mm:ss')", con6);
        //        SqlDataReader rd = cmd6.ExecuteReader();

        //        while (rd.Read())

        //        {

        //            gameendtime = rd.GetString(0);


        //        }


        //        cmd6.ExecuteNonQuery();
        //        con6.Close();

        //    }
        //    TextBox7.Text = gameendtime.ToString();
        //}
        private void validation()
        {
            int value1 = Convert.ToInt32(TextBox11.Text);
            Response.Write(value1);
            while (true)
            {


                if (DropDownList2.SelectedItem.Value.ToString() == "Gold" && TextBox11.Text == "1")
                {


                    gold = gold + 1;
                    enterData();
                    break;

                }


                else if (DropDownList2.SelectedItem.Value.ToString() == "Silver" && TextBox11.Text == "2")
                {

                    silver = silver + 1;
                    enterData();
                    break;

                }


                else if (DropDownList2.SelectedItem.Value.ToString() == "Bronze" && TextBox11.Text == "3")
                {
                    bronze = bronze + 1;
                    enterData();
                    break;

                }






                else if (value1 > 3 && DropDownList2.SelectedItem.Value.ToString() == "No")
                {
                    enterData();
                    break;
                }


                else
                {
                    Response.Write("<script language='javascript'>window.alert('position cannot have a medal!');window.location='Reports.aspx';</script>");

                    break;

                }





            }

        }

        //private void checkeventID()
        //{
        //    string cs5 = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
        //    using (SqlConnection con5 = new SqlConnection(cs5))
        //    {
        //        con5.Open();
        //        SqlCommand cmd5 = new SqlCommand();
        //        cmd5.CommandText = "Select * From Event";
        //        cmd5.Connection = con5;

        //        SqlDataReader rd = cmd5.ExecuteReader();

        //        while (rd.Read())
        //        {
        //            if (rd[0].ToString() == TextBox9.Text)
        //            {

        //                validation();


        //                break;
        //            }

        //            else
        //            {
        //                Response.Write("<script language='javascript'>window.alert('event does not exist!');window.location='Events.aspx';</script>");
        //                break;

        //            }



        //        }
        //        con5.Close();

        //    }

        //}


        private void enterData()
        {
            string compcountry = "";
            string cs4 = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
            using (SqlConnection con4 = new SqlConnection(cs4))
            {

                con4.Open();
                SqlCommand cmd4 = new SqlCommand("Select Competitor_Country From Competitor Where Competitor_ID='" + TextBox9.Text + "'", con4);
                cmd4.Connection = con4;
                SqlDataReader rd = cmd4.ExecuteReader();

                while (rd.Read())

                {

                    compcountry = rd.GetString(0);


                }
                string cs3 = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
                using (SqlConnection con3 = new SqlConnection(cs3))

                {

                    int totmed = gold + silver + bronze;
                    SqlCommand cmd3 = new SqlCommand("INSERT INTO Outcome VALUES" + "('" + TextBox9.Text + "', '" + TextBox10.Text + "', '" + TextBox11.Text + "', @Competitor_Medal , '" + compcountry + "', @Gold_Count , @Silver_Count , @Bronze_Count, " + totmed + " )", con3);
                    cmd3.Parameters.AddWithValue("@Competitor_Medal", DropDownList2.SelectedItem.Value);
                    cmd3.Parameters.AddWithValue("@Gold_Count ", gold);
                    cmd3.Parameters.AddWithValue("@Silver_Count ", silver);
                    cmd3.Parameters.AddWithValue("@Bronze_Count ", bronze);



                    con3.Open();
                    cmd3.ExecuteNonQuery();
                    con3.Close();

                }
                Label2.Text = "Success";




            }

        }
        protected void Button2_Click(object sender, EventArgs e)
        {







            validation();





        }
        private void checkevent()
        {
            string cs = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "Select * From Event";
                cmd1.Connection = con;

                SqlDataReader rd = cmd1.ExecuteReader();

                while (rd.Read())
                {
                    if (rd[0].ToString() == TextBox1.Text)
                    {
                        Response.Write("<script language='javascript'>window.alert('event already exists!');window.location='Reports.aspx';</script>");

                        


                        break;
                    }

                    else
                    {
                        entereventdata();
                        break;
                        

                    }



                }
                con.Close();

            }

        }
        private void entereventdata()
        {
            string cs2 = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
            using (SqlConnection con2 = new SqlConnection(cs2))
            {

                SqlCommand cmd2 = new SqlCommand("INSERT INTO Event VALUES" + "('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + TextBox4.Text + "', '" + TextBox5.Text + "', '" + TextBox6.Text + "', '" + TextBox7.Text + "', '" + TextBox8.Text + "', '" + DropDownList1.SelectedItem.Value + " ')", con2);

                con2.Open();
                cmd2.ExecuteNonQuery();
                con2.Close();

            }
            Label1.Text = "Event added successfully";


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            checkevent();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("EventView.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("EventPhotos.aspx");
        }
    }
}