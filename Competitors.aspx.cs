using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace RADSports
{
    public partial class Competitors : System.Web.UI.Page
    {
        //bool value for email validation
        bool CompetitorEmailExists = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["user_session_key"] == null)
                    Response.Write("<script language='javascript'>window.alert('You must login first!');window.location='Login.aspx';</script>");

                else
                    Response.Write("Welcome " + Session["user_session_key"]);
            }
            catch (Exception ee) {
                Response.Write(ee.ToString());

            }

        }

        private void LoadImages()
        {
            string cs = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select * from Competitor", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                GridView1.DataSource = rdr;
                GridView1.DataBind();
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                HttpPostedFile postedFile = FileUpload1.PostedFile;
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);


                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                    string cs = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();
                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.CommandText = "Select * From Competitor";
                        cmd1.Connection = con;

                        SqlDataReader rd = cmd1.ExecuteReader();

                        while (rd.Read())
                        {
                            if (rd[4].ToString() == TextBox5.Text)
                            {
                                CompetitorEmailExists = true;
                                Response.Write("<script language='javascript'>window.alert('Competitor Email Already exists!');window.location='Competitors.aspx';</script>");


                                break;
                            }



                        }
                        con.Close();
                        if (CompetitorEmailExists == false)
                        {
                            string cs1 = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
                            using (SqlConnection con1 = new SqlConnection(cs1))
                            {
                                SqlCommand cmd = new SqlCommand("INSERT INTO Competitor VALUES" + "('" + TextBox1.Text + "', '" + DropDownList2.SelectedItem.Value + "', '" + TextBox3.Text + "', '" + TextBox4.Text + "', '" + TextBox5.Text + "', '" + TextBox6.Text + "', '" + ddlCountryOrigin.SelectedItem.Value + "', '" + DropDownList1.SelectedItem.Value + "', '" + TextBox9.Text + "', '" + TextBox10.Text + "', @Competitor_Photo, " + TextBox11.Text + " )", con1);
                                cmd.Parameters.AddWithValue("@Competitor_Photo", bytes);
                                con1.Open();
                                cmd.ExecuteNonQuery();
                                con1.Close();


                            }


                            //cmd.Parameters.Add(paramName);
                            //SqlParameter paramNewId = new SqlParameter()
                            //{
                            //    ParameterName = "@Competitor_ID",

                            //    Direction = ParameterDirection.Output

                            //};
                            //cmd.Parameters.Add(paramNewId);

                        }




                        LoadImages();




                    }

                }
                else
                {
                    Response.Write("<script language='javascript'>window.alert('Invalid FileType Only JPG, GIF, PNG, BMP Files are allowed!');window.location='Competitors.aspx';</script>");
                }

            
            
             
                
                

            }
            catch (Exception)
            {
                Response.Write("<script language='javascript'>window.alert('Error! - Data already exists in the database or invalid data type');window.location='Competitors.aspx';</script>");

               
            }
            

        }

     

 
    }
}