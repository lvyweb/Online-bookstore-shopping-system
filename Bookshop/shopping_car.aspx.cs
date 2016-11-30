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
    public partial class shopping_car : System.Web.UI.Page
    {
        BaseClass baseclass = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            /**this.Title = Session["username"].ToString() + "的购物车";**/
            if (!Page.IsPostBack) 
                if (Session["username"] != null)
                {
                    username.Text = Session["username"].ToString() + "的购物车";
                    getorder();
                }
                else
                {
                   this.Response.Write("<script>alert('您还未登录，请先登录！');location.href='login.aspx';</script>");
                }
        }

        private void getorder()
        {
            string strsql = "select * from orders where username='" + Session["username"].ToString() + "' order by order_id desc";
            DataTable dt = baseclass.ReadTable(strsql);
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 9;
            int curpage = Convert.ToInt32(this.LabelPage.Text);
            pds.CurrentPageIndex = curpage - 1;
            if (pds.CurrentPageIndex < 0)
            {
                pds.CurrentPageIndex = 0;
            }
            if (pds.PageCount == 1)
            {
                LinkButtonprev.Enabled = false;
                LinkButtonnext.Enabled = false;
            }
            else
            {
                if (curpage == 1)
                {
                    LinkButtonprev.Enabled = false;
                    LinkButtonnext.Enabled = true;
                }
                if (curpage == pds.PageCount)
                {
                    LinkButtonnext.Enabled = false;
                    LinkButtonprev.Enabled = true;
                }
            }
            this.LabelTotalPage.Text = Convert.ToString(pds.PageCount);
            DataList1.DataSource = pds;
            DataList1.DataBind();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void LinkButtonfirst_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = "1";
            getorder();
        }

        protected void LinkButtonprev_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = Convert.ToString(int.Parse(this.LabelPage.Text) - 1);
            getorder();
        }

        protected void LinkButtonnext_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = Convert.ToString(int.Parse(this.LabelPage.Text) + 1);
            getorder();
        }

        protected void LinkButtonlast_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = this.LabelTotalPage.Text;
            getorder();
        }
        public string get_status(object obj)
        {
            int status = Convert.ToInt32(obj);
            if(status == 0)
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
