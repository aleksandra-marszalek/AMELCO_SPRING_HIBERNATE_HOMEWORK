<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form method="post" modelAttribute="article">
    title: <form:input path="title" placeholder="title"/>
    <form:errors path="title"/>

    content: <form:textarea path="content" placeholder="content" rows="20" cols="100"/>
    <form:errors path="content"/>


    Save as draft:
    <form:hidden path="draft" value="true"/>


    <form:hidden path="id" value="${article.id}"/>

    <input type="submit" value="save"/>


</form:form>
</body>



</html>
