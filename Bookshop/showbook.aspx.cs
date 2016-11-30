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
using System.Text;
using System.Text.RegularExpressions;

namespace 网上书城
{
    public partial class showbooks : System.Web.UI.Page
    {
        BaseClass baseclass = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "图书浏览";
            if (!Page.IsPostBack) getnewslist();
        }
        private void getnewslist()
        {
            string strsql = "select * from books order by book_id desc";
            DataTable dt = baseclass.ReadTable(strsql);
            PagedDataSource objpd = new PagedDataSource();
            objpd.DataSource = dt.DefaultView;
            objpd.AllowPaging = true;
            objpd.PageSize = 12;
            int curpage = Convert.ToInt32(this.LabelPage.Text);
            objpd.CurrentPageIndex = curpage - 1;
            if (objpd.CurrentPageIndex < 0)
            {
                objpd.CurrentPageIndex = 0;
            }
            if (objpd.PageCount == 1)
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
                if (curpage == objpd.PageCount)
                {
                    LinkButtonnext.Enabled = false;
                    LinkButtonprev.Enabled = true;
                }
            }
            this.LabelTotalPage.Text = Convert.ToString(objpd.PageCount);
            Repeater1.DataSource = objpd;
            Repeater1.DataBind();
        }

        protected void LinkButtonfirst_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = "1";
            getnewslist();
        }

        protected void LinkButtonprev_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = Convert.ToString(int.Parse(this.LabelPage.Text) - 1);
            getnewslist();
        }

        protected void LinkButtonnext_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = Convert.ToString(int.Parse(this.LabelPage.Text) + 1);
            getnewslist();
        }

        protected void LinkButtonlast_Click(object sender, EventArgs e)
        {
            this.LabelPage.Text = this.LabelTotalPage.Text;
            getnewslist();
        }

        public static string CutString2(object content, int length)
        {
            string temp = content.ToString().Replace("<br/>", "").Replace("<br>", "");//先替换换行标签，保证不出现换行

            //参数说明：要处理的字符串，符合条件的表达式[汉字]，替换的字符[内容随意写但是要两个字符，因为一个中文对应两个字符，不区分大小写]
            if (Regex.Replace(temp, "[\u4e00-\u9fa5]", "zz", RegexOptions.IgnoreCase).Length <= length)
            {
                return temp;
            }
            for (int i = temp.Length; i >= 0; i--)
            {
                temp = temp.Substring(0, i);
                if (Regex.Replace(temp, "[\u4e00-\u9fa5]", "zz", RegexOptions.IgnoreCase).Length <= length - 3)
                {
                    return temp + "...";
                }
            }
            return "";
        }
    }
}
