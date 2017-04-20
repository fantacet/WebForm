<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<%@ Register Src="~/CategoryNav.ascx" TagPrefix="uc1" TagName="CategoryNav" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="list-group row">
        <div class="col-md-3">
            <uc1:CategoryNav runat="server" ID="CategoryNav" />
            </div>
        <div class="col-md-9">
            <div class="col-md-12">
                <asp:Label  ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div  class="col-md-5">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/PhotoReader.ashx?ProductID=" + Eval("ProductID") %>'/>
                    </div>
                    <div class="col-md-7" >
                        <h2 class="label-success"><asp:Label ID="Label2" runat="server" Text='<%# Bind("ModelName") %>' /></h2>
                    </div>
                    <div  class="col-md-7">
                        <h3><asp:Label ID="Label3" runat="server" Text='<%# Bind("ModelNumber") %>' /></h3>
                    </div>
                    <div  class="col-md-7">
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Description") %>' />
                    </div>
                    
                    <div class="col-md-12">
                        <br />
                    <br />
                    <div  class="col-md-5">
                        <asp:Label ID="UnitCostLabel" runat="server" Text='<%# Eval("UnitCost","{0:c0}") %>' />
                        
                    </div>
                    <div  class="col-md-4">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "AddToCart.aspx?ProductID=" + Eval("ProductID") %>' class="btn btn-primary" >加入購物車</asp:HyperLink>
                    </div>
                    </div>
                   
                                        
                    

                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:storeConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] = @ProductID)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ProductID" QueryStringField="ProductID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        </div>
     
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

