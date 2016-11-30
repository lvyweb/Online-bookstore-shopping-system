<%@ Page Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" Inherits="网上书城.admin_list" Title="无标题页" Codebehind="admin_list.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
        DataKeyNames="admin_id" DataSourceID="SqlDataSource1" Width="618px">
        <PagerSettings FirstPageText="&amp;lt;&amp;lt;首页" 
            LastPageText="末页&amp;gt;&amp;gt;" NextPageText="下一页&amp;gt;" 
            PreviousPageText="&amp;lt;上一页" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Height="40px" 
            HorizontalAlign="Center" VerticalAlign="Middle" />
        <Columns>
            <asp:BoundField DataField="admin_id" HeaderText="序号" InsertVisible="False" 
                ReadOnly="True" SortExpression="admin_id" />
            <asp:BoundField DataField="admin_name" HeaderText="管理员名称" 
                SortExpression="admin_name" />
            <asp:BoundField DataField="admin_email" HeaderText="邮箱" 
                SortExpression="admin_email" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [admin] WHERE [admin_id] = @admin_id" 
        InsertCommand="INSERT INTO [admin] ([admin_name], [admin_email]) VALUES (@admin_name, @admin_email)" 
        SelectCommand="SELECT [admin_id], [admin_name], [admin_email] FROM [admin] ORDER BY [admin_id]" 
        UpdateCommand="UPDATE [admin] SET [admin_name] = @admin_name, [admin_email] = @admin_email WHERE [admin_id] = @admin_id">
        <DeleteParameters>
            <asp:Parameter Name="admin_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="admin_name" Type="String" />
            <asp:Parameter Name="admin_email" Type="String" />
            <asp:Parameter Name="admin_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="admin_name" Type="String" />
            <asp:Parameter Name="admin_email" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
