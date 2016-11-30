<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.login" Title="无标题页" Codebehind="login.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                            <div id="container">
								<div id="SM_alertstate" class="alert alert-danger alert-dismissable collapse hidden-lg hidden-md"><!--警告框，.collapse默认折叠 alert默认警告框 后台有触发出现与自动隐藏JS-->
									<button type="button" id="alertclose" class="close"><!--有滑动关闭js，.close表示关闭按钮，&times;表示叉号，后面还有控制关闭什么的符号-->
									&times;
									</button>   用户名不存在或密码错误，请确认后登录！
								</div>
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>用户登录</h3>
                            		<p>请输入帐号及密码</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<asp:TextBox ID="form_username" class="form-control navbar-btn input-sm" runat="server" TextMode="SingleLine" placeholder="请输入用户名"></asp:TextBox>
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<asp:TextBox ID="form_password" class="form-control navbar-btn input-sm" runat="server" TextMode="Password" placeholder="请输入密码"></asp:TextBox>
			                        </div>
			                       <asp:button  ID="form_login_button" Text="登录" class="btn btn-default btn-primary btn-sm loginin" runat="server" OnClick="form_login_button_Click" />
     <asp:button  ID="form_regist_button" Text="注册" class="btn btn-default btn-primary btn-sm" runat="server" OnClick="form_regist_button_Click" />
	<!--  <asp:LinkButton ID="form_forgetpass" runat="server" CssClass="navbar-link" OnClick="form_forgetpass_Click">忘记密码？</asp:LinkButton> -->	                    
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
   
     
      
</asp:Content>
