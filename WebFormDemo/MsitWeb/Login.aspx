<%@ Page Title="" Language="C#" MasterPageFile="~/Msit.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
          body {
    padding-top: 15px;
    font-size: 12px
  }
  .main {
    max-width: 320px;
    margin: 0 auto;
  }
  .login-or {
    position: relative;
    font-size: 18px;
    color: #aaa;
    margin-top: 10px;
            margin-bottom: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
  }
  .span-or {
    display: block;
    position: absolute;
    left: 50%;
    top: -2px;
    margin-left: -25px;
    background-color: #fff;
    width: 50px;
    text-align: center;
  }
  .hr-or {
    background-color: #cdcdcd;
    height: 1px;
    margin-top: 0px !important;
    margin-bottom: 0px !important;
  }
  h3 {
    /*text-align: center;*/
    line-height: 300%;
  }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="HiddenTitle" Value="會員登入" runat="server" />
    <div class="container">
  <div class="row">

    <div class="main">

      <h3>請登入, 或 <a href="#">註冊</a></h3>
      <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="#" class="btn btn-lg btn-primary btn-block">Facebook</a>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
          <a href="#" class="btn btn-lg btn-info btn-block">Google</a>
        </div>
      </div>
      <div class="login-or">
        <hr class="hr-or">
        <span class="span-or">或</span>
      </div>

        <div class="form-group">          
            <asp:Label AssociatedControlID="inputEmail" runat="server" Text="電子郵件"></asp:Label>
           <asp:TextBox ID="inputEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
        </div>
        <div class="form-group">
          <a class="pull-right" href="#">忘記密碼?</a>
          <asp:Label ID="Label1" runat="server" Text="密碼" AssociatedControlID="inputPassword"></asp:Label>
               <asp:TextBox ID="inputPassword" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
        </div>
        <div class="checkbox pull-right">
          <label>
                   <asp:CheckBox ID="CheckBoxRemember" runat="server" />        
            記住我 </label>
        </div>
        <asp:Button ID="Button1" runat="server" Text="登入" CssClass="btn btn-primary" OnClick="Button1_Click" />


    
    </div>
    
  </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

