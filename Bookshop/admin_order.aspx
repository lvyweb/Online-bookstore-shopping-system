<%@ Page Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" Inherits="网上书城.admin_order" Title="无标题页" Codebehind="admin_order.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="order_id" 
        DataSourceID="SqlDataSource1" BorderColor="#990000" ForeColor="#333333" Width="618px" 
        OnDataBound="databound" AllowSorting="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" >
        <PagerSettings FirstPageText="&amp;lt;&amp;lt;首页&amp;nbsp;&amp;nbsp;" 
            LastPageText="尾页&amp;gt;&amp;gt;" Mode="NextPreviousFirstLast" 
            NextPageText="下一页&amp;gt;&amp;nbsp;&amp;nbsp;" 
            PreviousPageText="&amp;lt;上一页&amp;nbsp;&amp;nbsp;" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Height="40px" 
            VerticalAlign="Middle" Wrap="False" />
        <Columns>
            <asp:TemplateField HeaderText="订单号" InsertVisible="False" 
                SortExpression="order_id">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("order_id") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("order_id") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="订购用户" SortExpression="username">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="订购日期" SortExpression="order_date">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("order_date") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("order_date") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="书籍名称" SortExpression="book_title">
                <ItemTemplate>
                   <a target="_parent" href="book.aspx?book_id=<%# Eval("book_id") %>" ><asp:Label ID="Label5" runat="server" Text='<%# Bind("book_title") %>'></asp:Label></a>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("book_title") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="订购数量" SortExpression="quantity">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="收货地址" SortExpression="adress">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("adress") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("adress") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="订单状态" SortExpression="status">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# get_status(Eval("status")) %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="总金额" SortExpression="price">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="处理订单" ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("order_id") %>' onclick="Button1_Click" Text="处理" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="编辑" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="Button4" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="更新" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button3" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="删除" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#000" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000" BorderColor="#FFFBD6" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
        
    </asp:GridView>
    <div style="background:#FFCC66; padding:5px; position:relative; bottom:0px; color:#333333; left: 0px; width: 205px; height: 19px; margin-top: 0px;">
        <asp:Label ID="Label1" Width="70px" runat="server" Text=""></asp:Label>
        <asp:Label ID="Label2" Width="70px" runat="server" Text=""></asp:Label>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        OldValuesParameterFormatString="original_{0}" 
        
        
        SelectCommand="SELECT [order_id], [username], [order_date], [quantity], [adress], [status], [price], [book_title], [book_id] FROM [orders] ORDER BY [order_id] DESC, [book_id] DESC" 
        DeleteCommand="DELETE FROM [orders] WHERE [order_id] = @original_order_id" 
        InsertCommand="INSERT INTO [orders] ([username], [order_date], [quantity], [adress], [status], [price], [book_title], [book_id]) VALUES (@username, @order_date, @quantity, @adress, @status, @price, @book_title, @book_id)" 
        
        UpdateCommand="UPDATE [orders] SET [username] = @username, [order_date] = @order_date, [quantity] = @quantity, [adress] = @adress, [status] = @status, [price] = @price, [book_title] = @book_title, [book_id] = @book_id WHERE [order_id] = @original_order_id">
        <DeleteParameters>
            <asp:Parameter Name="original_order_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="order_date" Type="String" />
            <asp:Parameter Name="quantity" Type="Int32" />
            <asp:Parameter Name="adress" Type="String" />
            <asp:Parameter Name="status" Type="Byte" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="book_title" Type="String" />
            <asp:Parameter Name="book_id" Type="Int32" />
            <asp:Parameter Name="original_order_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="order_date" Type="String" />
            <asp:Parameter Name="quantity" Type="Int32" />
            <asp:Parameter Name="adress" Type="String" />
            <asp:Parameter Name="status" Type="Byte" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="book_title" Type="String" />
            <asp:Parameter Name="book_id" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
