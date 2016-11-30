<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.shopping_car" Title="无标题页" Codebehind="shopping_car.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
    <center>
    <div class="shopping_car_banner">
        <asp:Label ID="username" runat="server" Text=""></asp:Label>
    </div>
    <asp:Repeater ID="DataList1" runat="server" >
      
        <ItemTemplate>
		<div class="col-xs-12 col-sm-4 col-md-3">   
			<table  class="table table-bordered">
                
				
				<tr>
                    <td colspan="2" style=" text-align:center; padding-bottom:15px;">
                        <a href="./book.aspx?book_id=<%# Eval("book_id") %>"><asp:Label Width="220px" Height="2em"  ID="book_titleLabel" runat="server" Text='<%# Eval("book_title") %>' /></a>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-left:10px;">
                        订购日期：
                    </td>
                    <td style="width:160px; text-align:left;">
                        <asp:Label ID="order_dateLabel" runat="server" Text='<%# Eval("order_date") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-left:10px;">
                        我的地址：
                    </td>
                    <td style="width:160px; text-align:left;">
                        <asp:Label ID="adressLabel" runat="server" Text='<%# Eval("adress") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-left:10px;">
                        总金额：
                    </td>
                    <td style="width:160px; text-align:left;">
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-left:10px;">
                        订购数量：
                    </td>
                    <td style="width:160px; text-align:left;">
                        <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-left:10px;">
                        订单状态：
                    </td>
                    <td style="width:160px; text-align:left;">
                        <asp:Label ID="statusLabel" ForeColor="Red" runat="server" Text='<%# get_status(Eval("status"))  %>' />
                    </td>
                </tr>
            </table>
		</div>
        </ItemTemplate>
    </asp:Repeater>  
    </center>
<div class="row pagesearch col-xs-12 col-sm-12">
        当前页码为：[<asp:Label ID="LabelPage" runat="server" Text="1"></asp:Label>] &nbsp;总页码为：[<asp:Label ID="LabelTotalPage" runat="server" Text="1"></asp:Label>
        ]
    
        <asp:LinkButton ID="LinkButtonfirst" ForeColor="#F8D18C" runat="server" 
            onclick="LinkButtonfirst_Click">首页</asp:LinkButton>  
        
        &nbsp;  
        
        <asp:LinkButton ID="LinkButtonprev" ForeColor="#F8D18C" runat="server" 
            onclick="LinkButtonprev_Click">上一页</asp:LinkButton>
        
        &nbsp;
        
        <asp:LinkButton ID="LinkButtonnext" ForeColor="#F8D18C" runat="server" 
            onclick="LinkButtonnext_Click">下一页</asp:LinkButton>
        
        &nbsp;
        
        <asp:LinkButton ID="LinkButtonlast" ForeColor="#F8D18C" runat="server" 
            onclick="LinkButtonlast_Click" Text="末页">末页</asp:LinkButton>
    </div>
</div>
</asp:Content>
