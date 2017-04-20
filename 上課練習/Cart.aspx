<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Width="1089px">
        <Columns>
            <asp:TemplateField HeaderText="圖">
                <ItemTemplate>
                    <asp:Image Width="80px" ID="Image1" runat="server" ImageUrl='<%# "~/PhotoReader.ashx?ProductID=" + Eval("ProductID") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ModelName" HeaderText="品名" SortExpression="ModelName"></asp:BoundField>
            <asp:BoundField DataField="ModelNumber" HeaderText="型號" SortExpression="ModelNumber"></asp:BoundField>
            <asp:BoundField DataField="UnitCost" HeaderText="單價" SortExpression="UnitCost" DataFormatString="{0:c0}"></asp:BoundField>
            <asp:TemplateField HeaderText="數量" SortExpression="Quantity">
                
                <ItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Quantity") %>' TextMode="Number" min="0" max="10"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Amount" HeaderText="小計" SortExpression="Amount" ReadOnly="True" DataFormatString="{0:c0}"></asp:BoundField>
           
            <asp:TemplateField HeaderText="刪除">
                <ItemTemplate>
                    <asp:CheckBox  ID="CheckBox1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <div class="text-right">
        <asp:Button ID="Button1" runat="server" Text="修改" CssClass="btn btn-primary" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="結帳" CssClass="btn btn-success" OnClick="Button2_Click" />
        <asp:Label ID="Label1" runat="server" Text="Label">總計:</asp:Label>
    </div>
    
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:storeConnectionString %>' SelectCommand="Cart" SelectCommandType="StoredProcedure" DeleteCommand="Cart" DeleteCommandType="StoredProcedure" InsertCommand="Cart" InsertCommandType="StoredProcedure" UpdateCommand="Cart" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="CartID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CartID" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter SessionField="CartID" Name="CartID" Type="String"></asp:SessionParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CartID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

