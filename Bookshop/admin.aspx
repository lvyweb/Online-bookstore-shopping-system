<%@ Page Language="C#" 	MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.admin" Title="无标题页" Codebehind="admin.aspx.cs" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" language="javascript"> //重新获取验证字符 
                    function changeImage() 
                    { //单击触发图片重载事件，完成图片验证码的更换 
                        document.getElementById("ImageButton2").src = document.getElementById("ImageButton2").src + '?'; 
                    } 
</script>

    <div>
        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
        <ContentTemplate>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="LinkButton1" />
        </Triggers>
        </asp:UpdatePanel>
        <center>
            <h1>
                <asp:Label ID="houtai" runat="server" Text="后台管理"></asp:Label>
            </h1>
            <asp:LinkButton Font-Size="30px" ForeColor="Blue" ID="LinkButton1"
                runat="server" onclick="LinkButton1_Click1"></asp:LinkButton>
        </center>
    </div>
    <asp:Panel ID="Panel1" runat="server" Visible="True">
        <table style="width:450px; margin-left:auto; margin-right:auto;">
            <tr>
                <td colspan="2" style="text-align:center; height:50px;" valign="bottom">
                
                    <asp:Label ID="Label2" runat="server" Text="管理员登录" Font-Size="Larger" 
                        ForeColor="Red" Font-Bold="True"></asp:Label>
                
                </td>
            </tr>
            <tr>
                <td style="text-align:right; height:40px; width:100px;">
                    用户名：</td>
                <td style="text-align:left;">
                <asp:TextBox ID="ad_name" runat="server" style="margin-left: 1px" 
                Width="160px"></asp:TextBox>
                </td>
            </tr>
            <tr> 
                <td style="text-align:right; height:40px;">
                    密码：
                </td>
                <td style="text-align:left;">
                    <asp:TextBox ID="ad_password" runat="server" 
                    Width="160px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr valign="middle" style="height:40px;"> 
                <td style="text-align:right;">
                    验证码：
                </td>
                <td valign="middle" style="text-align:left; width:200px;">
                    <asp:TextBox ID="ValidateNum" Width="80px" runat="server"></asp:TextBox>
                    <a href="javascript:changeImage();" ><img alt="验证码" id="ImageButton2" title="点击图片刷新" src="yanzhengma.aspx" />看不清?换一张</a>
                    
                </td>
            </tr>
            <tr>
                <td style=" height:50px;text-align:right;">
                    <asp:LinkButton ID="ImageButton1"  
                        runat="server"  onclick="ImageButton1_Click" >登陆</asp:LinkButton>
                </td>
				<td valign="middle" style="text-align:center; width:200px;">
					<a href="admin_regist.aspx">现在去注册？</a>
                        
               </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False">
        
		<table>
            <tr>
                <td class="admin_left" valign="top">
                    <a href="admin_user.aspx" target="admin_main"><div class="admin_menu">会员管理</div></a>
                    <a href="admin_order.aspx" target="admin_main"><div class="admin_menu">订单管理</div>
                    <a href="add_book.aspx" target="admin_main"><div class="admin_menu">添加书籍</div></a>
                    <a href="admin_book.aspx" target="admin_main"><div class="admin_menu">管理书籍</div>
                    <a href="admin_stock.aspx" target="admin_main"><div class="admin_menu">库存管理</div></a>
                    <a href="admin_list.aspx" target="admin_main"><div class="admin_menu">管理员名单</div></a>
                 </td>
                <td class="admin_right">
                    <iframe id="admin_main" class="admin_main" scrolling="yes" name="admin_main">
                    
                    </iframe>
                </td>
            </tr>
        </table>
		
    </asp:Panel>
</asp:Content>