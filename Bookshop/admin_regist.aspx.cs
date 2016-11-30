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

namespace 网上书城
{
    public partial class admin_regist1 : System.Web.UI.Page
    {
        BaseClass baseclass = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "管理员注册";
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            
            if (CustomValidator1.IsValid == true)
            {
                string strsql;
                string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(ad_pass.Text, "MD5");
                string klstr = "202CB962AC59075B964B07152D234B70";
                string kl = FormsAuthentication.HashPasswordForStoringInConfigFile(kouling.Text, "MD5");
                strsql = "insert into admin(admin_name,admin_pwd,admin_email) values ('" +
                        ad_name.Text + "','" + pass + "','" + ad_email.Text + "')";
                if (kl == klstr && baseclass.execsql(strsql))
                {
                    Session["admin"] = ad_name.Text;
                    Response.Redirect("admin.aspx");
                }
                else
                {
                    Label1.Text = "输入信息错误！请重新输入！";
                }
            }
            else
            {
                Label1.Text = "输入信息错误！请重新输入！";
            }  
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string strsql = "select * from admin where admin_name = '" + args.Value.ToString() + "'";
            DataSet ds = new DataSet();
            ds = baseclass.GetDataSet(strsql, "admin_name");
            if (ds.Tables["admin_name"].Rows.Count > 0)
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
