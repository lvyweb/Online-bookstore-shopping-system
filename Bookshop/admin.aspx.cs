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
using System.Drawing;
// 下载于www.51aspx.com
namespace 网上书城
{
    public partial class admin : System.Web.UI.Page
    {
        BaseClass baseclass = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.Title = "后台管理";
                if (Session["admin"] != null)
                {
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    houtai.Text = "管理员：" + Session["admin"].ToString();
                    LinkButton1.Text = "退出";
                }
            }
        }

        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(ad_password.Text, "MD5");
            string strsql = "select * from admin where admin_name='" + ad_name.Text + "'and admin_pwd='" + pass + "'";
            DataSet ds = new DataSet();
            ds = baseclass.GetDataSet(strsql, "admin_name");
            try
            {
                if (ds.Tables["admin_name"].Rows.Count == 0)
                {
                    Label2.Text = "用户名不存在或密码错误，请确认后登录！";
                    Session["admin"] = null;
                }
                else
                {
                    string text = this.ValidateNum.Text.ToString();//获得用户输入的验证码
                    string chkcode = Request.Cookies["validateCookie"].Values["ChkCode"].ToString();//获得系统生成的验证码
                    if (!string.IsNullOrEmpty(text) && !string.IsNullOrEmpty(chkcode))
                    {
                        if (!chkcode.Equals(chkcode.ToUpper()))//如果系统生成的不为大写则转换成大写形式
                            chkcode.ToUpper();
                        if (text.ToUpper().Trim().Equals(chkcode.Trim())) //将输入的验证码转换成大写并与系统生成的比较
                        {
                            Panel1.Visible = false;
                            Panel2.Visible = true;
                            Session["admin"] = ad_name.Text;
                            houtai.Text = "管理员：" + Session["admin"].ToString();
                            LinkButton1.Text = "退出";
                        }
                        else
                        {
                            this.Label2.Text = "验证码不正确";
                        }
                    }
                    else if (string.IsNullOrEmpty(text))
                    {
                        this.Label2.Text = "请输入验证码!!";
                    }
                    
                }
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
            }
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Response.Redirect(Request.Url.ToString());
        }
    }
}
