<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.change_password" Title="无标题页" Codebehind="change_password.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate></ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="ImageButton1" />
    </Triggers>
    </asp:UpdatePanel>
						<div class="col-xs-12 col-sm-8 col-sm-offset-3 form-box change_password_div">
							<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>更改密码</h3>
                            		<p>请输入要更改的密码</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
							<div class="form-bottom change_password_form">
			                    <table>
			                    <tr>			
			                    <td>
										<label class="sr-only" for="form-username">Username</label>		
										<asp:TextBox class="form-control navbar-btn input-sm" runat="server" ID="old_pass" TextMode="Password" runat="server" placeholder="请输入原密码"></asp:TextBox>
								</td>
								<td>		
										<asp:Label ID="oldlabel" runat="server" Text=""></asp:Label>
								</td>	
								</tr>
								<tr>  
								<td>	
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<asp:TextBox class="form-control navbar-btn input-sm" ID="new_pass" ToolTip="密码6~20位" runat="server" TextMode="Password" placeholder="请输入新密码"></asp:TextBox>
								</td>
								<td>
										*
										<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="密码不能为空!" ControlToValidate="new_pass"></asp:RequiredFieldValidator>
								</td>
								</tr>
								<tr>  
								<td>	
									<asp:TextBox class="form-control navbar-btn input-sm" ID="new_pass2" runat="server" TextMode="Password" placeholder="请再次输入新密码"></asp:TextBox>
								</td>
								<td style="word-break:keep-all;white-space:nowrap;">	
                                    *
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ErrorMessage="两次输入密码不一致！" ControlToCompare="new_pass" ControlToValidate="new_pass2"></asp:CompareValidator>
								</td>
								</tr> 
								<tr>
								<td>
								<div>
								<asp:LinkButton ID="ImageButton1" runat="server" 
                                        Text="提交" onclick="ImageButton1_Click" />
								</div>
								<div class="error_message">
                                <asp:Label ID="error" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label> 
                                </div>
								
								</td>
								</tr>
								</table>	
			                      
								
                                    
                                								
							</div>
						</div>						

</asp:Content>
