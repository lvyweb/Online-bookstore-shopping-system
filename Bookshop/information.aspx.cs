using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace 网上书城
{
    public partial class information : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                if (Session["username"] != null)
                {
                    this.Title = Session["username"].ToString();
                }
                    
                else
                {
                    this.Response.Write("<script>alert('您还未登录，请先登录！');location.href='Default.aspx';</script>");
                }
        }
		
		protected void LogoutButton_Click(object sender, EventArgs e)
		{
			Session["username"] = null;
			Response.Redirect("Default.aspx");
		}
    }
}
