<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: fansen
  Date: 2017/8/26
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%--1,使用form标签---可以更快速的开发表单页面，也可以更方便的进行表单回显--%>
    <form:form action="/emp" method="post" modelAttribute="employee">


        <c:if test="${employee.id==null}">
            <%--path属性对应html 表单标签的  name属性值 --%>
            LastName：<form:input path="lastName"></form:input>
        </c:if>
        <c:if test="${employee.id !=null}">
            <form:hidden path="id"></form:hidden>
            <%--<input type="hidden" name="_method" value="PUT">--%>
        </c:if>


        <br>
        Email: <form:input path="email"></form:input>
        <br>
        <%
            Map<String,String> genders= new HashMap<>();
            genders.put("1","Male");
            genders.put("0","Female");

            request.setAttribute("genders",genders);
        %>
        Gender:
        <br>
        <form:radiobuttons path="gender" items="${genders}" delimiter="<br>"></form:radiobuttons>
        <br>
        Department:<form:select path="department.id"
                                items="${departments}"
                                itemLabel="departmentName"
                                itemValue="id"></form:select>
        <br>
        <input type="submit" value="Submit">
    </form:form>
</body>
</html>
