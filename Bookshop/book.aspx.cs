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
    public partial class book : System.Web.UI.Page
    {
        BaseClass baseclass =new  BaseClass();
        int bookid;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                bookid = int.Parse(Request.Params["book_id"]);
            }
            catch (Exception ex)
            { 
                
            }
            getbook(bookid);
            this.Title = title.Text;
        }
        private void getbook(int bookid)
        {
            string strsql = " select * from books where book_id = '" + bookid + "'";
            DataTable dt = new DataTable();
            dt = baseclass.ReadTable(strsql);
            if (dt.Rows.Count > 0)
            {
                ISBN.Text = dt.Rows[0][0].ToString();
                title.Text = dt.Rows[0][2].ToString();
                author.Text = dt.Rows[0][3].ToString();
                version.Text = dt.Rows[0][4].ToString();
                pubdate.Text = dt.Rows[0][5].ToString();
                introduce.Text = dt.Rows[0][6].ToString();
                price.Text = dt.Rows[0][7].ToString();
                if (DBNull.Value != dt.Rows[0][8])
                Image1.ImageUrl = "./image/books/" + dt.Rows[0][8].ToString();
                Image1.ToolTip = dt.Rows[0][2].ToString();
            }
            else
            {
                title.Text = "该书籍已下架！";
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["username"] != null)
            {
                add_shoppingcar();
            }
            else
                this.Response.Write("<script>alert('您还未登录，请先登录！');</script>");
        }

        private void add_shoppingcar()
        {
            if (order_num.Text != "0")
            {
                try
                {
                    string strsql = "select address from users where username = '" + Session["username"] + "'";
                    DataTable dt = new DataTable();
                    dt = baseclass.ReadTable(strsql);
                    string address = dt.Rows[0][0].ToString();
                    int num = Convert.ToInt32(order_num.Text);
                    decimal prices = Convert.ToDecimal(price.Text);
                    decimal money = prices * num;
                    string username = Session["username"].ToString();
                    string datetime = DateTime.Now.ToString("yyy/MM/dd");
                    strsql = "insert into orders(username,order_date,book_id,book_title,quantity,adress,status,price) values('"
                                          + username + "','" + datetime + "','" + bookid + "','" + title.Text + "','"
                           + order_num.Text + "','" + address + "','" + 0 + "','" + money + "')";
                    try
                    {
                        if (baseclass.execsql(strsql))
                        {
                            Response.Write("<script>alert('成功将\"" + title.Text + "\"添加到\""+username+"\"的购物车!')</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('添加到购物车失败!')</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        error.Text = ex.Message ;
                    }

                }
                catch (Exception ex)
                {
                    error.Text = ex.Message + "订购数量为整数！";
                }
            }
            else
            {
                Response.Write("<script>alert('请添加购买数量!')</script>");
            }
            
            
        }
    }
}
