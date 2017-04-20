<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="Content2.aspx.cs" Inherits="Content2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>第二頁</h3>
<h3>
    <asp:Label ID="Label1" runat="server" Text="內容"></asp:Label>
    <asp:Button ID="Button1" runat="server" Text="Button" />
</h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

