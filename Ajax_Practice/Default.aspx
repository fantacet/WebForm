<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .loading{
            display:inline;
        }
        .notloading{
            display:none;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input type="text" id="tbUsername" />
        <input id="btn1" type="button" value="讀取" />
        <input id="btn2" type="button" value="取消" />
        <img  id="img1" class="notloading" src="images/ajax-loader.gif" />
        <div id="div1">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
        </div>
    </div>
    </form>
</body>
    <script>
        var btn1 = document.getElementById("btn1");
        var btn2 = document.getElementById("btn2");
        var div1 = document.getElementById("div1");
        var img1 = document.getElementById("img1");
        var xhr = new XMLHttpRequest();

        btn1.addEventListener("click", function () {
            xhr.addEventListener("load", function () {
                if (xhr.status == 200) {
                    var data = xhr.responseText;
                    div1.innerHTML = data;
                }
                else {
                    alert("xhr.status =" + xhr.status);
                }
            });

            xhr.addEventListener("loadstart", function () {
                btn1.setAttribute("disabled", "disabled");
                img1.setAttribute("class", "loading");
            });

            xhr.addEventListener("loadend", function () {
                btn1.setAttribute("disabled","");
                img1.setAttribute("class", "notloading");
            });

            xhr.addEventListener("abort", function () {
                div1.textContent = "取消了";
            })

            xhr.addEventListener("timeout", function () {
                div1.textContent = "逾時了";
            });

            var username = document.getElementById("tbUsername").value;

            xhr.open("get", "Handler.ashx?username=" + username);
            xhr.timeout = 3000;
            xhr.send();
        });

        btn2.addEventListener("click", function () {
            xhr.abort();
        });


        //document.getElementById("Button1").addEventListener("click", function () {
        //    var xhr = new XMLHttpRequest();
        //    xhr.addEventListener("readystatechange", function () {
        //        var data = xhr.responseText;
        //        document.getElementById("div1").innerHTML = data;
        //    });

        //    xhr.open("get", "Handler.ashx");
        //    xhr.send();
        //});

        //document.getElementById("Button1").addEventListener("click", function () {
        //    var xhr = new XMLHttpRequest();
        //    xhr.open("get", "Handler.ashx", false);
        //    xhr.send();
        //    var data = xhr.responseText;
        //    document.getElementById("div1").innerHTML = data;
        //});



    </script>
</html>
