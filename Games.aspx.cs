using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Microsoft.Ajax.Utilities;

namespace RADSports
{
    public partial class Games : System.Web.UI.Page
    {
        //bool to check whether game ID exists
        public bool GameIDExists = false;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["user_session_key"] == null)
                    Response.Write("<script language='javascript'>window.alert('You must login first!');window.location='Login.aspx';</script>");

                else
                    Response.Write("Welcome " + Session["user_session_key"]);
            }
            catch (Exception ee)
            {
                Response.Write(ee.ToString());

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/myfiles/") + FileUpload1.FileName);

            //Check for filetype
            if (fileExtension.ToLower() == ".pdf")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                string cs = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.CommandText = "Select * From Game";
                    cmd1.Connection = con;

                    SqlDataReader rd = cmd1.ExecuteReader();
                    //Checl for Game ID
                    while (rd.Read())
                    {
                        if (rd[0].ToString() == TextBox1.Text)
                        {
                            GameIDExists = true;
                            Response.Write("<script language='javascript'>window.alert('Game Already exists!');window.location='Games.aspx';</script>");


                            break;
                        }
                       


                    }
                    con.Close();
                    //inserting game data if the game ID doesnt exist
                    if (GameIDExists == false)
                    {
                        string cs1 = ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString;
                        using (SqlConnection con1 = new SqlConnection(cs1))
                        {
                            SqlCommand cmd = new SqlCommand("INSERT INTO Game VALUES" + "('" + TextBox1.Text + "', '" + TextBox2.Text + "', '" + TextBox3.Text + "', '" + TextBox4.Text + "', '" + TextBox5.Text + "', @Game_RulesBooklet )", con1);
                            cmd.Parameters.AddWithValue("@Game_RulesBooklet", bytes);


                            con1.Open();
                            cmd.ExecuteNonQuery();
                            con1.Close();

                            Label1.Text = "Upload Successfull. Rulesbook saved in 'myfiles' folder. Go back and revisit to see the changes";
                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            TextBox4.Text = "";
                            TextBox5.Text = "";

                        }
                        

                    }
                    
                }
            }
            else
            {
                
                Response.Write("<script language='javascript'>window.alert('Invalid FileType Only PDF Files are allowed!');window.location='Games.aspx';</script>");


            }



         
        }



    


        //method to downoload the rules PDF
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=GameRulesBooklet.pdf");
                Response.TransmitFile(Server.MapPath("~/myfiles/GameRulesBooklet.pdf"));
                Response.End();
            }

        }

        
        
    }
}
