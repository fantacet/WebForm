<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="ProductList.aspx.cs" Inherits="ProductList" %>

<%@ Register Src="~/CategoryNav.ascx" TagPrefix="uc1" TagName="CategoryNav" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="PageTitle" runat="server" value="產品列表"/>
    <div class="list-group row">
        <div class="col-md-3">
            <uc1:CategoryNav runat="server" ID="CategoryNav" />
            </div>
        <div class="col-md-9">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

            <asp:DataList ID="DataList1" RepeatColumns="3" RepeatDirection="Horizontal" runat="server" DataKeyField="ProductID" DataSourceID="SqlDataSource1" OnLoad="DataList1_Load">
                <ItemTemplate>
                    <div class="thumbnail">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/PhotoReader.ashx?ProductID=" + Eval("ProductID") %>'/>
      <div class="caption">
        <h4><%# Eval("ModelName") %></h4>
        <p><%# Eval("UnitCost","{0:c0}") %></p>
        <p>
            
            <a href='<%# "ProductDetails.aspx?ProductID=" + Eval("ProductID") %>' role="button" >詳細資料</a>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "AddToCart.aspx?ProductID=" + Eval("ProductID") %>' class="btn btn-primary" >加入購物車</asp:HyperLink>
            
      </div>
    </div>

                    
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:storeConnectionString %>" SelectCommand="SELECT [ProductID], [ModelNumber], [ModelName], [ProductImage], [UnitCost] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="CategoryID" QueryStringField="CategoryID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
</div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

