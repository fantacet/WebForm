<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryNav.ascx.cs" Inherits="CategoryNav" %>
 <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <HeaderTemplate>
            <div class="list-group">
        </HeaderTemplate>
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="list-group-item" 
                 NavigateUrl='<%# "~/ProductList.aspx?CategoryID=" + Eval("CategoryID") %>'>
                          <%# Eval("CategoryName") %></asp:HyperLink>
        </ItemTemplate>
        <FooterTemplate></div></FooterTemplate>
    </asp:Repeater>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoreConnectionString %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>