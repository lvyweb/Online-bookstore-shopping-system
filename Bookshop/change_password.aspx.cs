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
    public partial class change_password : System.Web.UI.Page
    {
        BaseClass baseclass = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
                if (Session["username"] == null)
                {
                    this.Response.Write("<script>alert('您还未登录，请先登录！');location.href='Default.aspx';</script>");
                }
                else
                {
                    this.Title = "更改密码";
                }
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            string oldpass = FormsAuthentication.HashPasswordForStoringInConfigFile(old_pass.Text, "MD5");
            string newpass = FormsAuthentication.HashPasswordForStoringInConfigFile(new_pass.Text, "MD5");
            string strsql = "select password from users where username = '" + Session["username"].ToString() + "'";
            if(oldpass == baseclass.Readstr(strsql,0))
            {
                if (oldpass != newpass)
                {
                    if (new_pass.Text.Length >= 6 && new_pass.Text.Length <= 20)
                    {
                        strsql = "update users set password ='" + newpass + "'";
                        if (baseclass.execsql(strsql))
                        {
                            this.Response.Write("<script>alert('密码修改成功，现在去登录！');location.href='Default.aspx';</script>");
                            Session["username"] = null;
                        }
                        else
                        {
                            this.Response.Write("<script>alert('密码修改失败！');</script>");
                        }
                    }
                    else
                    {
                        error.Text = "密码长度输入错误！";
                    }
                }
                else
                {
                    error.Text = "新密码不能和原密码相同！";
                }
            }   
            else
            {
                oldlabel.Text = "原密码输入错误！";
            }
        }
    }
}
