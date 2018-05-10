<%--
  Created by IntelliJ IDEA.
  User: janmadej
  Date: 08.05.2018
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
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

    <label>Author: </label>
    <form:select path="author.id"
                 items="${authors}"
                 itemLabel="lastName"
                 itemValue="id"/>


    <label>Category: </label>
    <form:checkboxes path="categories"
                     items="${categories}"
                     itemLabel="name"
                     itemValue="id"/>
    <form:errors path="categories"/>

    <form:input path="quantity" type="number"/>
    <form:errors path="quantity"/>

    <form:hidden path="id" value="${article.id}"/>

    <input type="submit" value="save"/>


</form:form>
</body>



</html>
