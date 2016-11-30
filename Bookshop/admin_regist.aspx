<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.admin_regist1" Title="无标题页" Codebehind="admin_regist.aspx.cs" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <div class="regist">
            <table>
            <tr>
                <td class="table_left">管理员名：</td>
                <td class="table_right">
                    <asp:TextBox ID="ad_name" runat="server"></asp:TextBox>
                    *
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="管理员名不能为空！" ControlToValidate="ad_name"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ErrorMessage="已经存在该管理员" ControlToValidate="ad_name" 
                        onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="table_left">密 码：</td>
                <td class="table_right">
                    <asp:TextBox ID="ad_pass" runat="server" TextMode="Password"></asp:TextBox>
                    *
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="密码不能为空" ControlToValidate="ad_pass"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="table_left">确认密码：</td>
                <td class="table_right">
                    <asp:TextBox ID="ad_pass2" runat="server" TextMode="Password"></asp:TextBox>
                    *
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="两次输入密码不一致！" ControlToValidate="ad_pass2" ControlToCompare="ad_pass"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="table_left">邮箱：</td>
                <td class="table_right">
                    <asp:TextBox ID="ad_email" runat="server"></asp:TextBox>
                    *
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="邮箱不能为空！" ControlToValidate="ad_email"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="table_left">口令：</td>
                <td class="table_right">
                    <asp:TextBox ID="kouling" runat="server" TextMode="Password"></asp:TextBox>
                    * 请输入正确的口令！</td>
            </tr>
            <tr>
                <td colspan="2">
                <div class="error_message">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
                        ForeColor="Red" Text="带*为必填项"></asp:Label>
                </div>
                </td>
            </tr>
            <tr>
                <td colspan="2"> 
                    <div class="regist_button" style=" padding-left:70px;">
                    
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/image/regist_button.gif" onclick="ImageButton1_Click" />
                    
                    </div>
                </td>
            </tr> 
        </table>
     </div>
</asp:Content>
