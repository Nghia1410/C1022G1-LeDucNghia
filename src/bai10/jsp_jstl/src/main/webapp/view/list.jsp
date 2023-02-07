<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP Victus
  Date: 2/7/2023
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity
            ="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<table class="table check-box-table-cell p-3 mb-2 bg-primary text-white">
    <tr>
        <td>id</td>
        <td>name</td>
        <td>point</td>
        <td>level</td>
    </tr>
    <c:forEach var="student" items="${studentList}">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.point}</td>
            <c:if test="${student.point>=90}">
                <td>Giỏi</td>
            </c:if>
            <c:if test="${student.point>=80 && student.point<90}">
                <td>Khá</td>
            </c:if>
            <c:if test="${student.point>=60 && student.point<80 }">
                <td>Trung Bình</td>
            </c:if>
            <c:if test="${student.point<60}">
                <td>Yếu</td>
            </c:if>
        </tr>
    </c:forEach>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity
        ="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>
