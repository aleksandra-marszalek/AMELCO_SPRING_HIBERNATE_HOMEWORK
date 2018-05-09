<%--
  Created by IntelliJ IDEA.
  User: janmadej
  Date: 08.05.2018
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<ul>
    <c:forEach items="${categories}" var="category">
        <li>
            <h3>${category.name}</h3>
            <p>${category.description}</p>
            <%--<ul>--%>
                <%--<c:forEach items="${category.articles}" var="article">--%>
                    <%--<li>--%>
                        <%--<p>${article.name} </p>--%>
                    <%--</li>--%>
                <%--</c:forEach>--%>
            <%--</ul>--%>
            <p><a href="/category/edit/${category.id}">Edit category</a> </p>
            <p><a href="/category/delete/${category.id}">Delete category</a> </p>
        </li>
    </c:forEach>
</ul>

</body>
</html>