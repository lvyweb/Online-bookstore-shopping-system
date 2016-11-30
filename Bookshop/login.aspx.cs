using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using dbo.sql;

namespace 网上书城
{
    public partial class login : System.Web.UI.Page
    {
        BaseClass baseclass = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {

           
        }

        

        protected void form_login_button_Click(object sender, EventArgs e)
        {
            string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(form_password.Text, "MD5");
            string strsql = "select * from users where username = '" + form_username.Text + "' and password = '" + pass + "'";
            DataSet ds = new DataSet();
            ds = baseclass.GetDataSet(strsql, "username");
            try
            {
                if (ds.Tables["username"].Rows.Count == 0)  //登陆失败进行警告
                {




                    ScriptManager.RegisterStartupScript(this.form_login_button, this.GetType(), "alertshow", "$('#SM_alertstate').slideDown('slow').delay(3000).slideUp('slow');", true);
                    Session["username"] = null;
                    
                }
                else
                {
                    
                    Session["username"] = ds.Tables["username"].Rows[0]["username"].ToString();
                    Response.Redirect("Default.aspx");
                }
            }
            catch (Exception ex)
            {

            }
        }


        protected void form_regist_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_regist.aspx");
        }

        protected void form_forgetpass_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgetpass.aspx?username=" + form_username.Text);
        }

        protected void form_OutLogin_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("Default.aspx");

        }
    }
 
 
}
