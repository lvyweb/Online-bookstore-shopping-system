<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.change_password" Title="无标题页" Codebehind="change_password.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate></ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="ImageButton1" />
    </Triggers>
    </asp:UpdatePanel>
						<div class="col-sm-6 col-sm-offset-3 form-box">
							<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>更改密码</h3>
                            		<p>请输入要更改的密码</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
							<div class="form-bottom" style="display:table-cell;">
			                    
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<asp:TextBox class="form-control navbar-btn input-sm" runat="server" ID="old_pass" TextMode="Password" runat="server" placeholder="请输入原密码"></asp:TextBox>
										<asp:Label ID="oldlabel" runat="server" Text=""></asp:Label>
			                        </div>
			                        <div class="form-group">
									<div class="row" style="vertical-align: middle;">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<div class="col-sm-6"><asp:TextBox class="form-control navbar-btn input-sm" ID="new_pass" ToolTip="密码6~20位" runat="server" TextMode="Password" placeholder="请输入新密码"></asp:TextBox></div>
                                    <div class="col-sm-1">*</div>
                                    <div class="col-sm-4"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="密码不能为空，请输入密码！" ControlToValidate="new_pass"></asp:RequiredFieldValidator>
									</div>
									</div>	
			                        </div>
									<div class="form-group">
									<asp:TextBox class="form-control navbar-btn input-sm" ID="new_pass2" runat="server" TextMode="Password" placeholder="请再次输入新密码"></asp:TextBox>
									
                                    *
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ErrorMessage="两次输入密码不一致！" ControlToCompare="new_pass" ControlToValidate="new_pass2"></asp:CompareValidator>
									</div>
									
			                       <div class="error_message">
                                    <asp:Label ID="error" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label> 
                                </div>
								<div class="regist_button">
                                    <asp:ImageButton ID="ImageButton1" runat="server" 
                                        ImageUrl="~/image/submit.gif" onclick="ImageButton1_Click" />
                                </div>								
							</div>
						</div>						

</asp:Content>
