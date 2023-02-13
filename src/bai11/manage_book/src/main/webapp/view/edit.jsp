<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>Book Management</h1>
    <h2>
        <a href="/book">List All Book</a>
    </h2>
    <p>${mess}</p>
</center>
<div align="center">
    <form action="/book?action=edit" method="post">
        <input name="id" value="${book.id}" hidden>
        <table border="1" cellpadding="5">
            <caption>
                <h2>Edit Book</h2>
            </caption>
            <tr>
                <th>Title:</th>
                <td><input type="text" name="title" size="45" value="<c:out value='${book.title}' />"/></td>
            </tr>
            <tr>
                <th>Page Size:</th>
                <td><input type="text" name="pageSize" size="45" value="<c:out value='${book.pageSize}' />"/></td>
            </tr>
            <tr>
                <th>Author:</th>
                <td><input type="text" name="author" size="15" value="<c:out value='${book.author}' />"/></td>
            </tr>
            <tr>
                <th>Category:</th>
                <td><input type="text" name="category" size="15" value="<c:out value='${book.category}' />"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>