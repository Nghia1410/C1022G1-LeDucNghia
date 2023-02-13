<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/4/2023
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
<center>
    <h1>Book Management</h1>
    <h2>
        <a href="/book">List All Book</a>
    </h2>
</center>

<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <tr>
                <th>Title:</th>
                <td><input type="text" name="title" id="title" size="45"/></td>
            </tr>
            <tr>
                <th>Page Size:</th>
                <td><input type="text" name="pageSize" id="pageSize" size="45"/></td>
            </tr>
            <tr>
                <th>Author:</th>

                <td><input type="text" name="author" id="author" size="45"/></td>
            </tr>
            <tr>
                <th>Category:</th>
                <td><input type="text" name="category" id="category" size="15"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"/></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>