using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADSports
{
    //Main menu page for admin login
    public partial class AdminSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //login tutorial from workshop 9
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Games.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Competitors.aspx");
        }
    }
}