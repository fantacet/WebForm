<%@ Page Title="" Language="C#" MasterPageFile="~/Msit.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<%@ Register Src="~/CategoryNav.ascx" TagPrefix="uc1" TagName="CategoryNav" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:HiddenField ID="HiddenTitle" Value="商品詳細資料" runat="server" />
<div class="row">
       <div class="col-lg-3"> 
           <uc1:CategoryNav runat="server" ID="CategoryNav" />
       </div>
       <div class="col-lg-9">
           <asp:Label ID="Label1" runat="server"></asp:Label>
           <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
                  <ItemTemplate>
                      <div class="row">
                           <div class="col-sm-12">
                               <h3><%# Eval("ModelName") %>(<%# Eval("ModelNumber") %>)</h3>
                           </div>
                          <div class="col-sm-4">
                              <asp:Image CssClass="img-thumbnail" ID="Image1" runat="server" ImageUrl='<%# "~/ReadImage.ashx?ProductID=" + Eval("ProductID")  %>'/>
                          </div>
                          <div class="col-sm-8">
                                <p><%# Eval("Description") %></p>
                              <p>特價：<%# Eval("UnitCost","{0:c0}") %></p>
                              <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-default" NavigateUrl='<%# "AddToCart.aspx?ProductID=" + Eval("ProductID") %>'><span class="glyphicon glyphicon-shopping-cart"></span> 放入購物車</asp:HyperLink>
                         
                          </div>
                      </div>
               </ItemTemplate>
           </asp:FormView>
           <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] = @ProductID)">
               <SelectParameters>
                   <asp:QueryStringParameter QueryStringField="ProductID" DefaultValue="1" Name="ProductID" Type="Int32"></asp:QueryStringParameter>
               </SelectParameters>
           </asp:SqlDataSource>
       </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

