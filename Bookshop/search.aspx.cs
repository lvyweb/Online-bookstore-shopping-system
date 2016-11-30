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
    public partial class search : System.Web.UI.Page
    {
        BaseClass baseclass = new BaseClass();
		
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.Title = "站内查找";
                get_allbook();
            }
			if(Session["booksearch"] != null)
			{
				search_in.Text=Session["booksearch"].ToString();
				if(Session["booksearchtype"]!= null && Session["booksearchtype"].ToString()=="type") DropDownList1.SelectedValue = "type";
				else DropDownList1.SelectedValue = "title";
				get_search();
				Session["booksearch"]=null;
			}
        }
        private void get_search()
        {
            if (search_in.Text != "")
            {
                string strsql = null;
                if (DropDownList1.SelectedValue.ToString() == "title")
                {
                    strsql = "select * from books where title like '%" + search_in.Text + "%'";
                    
                }
                if (DropDownList1.SelectedValue.ToString() == "author")
                {
                    strsql = "select * from books where author like '%" + search_in.Text + "%'";

                }
                if (DropDownList1.SelectedValue.ToString() == "type")
                {
                    strsql = "select * from books where type like '%" + search_in.Text + "%'";

                }
                DataTable dt = baseclass.ReadTable(strsql);
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = dt.DefaultView;
                Label1.Text = "已为您找到" + dt.Rows.Count.ToString() + "条记录！";
                Panel1.Visible = false;
                DataList1.Visible = true;
                pds.AllowPaging = true;
                pds.PageSize = 12;
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
                    page_panel.Visible = false;
                }
                else
                {
                    page_panel.Visible = true;
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
            else
            {
                get_allbook();
                DataList1.Visible = false;
                Panel1.Visible = true;
            }
            
        }
		

        private void get_allbook()
        {
            string strsql = "select * from books order by book_id desc";
            DataTable dt = baseclass.ReadTable(strsql);
            Label1.Text = "本站书籍总量：" + dt.Rows.Count.ToString();
            PagedDataSource pds = new PagedDataSource();
            DataList1.Visible = false;
            Panel1.Visible = true;
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 12;
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
                page_panel.Visible = false;
            }
            else
            {
                page_panel.Visible = true;
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
            DataList2.DataSource = pds;
            DataList2.DataBind();

        }
        protected void LinkButtonfirst_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = "1";
            get_search();
            get_allbook();
			ScriptManager.RegisterStartupScript(this.LinkButtonfirst, this.GetType(), "ListSpace", "ListSpace();", true);
			//此代码为按点击后，JS代码ListSpace()自动应用，使全页面的书名自动插入空行对齐。由于onclick（后台代码）比onclientclick（JS代码）触发慢，因此只能不断使后台触发JS才可以解决过页后空行不自动添加BUG。
        }

        protected void LinkButtonprev_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = Convert.ToString(int.Parse(this.LabelPage.Text) - 1);
            get_search();
            get_allbook();
			ScriptManager.RegisterStartupScript(this.LinkButtonprev, this.GetType(), "ListSpace", "ListSpace();", true);
        }

        protected void LinkButtonnext_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = Convert.ToString(int.Parse(this.LabelPage.Text) + 1);
            get_search();
            get_allbook();
			ScriptManager.RegisterStartupScript(this.LinkButtonnext, this.GetType(), "ListSpace", "ListSpace();", true);
        }

        protected void LinkButtonlast_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = this.LabelTotalPage.Text;
            get_search();
            get_allbook();
			ScriptManager.RegisterStartupScript(this.LinkButtonlast, this.GetType(), "ListSpace", "ListSpace();", true);
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
                get_search();
        }
    }
}
