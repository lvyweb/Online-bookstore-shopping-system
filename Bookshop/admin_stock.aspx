<%@ Page Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" Inherits="网上书城.admin_stock" Title="无标题页" Codebehind="admin_stock.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="stock_id" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Width="600px">
        <RowStyle HorizontalAlign="Center" BackColor="#FFFBD6" ForeColor="#333333" 
            Height="40px" />
        <Columns>
            <asp:TemplateField HeaderText="编号" InsertVisible="False" 
                SortExpression="stock_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("stock_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("stock_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ISBN" SortExpression="isbn">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("isbn") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("isbn") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="库存量" SortExpression="stock_num">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("stock_num") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("stock_num") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="价格" SortExpression="price">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="日期" SortExpression="logdate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("logdate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("logdate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="更新" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="取消" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="编辑" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button3" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="删除" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="&amp;lt;&amp;lt;首页&amp;nbsp;&amp;nbsp;" 
            LastPageText="尾页&amp;gt;&amp;gt;" Mode="NextPreviousFirstLast" 
            NextPageText="下一页&amp;gt;&amp;nbsp;&amp;nbsp;" 
            PreviousPageText="&amp;lt;上一页&amp;nbsp;&amp;nbsp;" />
        <PagerStyle BackColor="#FF9900" BorderColor="#990000" BorderStyle="Solid" 
            BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle" />
        <SelectedRowStyle BackColor="#FFCC66" ForeColor="Navy" Font-Bold="True" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [stock] WHERE [stock_id] = @stock_id" 
        InsertCommand="INSERT INTO [stock] ([isbn], [stock_num], [price], [logdate]) VALUES (@isbn, @stock_num, @price, @logdate)" 
        SelectCommand="SELECT * FROM [stock] ORDER BY [stock_num], [stock_id] DESC" 
        UpdateCommand="UPDATE [stock] SET [isbn] = @isbn, [stock_num] = @stock_num, [price] = @price, [logdate] = @logdate WHERE [stock_id] = @stock_id">
        <DeleteParameters>
            <asp:Parameter Name="stock_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="isbn" Type="String" />
            <asp:Parameter Name="stock_num" Type="Int32" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="logdate" Type="String" />
            <asp:Parameter Name="stock_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="isbn" Type="String" />
            <asp:Parameter Name="stock_num" Type="Int32" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="logdate" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
