<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.book" Title="无标题页" Codebehind="book.aspx.cs" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="container">
	<div class="row">
		<div class="row col-xs-12  col-sm-3 col-md-3 col-sm-offset-1 col-md-offset-1 book_img">
            <asp:Image ID="Image1" ImageUrl = "./image/nopicture.gif" class="carousel-inner img-responsive" runat="server" />
        </div>
		<div class="row col-xs-12 col-sm-7 col-md-7 col-xs-push-1 col-sm-push-0 col-md-offset-1 book_titlediv">
		
			
		<dl class="col-xs-12 dl-horizontal text-left">	
		<dd><div class="row col-xs-12 col-sm-12 col-md-12 book_name">
        <b>
          <asp:Label ID="title" runat="server" Text=''></asp:Label></b>		  
			</div></dd>
			<div class="book_price">
		<dt>价格:</dt> <dd><span>￥<asp:Label ID="price" runat="server" Text=''></asp:Label></span></dd>
			</div>
		<dt>ISBN号码:</dt><dd><asp:Label ID="ISBN" runat="server" Text=''></asp:Label></dd>
		<dt>作者:</dt><dd><asp:Label ID="author" runat="server" Text=''></asp:Label></dd>
		<dt>出版社:</dt><dd><asp:Label ID="version" runat="server" Text=''></asp:Label></dd>
		<dt>出版日期:</dt><dd><asp:Label ID="pubdate" runat="server" Text=''></asp:Label></dd>
		<dt>订购数量:</dt>
		<dd ><asp:TextBox ID="order_num" onkeyup="if(isNaN(value))execCommand('undo')" 
                    onafterpaste="if(isNaN(value))execCommand('undo')" runat="server" BorderColor="#754819" 
                BorderWidth="2px" Width="80px"></asp:TextBox>
			<span class="buyUpDown">
				<asp:ImageButton ID="up" CssClass="1textbox_up" style='margin-bottom:8px' BorderStyle="None"  runat="server" 
                ImageUrl="~/image/up.gif" />
					
				<asp:ImageButton ID="down" CssClass="1textbox_down" runat="server" 
                ImageUrl="~/image/down.gif" />
			</span><asp:ImageButton ID="ImageButton1" style="vertical-align: middle;" runat="server" 
                ImageUrl="~/image/shopping_car.gif" onclick="ImageButton1_Click" />
        <asp:Label ID="error" ForeColor="Red" runat="server" Text=""></asp:Label>
        
				<cc1:NumericUpDownExtender ID="TextBox1_NumericUpDownExtender" runat="server" 
                Enabled="True" Maximum="10000" 
                Minimum="0" RefValues="" ServiceDownMethod="" 
                ServiceDownPath="" ServiceUpMethod="" Tag=""  TargetButtonDownID="down" 
                TargetButtonUpID="up" TargetControlID="order_num" Width="80">
            </cc1:NumericUpDownExtender>&nbsp;<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="ImageButton1" />
                </Triggers>
            </asp:UpdatePanel>
        </dd>
		</dl>
		</div>
    </div>     
	<div class="row col-xs-11 col-md-11 col-lg-10 col-xs-offset-1 col-md-offset-1 bookintroduce">	  
        <div class="row text-left hd">    <strong>
                图书简介:</strong>
		</div>
        <div class="row text-left">    <article> <asp:Label ID="introduce" runat="server" Text=""></asp:Label></article>
		</div>
	</div>
</div>         
</asp:Content>
