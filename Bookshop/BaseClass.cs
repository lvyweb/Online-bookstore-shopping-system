using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace dbo.sql
{
    public class BaseClass:System.Web.UI.Page
    {
        String strConn;
        public BaseClass()
        {
            strConn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

        //ReadTable方法：从数据库中读取数据，并返回一个DataTable对象
        public DataTable ReadTable(String strSql)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlDataAdapter cmd = new SqlDataAdapter(strSql, con);
            cmd.Fill(dt);
            con.Close();
            return dt;
        }

        //ReadDataSet方法：从数据库中读取数据，并返回一个DataSet对象
        public DataSet ReadDataSet(String strSql)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlDataAdapter cmd = new SqlDataAdapter(strSql, con);
            cmd.Fill(ds);
            con.Close();
            return ds;
        }

        //GetDataSet方法：和ReadDataSet几乎完全相同，只是多了一个tableName参数
        public DataSet GetDataSet(String strSql, String tableName)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlDataAdapter cmd = new SqlDataAdapter(strSql, con);
            cmd.Fill(ds, tableName);
            con.Close();
            return ds;
        }

        //readrow方法：执行SQL查询，并返回一个Reader对象
        public SqlDataReader readrow(String sql)
        {
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlCommand com = new SqlCommand(sql, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.Read())
            {
                com.Dispose();
                return reader;
            }
            else
            {
                com.Dispose();
                return null;
            }
        }

        //Readstr方法：返回查询结果第一行某一个字段的值
        public string Readstr(String strSql, int flag)
        {
            DataSet ds = new DataSet();
            String str;
            SqlConnection con = new SqlConnection(strConn);
            con.Open();
            SqlDataAdapter cmd = new SqlDataAdapter(strSql, con);
            cmd.Fill(ds);
            str = ds.Tables[0].Rows[0].ItemArray[flag].ToString();
            con.Close();
            return str;
        }

        //execsql方法：用来执行SQL更新语句
        public Boolean execsql(String strSql)
        {
            SqlConnection con = new SqlConnection(strConn);
            SqlCommand com = new SqlCommand(strSql, con);
            con.Open();
            int count = com.ExecuteNonQuery();
            if (count > 0)
            {
                con.Close();
                return true;
            }
            else
            {
                con.Close();
                return false;
            }
            
        }

    }
}
