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
using System.Data.SqlClient;
using dbo.sql;
// 下载于www.51aspx.com
namespace 网上书城
{
    public partial class userlogin : System.Web.UI.Page
    {
        BaseClass baseclass1 = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "用户注册";
        }
       
        protected void ImageButton1_Click(object sender, EventArgs e)
        {
             insert();
        }

        private void insert()
        {
            string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(password.Text, "MD5");
            if (success() == true)
            {
                if (CustomValidator1.IsValid == true)
                {
                    string strsql;
                    strsql = "insert into users(username,password,phone,email,address,postcode) values('" +
                        username.Text + "','" + pass + "','" + phone.Text + "','" + email.Text + "','" + address.Text + "','" + postcode.Text + "')";
                    if (baseclass1.execsql(strsql))
                    {
                        empty();
                        Label1.Text = "注册成功！<a href=\"Default.aspx\">去书城看看？</a>";
                        
                    }
                    else
                    {
                        Label1.Text = "信息输入错误，请重新输入！";
                    }
                }
                else
                {
                    Label1.Text = "信息输入错误，请重新输入！";
                }
            }
            else
                Label1.Text = "信息输入错误，请重新输入！";
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string strsql = "select * from users where username = '" + args.Value.ToString() + "'";
            DataSet ds = new DataSet();
            ds = baseclass1.GetDataSet(strsql, "username");
            if (ds.Tables["username"].Rows.Count > 0)
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            } 
        }

        protected Boolean success() 
        {
            if (username.Text.Length >= 3 && username.Text.Length <= 20 && password.Text.Length >= 6 && password.Text.Length <= 20 )
            {
                return true;
            }
            else
            {
                Label1.Text = "用户名或密码长度输入错误！";
                return false;
            }
        }

        protected void ImageButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.ToString()); 
        }
        private void empty()
        {
            username.Text = "";
            password.Text = "";
            password2.Text = "";
            phone.Text = "";
            email.Text = "";
            address.Text = "";
            postcode.Text = "";
        }
    }
}
