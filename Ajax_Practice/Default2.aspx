<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        #table1{
            display:inline-block;
            width:80%;
            border-collapse:collapse;
        }
        #table1 td{
            border:solid 2px green;
        }
        #table1 thead{
            background-color:lightblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1">
        <select id="Select1"></select>
        <table id="table1" style="width: 100%;">
            
        </table>
    </div>
    </form>

    <script>
        var table1 = document.getElementById("table1");
        var xhr = new XMLHttpRequest();
        var Select1 = document.getElementById("Select1");

  window.onload = function () {
       xhr.addEventListener("load", function () {
                 var data = JSON.parse( xhr.response);
                 //div1.innerHTML = data;
                 //console.log(data);
                 for (var i = 0, max = data.length; i < max; i++) {
                      //Select1.insertAdjacentHTML("beforeend", "<option>編號: " + data[i].categoryID + " 名稱: " + data[i].categoryName +"</option>");
                     var op = document.createElement("option");
                     op.setAttribute("value", data[i].categoryID);
                     op.textContent = data[i].categoryName;
                     Select1.appendChild(op);
                 }
            
             })

      xhr.open("GET", "CategoryHandler.ashx");
      xhr.send();
        };

        Select1.addEventListener("change", function () {
            var xhr1 = new XMLHttpRequest();
            xhr1.addEventListener("load", function () {
                var data1 = JSON.parse(xhr1.response);
                //console.log(data1);
                table1.innerHTML = "";

                var th = document.createElement("thead");
                var thr = document.createElement("tr");
                var attr = Object.keys(data1[0]);
                for (var iii = 0, max = attr.length; iii < max; iii++) {
                    var td = document.createElement("td");
                    td.textContent = attr[iii];
                    thr.appendChild(td);
                }
                th.appendChild(thr);

                var tb = document.createElement("tbody");
                for (var i = 0, max = data1.length; i < max; i++) {
                    var attr = Object.keys(data1[i]);
                    var tr = document.createElement("tr");
                    for (var ii = 0, max2 = attr.length; ii < max2; ii++) {
                        var td = document.createElement("td");
                        td.textContent = eval("data1[i]." + attr[ii]);
                        tr.appendChild(td);
                    }
                    tb.appendChild(tr);
                }
                table1.appendChild(th);
                 table1.appendChild(tb);
            });
            xhr1.open("GET", "ProductHandler.ashx?CategoryID=" + this.value);
            xhr1.send();
        })

        //var emps = [
        //    { "name": "Tom", "workYear": 5, "salary": 40000 },
        //    { "name": "Ha", "workYear": 6, "salary": 48000 },
        //    { "name": "Fu", "workYear": 7, "salary": 42000 }
        //];

        //for (var i = 0; i < emps.length; i++) {
        //    var emp = emps[i];
        //    var k = Object.keys(emp);
        //    console.log(emp);
        //    console.log(k.length);
        //    console.log(k[0]);
        //    console.log(emp.name);
        //    var v = k[0];
        //    console.log(eval("emp." + v));
        //}

        //var emp = {
        //    "employees": [
        //        { "name": "Tom", "workYear": 5, "salary": 40000 },
        //        { "name": "Ha", "workYear": 6, "salary": 48000 },
        //        { "name": "Fu", "workYear": 7, "salary": 42000 }
        //    ]};
        

        //for (var i = 0; i < emp.employees.length; i++) {
        //   document.write( emp.employees[i].name + "\n" + emp.employees[i].workYear + "\n" + emp.employees[i].salary + "\n");
        //}
    </script>
</body>
</html>
