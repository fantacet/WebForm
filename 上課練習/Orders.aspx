<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" InsertVisible="False" SortExpression="OrderID"></asp:BoundField>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID"></asp:BoundField>
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate"></asp:BoundField>
            <asp:BoundField DataField="ShipDate" HeaderText="ShipDate" SortExpression="ShipDate"></asp:BoundField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:storeConnectionString %>' SelectCommand="SELECT * FROM [Orders] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="OrderID" Name="OrderID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderDetailsID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="OrderDetailsID" HeaderText="OrderDetailsID" ReadOnly="True" InsertVisible="False" SortExpression="OrderDetailsID"></asp:BoundField>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID"></asp:BoundField>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"></asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>
            <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" SortExpression="UnitCost"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:storeConnectionString %>' SelectCommand="SELECT * FROM [OrderDetails] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="OrderID" Name="OrderID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

