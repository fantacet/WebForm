<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Page1.aspx.cs" Inherits="Page1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <style>
       h2{
           color:blue;
       }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Page1</h2>
<p>主要內容出現區</p>
   <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="server">
    <script></script>
    &copy;
</asp:Content>

