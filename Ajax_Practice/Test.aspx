<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <input type="text" name="tex1" id="text1"/>
    <div id="div1">
    OK001
    </div>
    </form>
</body>
    <script>
        var x = document.getElementsByTagName("div");
        console.log(x);

    </script>

</html>
