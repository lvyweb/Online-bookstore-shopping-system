<%@ Page Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" Inherits="网上书城.showbooks" Title="无标题页" Codebehind="showbook.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <table class="table table-bordered table-hover table-striped table-condensed">
                    <tr>
                        <td>
                            书名
                        </td>
                        <td>
                            作者
                        </td>
                        <td>
                            出版社
                        </td>
                        <td>
                            价格
                        </td>
                    </tr>
         <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
            
                
                    <tr>
                        <td>
                           <a href="./book.aspx?book_id=<%# Eval("book_id") %>" > <%# Eval("title") %></a>
                        </td>
                        <td>
                            <%# Eval("author") %>
                        </td>
                        <td>
                            <%# Eval("version") %>
                        </td>
                        <td>
                            <%# Eval("price") %>
                        </td>
                    </tr>
                
            
        </ItemTemplate>
        </asp:Repeater>
</table>
    </div>
    <div >
    当前页码为：[<asp:Label ID="LabelPage" runat="server" Text="1"></asp:Label>]
    &nbsp;总页码为：[<asp:Label ID="LabelTotalPage" runat="server" Text="1"></asp:Label>]
    
        <asp:LinkButton ID="LinkButtonfirst" runat="server" 
            onclick="LinkButtonfirst_Click">首页</asp:LinkButton>  
        
        &nbsp;  
        
        <asp:LinkButton ID="LinkButtonprev" runat="server" 
            onclick="LinkButtonprev_Click">上一页</asp:LinkButton>
        
        &nbsp;
        
        <asp:LinkButton ID="LinkButtonnext" runat="server" 
            onclick="LinkButtonnext_Click">下一页</asp:LinkButton>
        
        &nbsp;
        
        <asp:LinkButton ID="LinkButtonlast" runat="server" 
            onclick="LinkButtonlast_Click">末页</asp:LinkButton>
    </div>
</asp:Content>
