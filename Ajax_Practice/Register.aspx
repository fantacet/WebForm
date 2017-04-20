<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <input id="tbUsername" name="username" type="text" /><div id="div1"></div>
        <br />
        <input id="Text1" type="text" />
        <br />
        <input id="Button1" type="button" value="button" />
    </div>
    </form>
    <script>
        var tbUsername = document.getElementById("tbUsername");
        var xhr = new XMLHttpRequest();
        var div1 = document.getElementById("div1");

        tbUsername.addEventListener("blur", function () {
           xhr.addEventListener("load", function(){
                var data = xhr.responseText;
                div1.innerHTML = data;
            })

            xhr.open("get", "NameCheck.ashx?username=" + tbUsername.value);
            xhr.send();

        })

        
    </script>
</body>
</html>
