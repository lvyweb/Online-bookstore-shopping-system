<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeFile="book.aspx.cs" Inherits="网上书城.book" Title="无标题页" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  style="width:820px; padding:5px;">
    
    <table style="width:600px; background:#FFDA96; border:solid 1px #93642C; border-radius:5px; margin:auto;" cellspacing="2" border="2px" cellpadding="2">
      <tr>
        <td rowspan="7" style="text-align:center; width:200px;" >
            <asp:Image ID="Image1" ImageUrl = "./image/nopicture.gif" runat="server" />
        </td>
        <td style=" text-align:left"> 图书名称:
          <asp:Label ID="title" runat="server" Text=''></asp:Label></td>
      </tr>
      <tr>
        <td style=" text-align:left"> 价格: ￥<asp:Label ID="price" runat="server" Text=''></asp:Label></td>
      </tr>
      <tr>
        <td style=" text-align:left">ISBN号码:
            <asp:Label ID="ISBN" runat="server" Text=''></asp:Label></td>
      </tr>
      <tr>
        <td style="text-align:left">作者:
            <asp:Label ID="author" runat="server" Text=''></asp:Label></td>
      </tr>
      <tr>
        <td style=" text-align:left">出版社:
           <asp:Label ID="version" runat="server" Text=''></asp:Label></td>
      </tr>
      <tr>
        <td style="text-align:left">出版日期:
            <asp:Label ID="pubdate" runat="server" Text=''></asp:Label></td>
      </tr>
      <tr>
        <td style="text-align:left; line-height:30px; position:relative;">
            订购数量：<asp:TextBox ID="order_num" onkeyup="if(isNaN(value))execCommand('undo')" 
                    onafterpaste="if(isNaN(value))execCommand('undo')" runat="server" BorderColor="#754819" 
                BorderWidth="2px" Width="80px"></asp:TextBox>
            <asp:ImageButton ID="up" CssClass="textbox_up" BorderStyle="None"  runat="server" 
                ImageUrl="~/image/up.gif" />
            <asp:ImageButton ID="down" CssClass="textbox_down" runat="server" 
                ImageUrl="~/image/down.gif" />
            <cc1:NumericUpDownExtender ID="TextBox1_NumericUpDownExtender" runat="server" 
                Enabled="True" Maximum="10000" 
                Minimum="0" RefValues="" ServiceDownMethod="" 
                ServiceDownPath="" ServiceUpMethod="" Tag=""  TargetButtonDownID="down" 
                TargetButtonUpID="up" TargetControlID="order_num" Width="80">
            </cc1:NumericUpDownExtender>&nbsp;
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="ImageButton1" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/image/shopping_car.gif" onclick="ImageButton1_Click" />
            <asp:Label ID="error" ForeColor="Red" runat="server" Text=""></asp:Label>
          </td>
      </tr>
      <tr>
        <td colspan="2" style=" text-align:left;padding:10px;">
            <div style=" width:600px; overflow:hidden; float:left; line-height:25px"><strong>
                图书简介:</strong>
            <article> <asp:Label ID="introduce" runat="server" Text=""></asp:Label></article>
         </div>
        </td>
      </tr>
    </table>
    </div>
</asp:Content>
