<%@ Page Title="" Language="C#" MasterPageFile="~/Msit.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="OrderID" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            OrderID:
            <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel1" /><br />
            CustomerID:
            <asp:TextBox Text='<%# Bind("CustomerID") %>' runat="server" ID="CustomerIDTextBox" /><br />
            OrderDate:
            <asp:TextBox Text='<%# Bind("OrderDate") %>' runat="server" ID="OrderDateTextBox" /><br />
            ShipDate:
            <asp:TextBox Text='<%# Bind("ShipDate") %>' runat="server" ID="ShipDateTextBox" /><br />
            <asp:LinkButton runat="server" Text="更新" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="取消" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            CustomerID:
            <asp:TextBox Text='<%# Bind("CustomerID") %>' runat="server" ID="CustomerIDTextBox" /><br />
            OrderDate:
            <asp:TextBox Text='<%# Bind("OrderDate") %>' runat="server" ID="OrderDateTextBox" /><br />
            ShipDate:
            <asp:TextBox Text='<%# Bind("ShipDate") %>' runat="server" ID="ShipDateTextBox" /><br />
            <asp:LinkButton runat="server" Text="插入" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="取消" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            OrderID:
            <asp:Label Text='<%# Eval("OrderID") %>' runat="server" ID="OrderIDLabel" /><br />
            CustomerID:
            <asp:Label Text='<%# Bind("CustomerID") %>' runat="server" ID="CustomerIDLabel" /><br />
            OrderDate:
            <asp:Label Text='<%# Bind("OrderDate") %>' runat="server" ID="OrderDateLabel" /><br />
            ShipDate:
            <asp:Label Text='<%# Bind("ShipDate") %>' runat="server" ID="ShipDateLabel" /><br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT * FROM [Orders] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="OrderID" Name="OrderID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderDetailsID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="OrderDetailsID" HeaderText="OrderDetailsID" ReadOnly="True" InsertVisible="False" SortExpression="OrderDetailsID"></asp:BoundField>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID"></asp:BoundField>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"></asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity"></asp:BoundField>
            <asp:BoundField DataField="UnitCost" HeaderText="UnitCost" SortExpression="UnitCost"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:StoreConnectionString %>' SelectCommand="SELECT * FROM [OrderDetails] WHERE ([OrderID] = @OrderID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="OrderID" Name="OrderID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

