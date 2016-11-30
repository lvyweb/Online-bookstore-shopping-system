<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.userlogin" Title="无标题页" Codebehind="user_regist.aspx.cs" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="col-xs-12 col-sm-8 col-sm-offset-3 form-box user_regist">
                        <div class="form-top">
                        		<div class="form-top-left">
                        			<h3>注册</h3>
                            		<p>请输入以下资料</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                        </div>
					<div class="form-bottom user_regist_form">
						<table>
                            <tr>
                                <td>
									<asp:TextBox class="form-control navbar-btn input-sm" ID="username" ToolTip="用户名3~20个字符" runat="server" placeholder="请输入用户名"></asp:TextBox>
                                </td>
								<td>
								&nbsp;<div class="hidden-xs"><span>*用户名3~20个字符</span></div>
								<asp:CustomValidator ID="CustomValidator1" runat="server" 
                                         ControlToValidate="username" ErrorMessage="用户名已经被使用，请重新输入！"
                                          Display="Dynamic" onservervalidate="CustomValidator1_ServerValidate"  ></asp:CustomValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ErrorMessage="用户名不能为空！" ControlToValidate="username"></asp:RequiredFieldValidator>
								
                                    
                                </td>
                            </tr>
							<tr>
							<td class="hidden-sm hidden-md hidden-lg">
							用户名3~20个字符
							</td>
							</tr>
                            <tr>
                                
                                <td>
                                    <asp:TextBox class="form-control navbar-btn input-sm" ID="password" ToolTip="密码6~20位" runat="server" TextMode="Password" placeholder="请输入密码"></asp:TextBox>
								</td>
								<td>
                                    *
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ErrorMessage="密码不能为空，请输入密码！" ControlToValidate="password"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox class="form-control navbar-btn input-sm" ID="password2" runat="server" TextMode="Password" placeholder="请再次输入密码"></asp:TextBox>
									
                                </td>
								<td>
									*
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ErrorMessage="两次输入密码不一致！" ControlToCompare="password" ControlToValidate="password2"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox class="form-control navbar-btn input-sm" ID="phone" runat="server" placeholder="请输入手机号码"></asp:TextBox>
									
                                </td>
								<td>
								*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ErrorMessage="手机不能为空！" ControlToValidate="phone"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox class="form-control navbar-btn input-sm" ID="email" type="email" runat="server" placeholder="请输入邮箱"></asp:TextBox>
                                </td>
								<td>
								*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ErrorMessage="邮箱不能为空！" ControlToValidate="email"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                
                                <td>
                                    <asp:TextBox class="form-control navbar-btn input-sm" ID="address" runat="server" placeholder="请输入收货地址"></asp:TextBox>
                                </td>
								<td>
									*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ErrorMessage="地址不能为空！" ControlToValidate="address"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                
                                <td>
                                    <asp:TextBox class="form-control navbar-btn input-sm" ID="postcode" runat="server" placeholder="请输入邮政编码"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                <div class="error_message">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text="带*为必填项"></asp:Label> 
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <div>
                                    <asp:LinkButton ID="ImageButton1" runat="server" Text="提交"
                                        onclick="ImageButton1_Click" />
                                </div>
								</td>
								<td>
                                <div>
                                    <asp:LinkButton ID="ImageButton2" runat="server" Text="取消"
                                        onclick="ImageButton2_Click" />
                                </div>
                                </td>
                            </tr>
                        </table>
					</div>
              </div> 
</asp:Content>
