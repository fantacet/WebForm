<%@ Page Title="" Language="C#" MasterPageFile="~/Msit.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
        <Columns>
            <asp:ImageField DataImageUrlField="ProductID" DataImageUrlFormatString="~/ReadImage.ashx?ProductID={0}" HeaderText="產品圖片">
                <ControlStyle Width="80px" />
            </asp:ImageField>
            <asp:BoundField DataField="ModelNumber" HeaderText="產品型號" SortExpression="ModelNumber"></asp:BoundField>
            <asp:BoundField DataField="ModelName" HeaderText="產品名稱" SortExpression="ModelName"></asp:BoundField>
            <asp:BoundField DataField="UnitCost" HeaderText="產品價格" SortExpression="UnitCost" DataFormatString="{0:c0}"></asp:BoundField>
            <asp:TemplateField HeaderText="數量" SortExpression="Quantity">               
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("ProductID") %>' />
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Quantity") %>' TextMode="Number" min="0" max="10" step="1"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="amount" HeaderText="小計" SortExpression="amount" DataFormatString="{0:c0}" ReadOnly="True"></asp:BoundField>
            <asp:TemplateField HeaderText="刪除">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div class="text-right">
         <asp:Button ID="Button1" runat="server" Text="修改" CssClass="btn btn-primary" OnClick="Button1_Click" />
        <asp:Button ID="ButtonCheckout" runat="server" Text="結帳" CssClass="btn btn-success" OnClick="ButtonCheckout_Click" />
            <asp:Label ID="LabelTotal" runat="server" Text="總計"></asp:Label>
    </div>
    
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="ShoppingCartList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter SessionField="CartID" Name="CartID" Type="String"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
    <script>
      //  console.log(location);
    </script>
</asp:Content>

