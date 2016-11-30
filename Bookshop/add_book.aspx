<%@ Page Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" Inherits="网上书城.add_book2" Title="无标题页" Codebehind="add_book.aspx.cs" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellspacing="0">
            <tr>
                <td style="text-align:right;padding-right:10px;" class="style1">书名：</td>
                <td class="style2">
                    <asp:TextBox ID="title" runat="server" CssClass="date_box" Width="200px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="书名不能为空！" ControlToValidate="title"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="height:50px;">
                <td style="width:150px; text-align:right;padding-right:10px;">ISBN：</td>
                <td style="width:468px;">
                    <asp:TextBox ID="ISBN" runat="server" CssClass="date_box" Width="200px"></asp:TextBox>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ControlToValidate="ISBN" Display="Dynamic" ErrorMessage="ISBN不能重复！请重新输入！" 
                        onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="ISBN不能为空！" ControlToValidate="ISBN"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="height:50px;">
                <td style="width:150px; text-align:right;padding-right:10px;">作者：</td>
                <td style="width:468px;">
                    <asp:TextBox ID="author" runat="server" CssClass="date_box" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="作者不能为空！" ControlToValidate="author"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="height:50px;">
                <td style="width:150px; text-align:right;padding-right:10px;">出版社：</td>
                <td style="width:468px;">
                    <asp:TextBox ID="version" runat="server" CssClass="date_box" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr style="height:50px;">
                <td style="width:150px; text-align:right;padding-right:10px;">出版时间：</td>
                <td style="width:468px;position:relative;">
                    <asp:TextBox ID="pubdate" CssClass="date_box" Width="200px" Height="30px" 
                        runat="server" style="top: 0px; left: 0px"></asp:TextBox>
                    <cc1:CalendarExtender ID="pubdate_CalendarExtender" runat="server"
                    Format="yyyy年MM月dd日" PopupPosition="Right" PopupButtonID="calender" CssClass="cal_Theme1"
                        Enabled="True" TargetControlID="pubdate">
                    </cc1:CalendarExtender>
                    <asp:ImageButton ID="calender" CssClass="calender" runat="server" ImageUrl="~/image/cal.gif" />
                </td>
            </tr>
            <tr style="height:50px;">
                <td style="width:150px; text-align:right;padding-right:10px;">价格：</td>
                <td style="width:468px;">
                    <asp:TextBox ID="price" CssClass="date_box"  onkeyup="if(isNaN(value))execCommand('undo')" 
                    onafterpaste="if(isNaN(value))execCommand('undo')" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="图书价格不能为空！" ControlToValidate="price"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="height:50px;">
                <td style="width:150px; text-align:right;padding-right:10px;">书籍类型：</td>
                <td style="width:468px;">
                    <asp:DropDownList CssClass="date_box" ID="type" runat="server">
                        <asp:ListItem Selected="True">教育</asp:ListItem>
                        <asp:ListItem>IT计算机</asp:ListItem>
                        <asp:ListItem>励志</asp:ListItem>
                        <asp:ListItem>小说</asp:ListItem>
                        <asp:ListItem>散文集</asp:ListItem>
                        <asp:ListItem>历史</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="书籍类型不能为空！" ControlToValidate="type"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="height:50px;">
                <td style="width:150px; text-align:right;padding-right:10px;">库存：</td>
                <td style="width:468px;">
                    <asp:TextBox ID="stock_num" CssClass="date_box" onkeyup="if(isNaN(value))execCommand('undo')" 
                    onafterpaste="if(isNaN(value))execCommand('undo')" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="请输入库存量！" ControlToValidate="stock_num"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:150px; text-align:right;padding-right:10px;">书籍简介：</td>
                <td style="width:468px;">
                    <asp:TextBox ID="introduce" CssClass="date_box" runat="server" Width="418px" Height="200px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:150px; text-align:right; height:50px; padding-right:10px;">
                    图片：
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="color:Red; height:30px; text-align:center;">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;height:50px;">
                    
                    <asp:ImageButton ID="submit" runat="server" 
                        ImageUrl="~/image/submit.gif" onclick="submit_Click" />
                </td>
            </tr>
        </table>
</asp:Content>
