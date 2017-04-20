<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CategoryNav.ascx.cs" Inherits="CategoryNav" %>
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
        <ItemTemplate>
            <asp:HyperLink CssClass="list-group-item list-group-item-success" ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ProductList.aspx?CategoryID=" + Eval("CategoryID") %>'><%# Eval("CategoryName") %></asp:HyperLink>
            
        </ItemTemplate>
        <AlternatingItemTemplate>
            <asp:HyperLink CssClass="list-group-item list-group-item-danger" ID="HyperLink1" runat="server" NavigateUrl='<%# "~/ProductList.aspx?CategoryID=" + Eval("CategoryID") %>'><%# Eval("CategoryName") %></asp:HyperLink>
            
        </AlternatingItemTemplate>
        
    </asp:Repeater>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:storeConnectionString %>" SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>