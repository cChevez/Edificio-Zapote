using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC
{
    public partial class StartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("View/UserViews/Index.aspx");
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("View/UserViews/Login.aspx");
        }
    }
}