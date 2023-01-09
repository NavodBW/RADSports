using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RADSports
{
    public partial class Logout : System.Web.UI.Page
    {
        //killing the session when logged out. The browser back button works but the actual links inside the page will not work after logging out
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user_session_key2"] = null;
            Session["user_session_key"] = null;
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}