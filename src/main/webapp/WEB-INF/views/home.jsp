<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- imports function tags from JSTL, prefix "fn"--%>
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
    <title>homepage</title>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>Homepage</h1>
<hr>
<h2>Last articles: </h2>
<table class="minimalistBlack">
    <tr>
        <th>title</th>
        <th>created</th>
        <th>content</th>
    </tr>
<c:forEach var="article" items="${articles}">
    <tr>
    <td><c:out value="${article.title}"/></td>
    <td><c:out value="${article.created}"/></td>
    <td><c:out value="${fn:substring(article.content, 0, 200)}"/></td>
    </tr>
</c:forEach>
</table>
<hr>
<h2>Categories</h2>
<c:forEach items="${categories}" var="category">
    <a href="/articles/${category.id}"><c:out value="${category.name}"/></a><br>
</c:forEach>


</body>
</html>
