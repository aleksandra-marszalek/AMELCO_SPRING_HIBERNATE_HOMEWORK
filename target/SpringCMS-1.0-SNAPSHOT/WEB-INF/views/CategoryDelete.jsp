<%--
  Created by IntelliJ IDEA.
  User: janmadej
  Date: 08.05.2018
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Delete</h1>
<p>Are you sure you want to delete this category?</p>
<form method="post" action="/category/delete/${category.id}">
    yes: <input type="radio" name="agree" value="yes">
    no: <input type="radio" name="agree" value="no">
    <input type="submit" value="save">
</form>

</body>
</html>
