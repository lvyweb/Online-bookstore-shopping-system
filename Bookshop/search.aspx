<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.search" Title="无标题页" Codebehind="search.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script>

function ListSpace(){
var x=document.getElementsByClassName("booktitle");
var title_max_height=x[0].offsetHeight;

for(var i=0;i<x.length-1;i++){
  if(x[i].offsetHeight < x[i+1].offsetHeight)
  title_max_height=x[i+1].offsetHeight;}

for(var i=0;i<x.length;i++){
var RowNum=title_max_height/x[i].offsetHeight
if(RowNum!=1)
{for(var j=RowNum;j>1;j--){x[i].innerHTML+="<p>&nbsp;</p>";}} 
}
}
</script>
      <div class="search "><!--书总量-->
            <asp:Label ID="Label1"  runat="server" Text=""></asp:Label>
            <div class=""><!--查找框-->
            <asp:DropDownList ID="DropDownList1"  runat="server">
                  <asp:ListItem Selected="True" Value="title">书名</asp:ListItem>
                  <asp:ListItem Value="author" >作者</asp:ListItem>
                  <asp:ListItem Value="type">类别</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="search_in"  CssClass="" Font-Size="18px"   ForeColor="#75592E" Width="220px" runat="server"></asp:TextBox>
        
            <asp:ImageButton ID="ImageButton1" CssClass="" runat="server"   ImageUrl="~/image/search_button.gif" onclick="ImageButton1_Click" />
            </div> 
      </div><!--search-->

      <div class="container"><!--搜索结果-->
    <asp:Repeater ID="DataList1"  runat="server">
            <ItemTemplate>

<div class="col-xs-12 col-sm-4 col-md-3 booklistDivOut"><!--普通结果--> 
      <div class ="booklistDivIn">  
      <div class="col-xs-5 col-sm-12"><a href="book.aspx?book_id=<%# Eval("book_id") %>" ><img alt="<%# Eval("title") %>" height="200px" class="xsimg"   src="./image/books/<%# Eval("picname") %>" /></a></div>
      <div class="col-xs-7 col-sm-12">
      <p><div class="booktitle"><a href="book.aspx?book_id=<%# Eval("book_id") %>" ><%# Eval("title") %></div></a></p>
      <p><%# Eval("author") %></p>
      <p><div class="price">¥ <%# Eval("price") %></div></p>
      </div>
      </div>
</div>
            </ItemTemplate>
            </asp:Repeater>
      <asp:Panel ID="Panel1" class="container" runat="server">
            <asp:Repeater ID="DataList2"  runat="server">
            <ItemTemplate>

<div class="col-xs-12 col-sm-4 col-md-3 booklistDivOut"><!--普通结果--> 
      <div class ="booklistDivIn">  
      <div class="col-xs-5 col-sm-12"><a href="book.aspx?book_id=<%# Eval("book_id") %>" ><img alt="<%# Eval("title") %>" height="200px" class="xsimg"   src="./image/books/<%# Eval("picname") %>" /></a></div>
      <div class="col-xs-7 col-sm-12">
      <p><div class="booktitle"><a href="book.aspx?book_id=<%# Eval("book_id") %>" ><%# Eval("title") %></div></a></p>
      <p><%# Eval("author") %></p>
      <p><div class="price">¥ <%# Eval("price") %></div></p>
      </div>
      </div>
</div>
            </ItemTemplate>
        </asp:Repeater>
        </asp:Panel>
      </div><!--搜索结果-->

<div class="row pagesearch col-xs-12 col-sm-12">
    <asp:Panel ID="page_panel" runat="server">
        <div class="">
        当前页码为：[<asp:Label ID="LabelPage" runat="server" Text="1"></asp:Label>] &nbsp;总页码为：[<asp:Label ID="LabelTotalPage" runat="server" Text="1"></asp:Label>
        ]
        </div>
        <div class="">    
        <asp:LinkButton ID="LinkButtonfirst" ForeColor="#F8D18C" runat="server" 
            onclick="LinkButtonfirst_Click" OnClientClick="ListSpace()">首页</asp:LinkButton>  
        
        &nbsp;  
        
        <asp:LinkButton ID="LinkButtonprev" ForeColor="#F8D18C" runat="server" 
            onclick="LinkButtonprev_Click" OnClientClick="ListSpace()">上一页</asp:LinkButton>
        
        &nbsp;
        
        <asp:LinkButton ID="LinkButtonnext" ForeColor="#F8D18C" runat="server" 
            onclick="LinkButtonnext_Click" OnClientClick="ListSpace()">下一页</asp:LinkButton>
        
        &nbsp;
        
        <asp:LinkButton ID="LinkButtonlast" ForeColor="#F8D18C" runat="server" 
            onclick="LinkButtonlast_Click" Text="末页" OnClientClick="ListSpace()">末页</asp:LinkButton>
        </div>
        
    </asp:Panel>
</div>
<script>
ListSpace();
</script>


</asp:Content>

