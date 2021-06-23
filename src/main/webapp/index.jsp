<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
    request.setCharacterEncoding("utf-8");
    String userType = (String)session.getAttribute("userType");
    if (userType==null)
        session.setAttribute("userType", "visitor");
    if (request.getParameter("submit")!=null)
    {
        String password = request.getParameter("password");
        if (password.equals("123"))
        {
            session.setAttribute("userType", "manager");
            response.sendRedirect("home.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My Blog</title>
<link rel="stylesheet" type="text/css" href="css/general.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<style>
</style>
</head>
<body>
    <div id="shadow"></div>
    <div id="title">Welcome To My Blog !</div>
    <div id="nav">
        <ul>
            <li><a href="home.jsp">游客入口</a></li>
            <li id="managerEntry"><a onclick="displayPasswordDiv(true)">管理员入口</a></li>
        </ul>
        <div id="passwordDiv">
            <form action="index.jsp" method="post">
                <input type="password" name="password" placeholder="请输入密码（默认：123）">
                <input type="submit" name="submit" value="确&nbsp;&nbsp;认">
            </form> 
        </div>
    </div>
    <div id="footer">
        <p>&copy; 2021 SYSU Web</p>
    </div>

    <script>
        window.onresize = function() {
            var clientWidth = document.documentElement.scrollWidth;
            var clientHeight = Math.max(document.documentElement.clientHeight, document.documentElement.scrollHeight);
            var shadow = document.getElementById("shadow");
            shadow.style.width = "" + clientWidth + "px";
            shadow.style.height = "" + clientHeight + "px";
        }
        window.onresize();
        function displayPasswordDiv(boolValue) {
            var div = document.getElementById("passwordDiv");
            if (boolValue)
            {
                div.children[0].children[0].value = "";
                div.style.display = "block";
            }
            else
            div.style.display = "none";
        }
    </script>
</body>
</html>