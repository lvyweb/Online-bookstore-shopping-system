<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.information" Title="无标题页" Codebehind="information.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
<center>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
        width="50%" EnableModelValidation="True" DataKeyNames="user_id">
        <EditItemTemplate>
           <table class="table table-striped ">
               <asp:Panel ID="Panel1" runat="server" Visible="False">
                   <tr>
                        <td>
                            编号：
                        </td>
                        <td>
                            <asp:Label ID="user_idLabel1" runat="server" Text='<%# Eval("user_id") %>' />
                        </td>
                    </tr>
               </asp:Panel>
                <tr>
                    <td>
                        用户名：
                    </td>
                    <td>
                       <asp:Label ID="usernameTextBox" ReadOnly="true" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        手机号：
                    </td>
                    <td>
                        <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        邮箱：
                    </td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                    <tr>
                    <td>
                        地址：
                    </td>
                    <td>
                       <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        邮政编码：
                    </td>
                    <td>
                        <asp:TextBox ID="postcodeTextBox" runat="server" Text='<%# Bind("postcode") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />		
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <ItemTemplate>
           <table class="table table-striped">
               <asp:Panel ID="Panel2" runat="server" Visible="False">
                    <tr>
                        <td>
                            编号：
                        </td>
                        <td>
                            <asp:Label ID="user_idLabel" runat="server" Text='<%# Eval("user_id") %>' />
                        </td>
                    </tr>
               </asp:Panel>
               
                <tr>
                    <td>
                        用户名：
                    </td>
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        手机号：
                    </td>
                    <td>
                        <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        邮箱：
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                    <tr>
                    <td>
                        地址：
                    </td>
                    <td>
                       <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        邮政编码：
                    </td>
                    <td>
                        <asp:Label ID="postcodeLabel" runat="server" Text='<%# Bind("postcode") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="EditButton" Width="30px" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="修改" />
					</td>
					<td>
				        <asp:LinkButton ID="LogoutButton" Width="50px" runat="server" CausesValidation="True" 
                onclick="LogoutButton_Click" Text="注销" />		
                    <a  href="change_password.aspx">修改密码</a>
					</td>
                </tr>
            </table>
        </ItemTemplate>
       
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [users] WHERE [user_id] = @user_id" 
        InsertCommand="INSERT INTO [users] ([username], [phone], [address], [email], [postcode]) VALUES (@username, @phone, @address, @email, @postcode)" 
        SelectCommand="SELECT [user_id], [username], [phone], [address], [email], [postcode] FROM [users] WHERE ([username] = @username)" 
        UpdateCommand="UPDATE [users] SET [username] = @username, [phone] = @phone, [address] = @address, [email] = @email, [postcode] = @postcode WHERE [user_id] = @user_id">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="null" Name="username" 
                SessionField="username" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="postcode" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="postcode" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</center>
</div>
</asp:Content>
