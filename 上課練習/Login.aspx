<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        
/*
    Note: It is best to use a less version of this file ( see http://css2less.cc
    For the media queries use @screen-sm-min instead of 768px.
    For .omb_spanOr use @body-bg instead of white.
*/

@media (min-width: 768px) {
    .omb_row-sm-offset-3 div:first-child[class*="col-"] {
        margin-left: 25%;
    }
}

.omb_login .omb_authTitle {
    text-align: center;
	line-height: 300%;
}
	
.omb_login .omb_socialButtons a {
	color: white; // In yourUse @body-bg 
	opacity:0.9;
}
.omb_login .omb_socialButtons a:hover {
    color: white;
	opacity:1;    	
}
.omb_login .omb_socialButtons .omb_btn-facebook {background: #3b5998;}
.omb_login .omb_socialButtons .omb_btn-twitter {background: #00aced;}
.omb_login .omb_socialButtons .omb_btn-google {background: #c32f10;}


.omb_login .omb_loginOr {
	position: relative;
	font-size: 1.5em;
	color: #aaa;
	margin-top: 1em;
	margin-bottom: 1em;
	padding-top: 0.5em;
	padding-bottom: 0.5em;
}
.omb_login .omb_loginOr .omb_hrOr {
	background-color: #cdcdcd;
	height: 1px;
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}
.omb_login .omb_loginOr .omb_spanOr {
	display: block;
	position: absolute;
	left: 50%;
	top: -0.6em;
	margin-left: -1.5em;
	background-color: white;
	width: 3em;
	text-align: center;
}			

.omb_login .omb_loginForm .input-group.i {
	width: 2em;
}
.omb_login .omb_loginForm  .help-block {
    color: red;
}

	
@media (min-width: 768px) {
    .omb_login .omb_forgotPwd {
        text-align: right;
		margin-top:10px;
 	}		
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:HiddenField ID="PageTitle" runat="server" value="登入頁面"/>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<div class="container">
    

    <div class="omb_login">
    	<h3 class="omb_authTitle">Login or <a href="#">Sign up</a></h3>
		<div class="row omb_row-sm-offset-3 omb_socialButtons">
    	    <div class="col-xs-4 col-sm-2">
		        <a href="#" class="btn btn-lg btn-block omb_btn-facebook">
			        <i class="fa fa-facebook visible-xs"></i>
			        <span class="hidden-xs">Facebook</span>
		        </a>
	        </div>
        	<div class="col-xs-4 col-sm-2">
		        <a href="#" class="btn btn-lg btn-block omb_btn-twitter">
			        <i class="fa fa-twitter visible-xs"></i>
			        <span class="hidden-xs">Twitter</span>
		        </a>
	        </div>	
        	<div class="col-xs-4 col-sm-2">
		        <a href="#" class="btn btn-lg btn-block omb_btn-google">
			        <i class="fa fa-google-plus visible-xs"></i>
			        <span class="hidden-xs">Google+</span>
		        </a>
	        </div>	
		</div>

		<div class="row omb_row-sm-offset-3 omb_loginOr">
			<div class="col-xs-12 col-sm-6">
				<hr class="omb_hrOr">
				<span class="omb_spanOr">或</span>
			</div>
		</div>

		<div class="row omb_row-sm-offset-3">
			<div class="col-xs-12 col-sm-6">	
			    
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
						
<asp:TextBox ID="tbEmail" TextMode="Email" runat="server" class="form-control" name="username" placeholder="電子郵件"></asp:TextBox>
					</div>
					<span class="help-block"></span>
										
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						
<asp:TextBox ID="tbPassword" TextMode="Password" class="form-control" name="password" placeholder="密碼" runat="server"></asp:TextBox>
					</div>
                    <br />

				<asp:Button ID="btnLogin" runat="server" Text="登入" class="btn btn-lg btn-primary btn-block" type="submit" OnClick="btnLogin_Click"/>
			</div>
    	</div>
		<div class="row omb_row-sm-offset-3">
			<div class="col-xs-12 col-sm-3">
				<label class="checkbox">
					<input type="checkbox" value="remember-me">
<asp:CheckBox ID="cbRememberMe" runat="server" type="checkbox" value="remember-me" Text="記住我"/>
				</label>
			</div>
			<div class="col-xs-12 col-sm-3">
				<p class="omb_forgotPwd">
<asp:HyperLink ID="linkForgetPassword" runat="server">忘記密碼</asp:HyperLink>
				</p>
			</div>
		</div>	    	
	</div>



        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

