<%@ Page Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" Inherits="网上书城.admin_user" Title="无标题页" Codebehind="admin_user.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" Width="618px" runat="server" AllowPaging="True" 
    AutoGenerateColumns="False" CellPadding="4" DataKeyNames="user_id" 
    DataSourceID="SqlDataSource1"  BorderColor="#990000" ForeColor="#333333"
     HorizontalAlign="Center" OnDataBound="databound">
        <PagerSettings FirstPageText="&amp;lt;&amp;lt;首页&amp;nbsp;&amp;nbsp;" 
            LastPageText="尾页&amp;gt;&amp;gt;" Mode="NextPreviousFirstLast" 
            NextPageText="下一页&amp;gt;&amp;nbsp;&amp;nbsp;" 
            PreviousPageText="&amp;lt;上一页&amp;nbsp;&amp;nbsp;" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" Height="43px" Width="77px" 
            Wrap="True" HorizontalAlign="Center" VerticalAlign="Middle" />
        <Columns>
            <asp:BoundField DataField="user_id" HeaderText="id"  InsertVisible="False" 
                ReadOnly="True" SortExpression="user_id" />
            <asp:BoundField DataField="username" HeaderText="用户" 
                SortExpression="username" />
            <asp:BoundField DataField="phone" HeaderText="手机" SortExpression="phone" />
            <asp:BoundField DataField="email" HeaderText="邮箱" SortExpression="email" />
            <asp:BoundField DataField="address" HeaderText="地址" 
                SortExpression="address" />
            <asp:BoundField DataField="postcode" HeaderText="邮编" 
                SortExpression="postcode" />
            <asp:CommandField ShowEditButton="True" ButtonType="Button" >
                <ControlStyle Width="50px" />
            </asp:CommandField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66"  HorizontalAlign="Center" ForeColor="#333333"
            Height="40px" />
        <SelectedRowStyle BackColor="#FFCC00" Font-Bold="True" ForeColor="Navy" />
        <HeaderStyle BackColor="#990000"  BorderColor="#FFFBD6" Font-Bold="True" ForeColor="White" 
            Height="30px" Wrap="False" />
        <EditRowStyle Width="619px" Wrap="False" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <div style="background:#FFCC66; padding:5px; position:relative; top:-1px; border:solid 1px #990000; color:#333333">
        <asp:Label ID="Label1" Width="70px" runat="server" Text=""></asp:Label>
        <asp:Label ID="Label2" Width="70px" runat="server" Text=""></asp:Label>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    DeleteCommand="DELETE FROM [users] WHERE [user_id] = @user_id" 
    InsertCommand="INSERT INTO [users] ([username], [phone], [email], [address], [postcode]) VALUES (@username, @phone, @email, @address, @postcode)" 
    SelectCommand="SELECT [user_id], [username], [phone], [email], [address], [postcode] FROM [users] ORDER BY [user_id], [username]" 
    UpdateCommand="UPDATE [users] SET [username] = @username, [phone] = @phone, [email] = @email, [address] = @address, [postcode] = @postcode WHERE [user_id] = @user_id">
        <DeleteParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="postcode" Type="String" />
            <asp:Parameter Name="user_id" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:Label ID="result" runat="server" Text=""></asp:Label>
</asp:Content>
