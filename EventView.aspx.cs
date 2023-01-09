using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADSports
{
    // Event view page handled by gridview
    public partial class EventView : System.Web.UI.Page
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
    }
}