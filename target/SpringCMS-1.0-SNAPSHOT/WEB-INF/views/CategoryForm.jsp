<%--
  Created by IntelliJ IDEA.
  User: janmadej
  Date: 08.05.2018
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form method="post" modelAttribute="category">
    name: <form:input path="name" placeholder="name"/>
    description: <form:input path="description" placeholder="description"/>


    <form:hidden path="id" value="${category.id}"/>

    <input type="submit" value="save"/>


</form:form>

</body>



</html>
