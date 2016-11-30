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
    public partial class masterpage : System.Web.UI.MasterPage
    {
        BaseClass baseclass = new BaseClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToString("yyy年MM月dd日 tt hh:mm:ss");
            BaseClass baseclass = new BaseClass();

           
            if (Session["username"] != null)  //当直接跳入时判断用户登陆
            {
                welcome.Text = "欢迎您：" + Session["username"].ToString();
                userlogin.Visible = false;
                SM_unlogin.Visible = false;
                login_success.Visible = true;
                SM_login.Visible = true;
            }
            
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {	

            Label1.Text = DateTime.Now.ToString("yyy年MM月dd日 tt hh:mm:ss");
        }

        protected void forgetpass2_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_regist.aspx");
        }

        protected void login_button_Click(object sender, EventArgs e)
        {
            string pass = FormsAuthentication.HashPasswordForStoringInConfigFile(password.Text, "MD5");
            string strsql = "select * from users where username = '" + username.Text + "' and password = '" + pass + "'";
            DataSet ds = new DataSet();
            ds = baseclass.GetDataSet(strsql, "username");
            try
            {
                if (ds.Tables["username"].Rows.Count == 0)  //登陆失败进行警告
                {   
                    
					
					ScriptManager.RegisterStartupScript(this.userlogin, this.GetType(), "alertshow", "$('#alertstate').slideDown('slow').delay(3000).slideUp('slow');", true);
					
				   //此处用法为页面存在ajax的情况下执行前台JS，此处登陆失败触发警告框
                    Session["username"] = null;
                }
                else
                {
                    welcome.Text = "欢迎您：" + ds.Tables["username"].Rows[0]["username"].ToString();  //输入账号成功时进行登陆
                    Session["username"] = ds.Tables["username"].Rows[0]["username"].ToString();
                    userlogin.Visible = false;
                    login_success.Visible = true;
                }
            }
            catch (Exception ex)
            {
                
            }
        }
		

        protected void regist_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_regist.aspx");
        }

        protected void forgetpass_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgetpass.aspx?username=" + username.Text);
        }
                
        protected void OutLogin_Click(object sender, EventArgs e)
        {
            Session["username"] = null;            
            
            userlogin.Visible = true;
            login_success.Visible = false;
            UpdatePanel3.Update();
            Response.Redirect("Default.aspx");

        }
		
		protected void searchbutton_Click(object sender, EventArgs e)
        {
            Session["booksearch"] = navbooksearch.Text;
			//ScriptManager.RegisterStartupScript(this.searchbutton, this.GetType(), "alertsearch", "alert('"+navbooksearch.Text+"');", true);
			Response.Redirect("search.aspx");
        }
		
		protected void login_buttonSM_Click(object sender, EventArgs e)
        {
            
        }
    }
}
