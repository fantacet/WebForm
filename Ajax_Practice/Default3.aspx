<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        #Text1{
            margin:0 10px;
            padding:0;
            width:200px;
        }
        #ul1{
            width:200px;
            border:solid 1px blue;
            margin:0 10px;
            padding:0;
        }
         #ul1 li{
             list-style-type:none;
         }
        #ul1 li:hover{
            background-color:burlywood;
            
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input id="Text1" type="text" />
        <ul id="ul1"></ul>
    </div>
    </form>

</body>
<script>
    var Text1 = document.getElementById("Text1");
    var ul1 = document.getElementById("ul1");

    Text1.addEventListener("keyup", function () {
        //alert(this.value);
        var xhr = new XMLHttpRequest();
        ul1.innerHTML = "";
        xhr.addEventListener("load", function () {
            var data = JSON.parse(xhr.response);
            //console.log(data);
            for (var i = 0, max=data.length; i < max; i++) {
                //console.log(data[i]);
                var li = document.createElement("li");
                li.textContent = data[i];
                li.addEventListener("mouseover", function () {
                   Text1.value = this.textContent;
                })
                li.addEventListener("click", function () {
                    location.href = "Handler.ashx?username=" + this.textContent;
                })

                ul1.appendChild(li);
            }
        });

        xhr.open("GET", "CustomerHandler.ashx?CustomerID=" + this.value);
        xhr.send();

    });



</script>
</html>
