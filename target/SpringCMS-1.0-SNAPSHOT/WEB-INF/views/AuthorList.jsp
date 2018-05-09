<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="header.jsp" %>
<ul>
    <c:forEach items="${authors}" var="author">
        <li>
            <h3>${author.firstName} ${author.lastName}</h3>
            <p><a href="/author/edit/${author.id}">Edit author</a> </p>
            <p><a href="/author/delete/${author.id}">Delete author</a> </p>
        </li>
    </c:forEach>
</ul>

</body>
</html>
