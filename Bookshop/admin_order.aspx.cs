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
// 下载于www.51aspx.com
namespace 网上书城
{
    public partial class admin_order : System.Web.UI.Page
    {
        BaseClass baseclass = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "订单管理";
        }
        protected void databound(object sender, EventArgs e)
        {
            Label1.Text = "共" + (GridView1.PageCount).ToString() + "页";
            Label2.Text = "第" + (GridView1.PageIndex + 1).ToString() + "页";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strsql = "update orders set status=1 where order_id='" + ((Button)sender).CommandArgument.ToString() + "'";
            try
            {
                if (baseclass.execsql(strsql))
                {
                    GridView1.DataBind();
                }   
            }
            catch (Exception ex)
            {

            }
        }
        public string get_status(object obj)
        {
            int status = Convert.ToInt32(obj);
            if (status == 0)
            {
                return "未处理";
            }
            else
            {
                return "已处理";
            }
        }
    }
}
