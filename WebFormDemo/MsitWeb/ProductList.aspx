<%@ Page Title="" Language="C#" MasterPageFile="~/Msit.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="ProductList" %>

<%@ Register Src="~/CategoryNav.ascx" TagPrefix="uc1" TagName="CategoryNav" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .thumbnail{
            margin:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:HiddenField ID="HiddenTitle" Value="商品瀏覽" runat="server" />
   <div class="row">
       <div class="col-lg-3"> 
           <uc1:CategoryNav runat="server" ID="CategoryNav" />
         </div>
       <div class="col-lg-9">
           <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
           <asp:DataList ID="DataList1" RepeatDirection="Horizontal" RepeatColumns="3" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource2">
               <ItemTemplate>
                    <div class="thumbnail">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/ReadImage.ashx?ProductID=" + Eval("ProductID") %>' />
      <div class="caption">
        <h4><%# Eval("ModelName") %></h4>
        <p>特價：<%# Eval("UnitCost","{0:c0}") %></p>
        <p>
            <asp:HyperLink CssClass="btn btn-primary" ID="HyperLink2" runat="server" NavigateUrl='<%# "~/ProductDetails.aspx?ProductID=" + Eval("ProductID") %>'>詳細資料</asp:HyperLink>
        
             <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-default" NavigateUrl='<%# "AddToCart.aspx?ProductID=" + Eval("ProductID") %>'><span class="glyphicon glyphicon-shopping-cart"></span> 放入購物車</asp:HyperLink>
                         </p>
      </div>
    </div>
               </ItemTemplate>
           </asp:DataList>
           <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT [ProductID], [ModelNumber], [ModelName], [ProductImage], [UnitCost] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
               <SelectParameters>
                   <asp:QueryStringParameter QueryStringField="CategoryID" DefaultValue="1" Name="CategoryID" Type="Int32"></asp:QueryStringParameter>
               </SelectParameters>
           </asp:SqlDataSource>
       </div>
   </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

