using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADSports
{
    public partial class CompetitorEdit : System.Web.UI.Page
    {
        //page to edit and delete competitor data handled through gridview
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
    }
}