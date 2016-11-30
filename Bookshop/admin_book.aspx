<%@ Page Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" Inherits="网上书城.admin_book" Title="无标题页" Codebehind="admin_book.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
        BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" CellSpacing="2" DataKeyNames="book_id" 
        DataSourceID="SqlDataSource1" Width="618px">
        
        <EditItemTemplate>
            <table style="width:610px; background:#FFDA96; border:solid 1px #93642C; border-radius:5px; margin:auto;" cellspacing="2" border="2px" cellpadding="2">
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        编号：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:Label ID="book_idLabel1" runat="server" Text='<%# Eval("book_id") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        ISBN：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:TextBox ID="ISBNTextBox" runat="server" Text='<%# Bind("ISBN") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        书名：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    </td>
                    <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        作者：
                    </td>
                    <td style="text-align:left; width:500px;">
                       <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        出版社：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:TextBox ID="versionTextBox" runat="server" Text='<%# Bind("version") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        出版日期：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:TextBox ID="pubdateTextBox" runat="server" Text='<%# Bind("pubdate") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        价格：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        书籍封面：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:TextBox ID="picnameTextBox" runat="server" Text='<%# Bind("picname") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        所属类型：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        图书简介：
                    </td>
                    <td style="text-align:center; width:500px;">
                        <asp:TextBox ID="introduTextBox" TextMode="MultiLine" Width="450px" Height="300px" runat="server" Text='<%# Bind("introdu") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <asp:LinkButton ID="UpdateButton" Width="50px" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
                        <asp:LinkButton ID="UpdateCancelButton" Width="50px" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        
        <ItemTemplate>
            <table style="width:610px; background:#FFDA96; border:solid 1px #93642C; border-radius:5px; margin:auto;" cellspacing="2" border="2px"  cellpadding="2">
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        编号：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:Label ID="book_idLabel" runat="server" Text='<%# Eval("book_id") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        ISBN：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:Label ID="ISBNLabel" runat="server" Text='<%# Bind("ISBN") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        书名：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                    </td>
                    <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        作者：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:Label ID="authorLabel" runat="server" Text='<%# Bind("author") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        出版社：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:Label ID="versionLabel" runat="server" Text='<%# Bind("version") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        出版日期：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:Label ID="pubdateLabel" runat="server" Text='<%# Bind("pubdate") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        价格：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        书籍封面：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:Label ID="picnameLabel" runat="server" Text='<%# Bind("picname") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        所属类型：
                    </td>
                    <td style="text-align:left; width:500px;">
                        <asp:Label ID="typeLabel" runat="server" Text='<%# Bind("type") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right; width:100px; padding-right:10px;">
                        图书简介：
                    </td>
                    <td style="text-align:left; width:500px; padding-left:20px;">
                        <asp:Label ID="introduLabel" Width="450px" runat="server" Text='<%# Bind("introdu") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <asp:LinkButton ID="EditButton" Width="50px" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="编辑" />
                        <asp:LinkButton ID="DeleteButton" Width="50px" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="删除" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="&amp;lt;&amp;lt;首页" 
            LastPageText="末页&amp;gt;&amp;gt;" NextPageText="下一页&amp;gt;" 
            PreviousPageText="&amp;lt;上一页" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <RowStyle ForeColor="#8C4510" />   
        <PagerStyle ForeColor="#8C4510" BackColor="#FFCC66" Font-Bold="true" HorizontalAlign="Center" />
        <HeaderStyle Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <div style="width:100%; text-align:center;
                 background:#A55129; border-radius:3px;
                 height:30px; line-height:30px; ">书籍管理</div>
        </HeaderTemplate>
        <EditRowStyle  Font-Bold="True" />
        
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [books] WHERE [book_id] = @book_id" 
        InsertCommand="INSERT INTO [books] ([ISBN], [title], [author], [version], [pubdate], [introdu], [price], [picname], [type]) VALUES (@ISBN, @title, @author, @version, @pubdate, @introdu, @price, @picname, @type)" 
        SelectCommand="SELECT * FROM [books] ORDER BY [book_id]" 
        UpdateCommand="UPDATE [books] SET [ISBN] = @ISBN, [title] = @title, [author] = @author, [version] = @version, [pubdate] = @pubdate, [introdu] = @introdu, [price] = @price, [picname] = @picname, [type] = @type WHERE [book_id] = @book_id">
        <DeleteParameters>
            <asp:Parameter Name="book_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="author" Type="String" />
            <asp:Parameter Name="version" Type="String" />
            <asp:Parameter Name="pubdate" Type="String" />
            <asp:Parameter Name="introdu" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="picname" Type="String" />
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="book_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="author" Type="String" />
            <asp:Parameter Name="version" Type="String" />
            <asp:Parameter Name="pubdate" Type="String" />
            <asp:Parameter Name="introdu" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="picname" Type="String" />
            <asp:Parameter Name="type" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
