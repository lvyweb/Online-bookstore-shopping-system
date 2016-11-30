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
    public partial class admin_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "会员管理";
        }
        protected void databound(object sender, EventArgs e)
        {
            Label1.Text = "共" + (GridView1.PageCount).ToString() + "页";
            Label2.Text = "第" + (GridView1.PageIndex + 1).ToString() + "页";
        }
    }
}
