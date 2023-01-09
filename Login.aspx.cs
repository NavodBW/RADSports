using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RADSports
{
    
    //Navod Bhagya Gunasekara 
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Login where UserEmail=@username and UserPassword=@password and UserID=1", conn);
            cmd.Parameters.AddWithValue("@username", Email.Text);
            cmd.Parameters.AddWithValue("@password", Password.Text);

            SqlDataReader loginCheckAdmin;
            conn.Open();
            loginCheckAdmin = cmd.ExecuteReader(); // 

                        if (loginCheckAdmin.Read())
            {

                string username = loginCheckAdmin["UserEmail"].ToString();
                Session["user_session_key"] = username;
                Response.Redirect("AdminSelection.aspx");

            }

           

            conn.Close();
            SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginCon"].ConnectionString);
            SqlCommand cmd2 = new SqlCommand("select * from Login where UserEmail=@username and UserPassword=@password and UserID=2", conn2);
            cmd2.Parameters.AddWithValue("@username", Email.Text);
            cmd2.Parameters.AddWithValue("@password", Password.Text);

            SqlDataReader loginCheckAdmin2;
            conn2.Open();
            loginCheckAdmin2 = cmd2.ExecuteReader(); // 
              if (loginCheckAdmin2.Read())
            {

                string username2 = loginCheckAdmin2["UserEmail"].ToString();
                Session["user_session_key2"] = username2;
                Response.Redirect("ManagerSelection.aspx");

            }


            else
            {

                Response.Write("<script language='javascript'>window.alert('Invalid Credentials!');window.location='Login.aspx';</script>");;
            }
        }
    }
}