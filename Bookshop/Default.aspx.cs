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
using dbo.sql;
 
namespace 网上书城
{
    public partial class Default : System.Web.UI.Page
    {
        BaseClass baseclass = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                get_picture();
            } 
                
        }

 
        private void get_picture()
        {
            string strsql = "select top 10 * from books order by book_id desc";
            DataTable dt = baseclass.ReadTable(strsql);
            PagedDataSource objpd = new PagedDataSource();
            objpd.DataSource = dt.DefaultView;
            objpd.AllowPaging = false;
            Repeater1.DataSource = objpd;
            Repeater1.DataBind();
        }
		
		protected void GotoSearch(object sender, CommandEventArgs e)
		{
			Session["booksearch"] = e.CommandName;
			Session["booksearchtype"] = "type";
			Response.Redirect("search.aspx");
			//ScriptManager.RegisterStartupScript(this.flq_hide, this.GetType(), "alerttest", "alert('"+e.CommandName+"');", true);
			
		}
    }
}
