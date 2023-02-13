<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP Victus
  Date: 2/8/2023
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Book List</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity--%>
<%--            ="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
<%--</head>--%>
<%--<body>--%>
<%--<table class="table table-dark table-striped">--%>
<%--    <tr>--%>
<%--        <td>ID</td>--%>
<%--        <td>Title</td>--%>
<%--        <td>Page Size</td>--%>
<%--        <td>Author</td>--%>
<%--        <td>Category</td>--%>
<%--    </tr>--%>
<%--    <c:forEach var="book" items="${bookList}">--%>
<%--        <tr>--%>
<%--            <td>${book.id}</td>--%>
<%--            <td>${book.title}</td>--%>
<%--            <td>${book.pageSize}</td>--%>
<%--            <td>${book.author}</td>--%>
<%--            <td>${book.category}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>

<%--</table>--%>
<%--</body>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity--%>
<%--        ="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>--%>
<%--</html>--%>
<html>
<head>
    <title>Book Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<center>
    <h1>BOOK MANAGEMENT</h1>
    <h2>
        <a href="/book?action=create">Add New Book</a>
    </h2>
</center>
<div class="d-flex justify-content: center">
    <form class="d-flex" action="/book?action=search" method="post">
        <input class="form-control me-2" style="width: 300px" type="search" placeholder="Search" aria-label="Search"
               name="title"
               value="${book.title}">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</div>
<div align="center">
    <table class="table table-primary table-striped">
        <tr>
            <td>ID</td>
            <td>Title</td>
            <td>Page Size</td>
            <td>Author</td>
            <td>Category</td>
            <td>Edit</td>
            <td>Delete</td>
        </tr>
        <c:forEach var="book" items="${bookList}">
            <tr>
                <td>${book.id}</td>
                <td>${book.title}</td>
                <td>${book.pageSize}</td>
                <td>${book.author}</td>
                <td>${book.category}</td>
                <td>
                    <button>
                        <a style="color: cadetblue" href="/book?action=edit&id=${book.id}">Edit</a>
                    </button>
                </td>
                <td>
                    <button onclick="infoDelete('${book.getId()}','${book.getTitle()}')" type="button"
                            class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>


<%-- modal delete--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Book</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/book?action=delete" method="post">
                <div class="modal-body">
                    <label for="deleteId"></label><input type="text" hidden id="deleteId" name="id">
                    Bạn có muốn xóa sách <span id="deleteName" style="color: brown; font-weight: bold"></span>
                    không ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>
</html>
