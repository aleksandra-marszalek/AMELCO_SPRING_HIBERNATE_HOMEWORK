<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>Articles</h1>
<p><a href="/draft/add">Add new draft</a> </p>
<ul>
    <c:forEach items="${articles}" var="article">
        <li>
            <h3>${article.title}</h3>
            <label>Categories: </label>
            <ul>
                <c:forEach items="${article.categories}" var="category">
                    <li>
                        <p>${category.name}</p>
                    </li>
                </c:forEach>
            </ul>
            <label>content: </label>
            <p>${article.content}</p>

            <label>author: </label>
            <p>${article.author.firstName} ${article.author.lastName}</p>

            <label>created: </label>
            <p>${article.created}</p>

            <label>updated: </label>
            <p>${article.updated}</p>
            <p><a href="/article/edit/${article.id}">Edit article</a> </p>
            <p><a href="/article/delete/${article.id}">Delete article</a> </p>
        </li>
    </c:forEach>
</ul>

</body>
</html>