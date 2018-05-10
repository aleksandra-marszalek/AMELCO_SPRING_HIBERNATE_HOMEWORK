<%--
  Created by IntelliJ IDEA.
  User: janmadej
  Date: 09.05.2018
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        table.minimalistBlack {
            border: 3px solid #000000;
            width: 100%;
            text-align: left;
            border-collapse: collapse;
        }
        table.minimalistBlack td, table.minimalistBlack th {
            border: 1px solid #000000;
            padding: 5px 4px;
        }
        table.minimalistBlack tbody td {
            font-size: 13px;
        }
        table.minimalistBlack thead {
            background: #CFCFCF;
            background: -moz-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
            background: -webkit-linear-gradient(top, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
            background: linear-gradient(to bottom, #dbdbdb 0%, #d3d3d3 66%, #CFCFCF 100%);
            border-bottom: 3px solid #000000;
        }
        table.minimalistBlack thead th {
            font-size: 15px;
            font-weight: bold;
            color: #000000;
            text-align: left;
        }
        table.minimalistBlack tfoot {
            font-size: 14px;
            font-weight: bold;
            color: #000000;
            border-top: 3px solid #000000;
        }
        table.minimalistBlack tfoot td {
            font-size: 14px;
        }
    </style>
    <title>Title</title>
</head>
<body>
<h2>Menu</h2>
<table class="minimalistBlack">
    <tr>
        <th><a href="/">Home</a></th>
        <th><a href="/article">Go to all articles</a></th>
        <th><a href="/category">Go to all categories</a></th>
        <th><a href="/author">Go to all authors</a></th>
        <th><a href="/draft">Go to all drafts</a></th>
    </tr>
</table>

</body>
</html>
