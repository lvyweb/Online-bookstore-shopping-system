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
    public partial class add_book2 : System.Web.UI.Page
    {
        BaseClass baseclass = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "添加书籍";
        }

        protected void submit_Click(object sender, ImageClickEventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (fileExtension != ".jpg")
                {
                    Label1.Text = "照片上传类型不正确，请上传jpg格式！";
                }
                else
                {
                    string picturename = DateTime.Now.ToString("yyyyMMddHHmmss") + ".jpg";
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("./image/books/") + picturename);
                    if (CustomValidator1.IsValid == true)
                    {
                        decimal dprice = Convert.ToDecimal(price.Text.Trim());
                        int stocknum = Convert.ToInt32(stock_num.Text.Trim());
                        string strsql = "insert into books(ISBN,title,author,version,pubdate,introdu,price,picname,type) values('" +
                                   ISBN.Text + "','" + title.Text + "','" + author.Text + "','"
                                   + version.Text + "','" + pubdate.Text + "','" + introduce.Text + "','"
                                   + dprice + "','" + picturename + "','" + type.SelectedValue.ToString() + "')";
                        try
                        {
                            if (baseclass.execsql(strsql))
                            {
                                strsql = "insert into stock(isbn,stock_num,price,logdate) values('" +
                                   ISBN.Text + "','" + stocknum + "','" + dprice + "','"
                                   + pubdate.Text +  "')";
                                if (baseclass.execsql(strsql))
                                {
                                    Label1.Text = "书籍发布成功！";
                                    Response.Write("<script>alert('发布成功!')</script>");
                                }
                            }
                            else
                            {
                                Label1.Text = "信息输入错误，请重新输入！";
                            }
                        }
                        catch (Exception ex)
                        {
                            Label1.Text = ex.Message;
                        }

                    }
                    else
                    {
                        Label1.Text = "已经存在该书籍！";
                    }
                }
            }
            else
            {
                Label1.Text = "文件不存在！";
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string strsql = "select * from books where ISBN = '" + args.Value.ToString() + "'";
            DataSet ds = new DataSet();
            ds = baseclass.GetDataSet(strsql, "ISBN");
            if (ds.Tables["ISBN"].Rows.Count > 0)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}
