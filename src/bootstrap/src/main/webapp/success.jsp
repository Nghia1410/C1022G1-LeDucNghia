<%--
  Created by IntelliJ IDEA.
  User: HP Victus
  Date: 2/6/2023
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>thông báo</title>
</head>
<body>
<div><h1>Đăng nhập thành công</h1>
    <div id="current-time"></div>
    <script>
        var curDate = new Date()
        var curTime = curDate.getHours() + ":" + curDate.getMinutes() + ":" + curDate.getSeconds();
        var curDay = curDate.getDate();
        var curMonth = curDate.getMonth() + 1;
        var curYear = curDate.getFullYear();
        document.getElementById('current-time').innerHTML = curDay + "/" + curMonth + "/" + curYear + "/" + curTime;
    </script>
</div>
</body>
</html>
