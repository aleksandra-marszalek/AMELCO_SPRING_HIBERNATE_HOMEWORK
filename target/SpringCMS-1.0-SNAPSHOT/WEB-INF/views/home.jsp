<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: janmadej
  Date: 08.05.2018
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <%-- imports function tags from JSTL, prefix "fn"--%>
<html>
<head>
    <title>homepage</title>
</head>
<body>
<h1>Last articles: </h1>
<c:forEach var="article" items="${articles}">
    <c:out value="${article.title}"/>
    <c:out value="${article.created}"/>
    <c:out value="${fn:substring(article.content, 0, 10)}"/><br>
</c:forEach>
<h2>Categories</h2>
<c:forEach items="${categories}" var="category">
    <a href="/articles/${category.id}"><c:out value="${category.name}"/></a><br>
</c:forEach>


</body>
</html>
