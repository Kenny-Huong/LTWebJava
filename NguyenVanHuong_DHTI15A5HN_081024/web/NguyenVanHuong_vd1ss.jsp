<%-- 
    Document   : NguyenVanHuong_vd1ss
    Created on : Oct 8, 2024, 9:33:21 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ví Dụ Session</title>
    </head>
    <body>
        <form action="NguyenVanHuong_vd1ss.jsv p" method="post">
            <h1>Nguyễn Văn Hướng _ DHTI15A5HN _ 21103100115</h1>
            <label>Nhập tên: </label>
            <input type="text" id="name" name="name">
            
            <input type="submit" value="Hiển thị">
        </form>

        <%
            String name = request.getParameter("name");
            HttpSession ssTen = request.getSession();
            if (name != null && !name.trim().isEmpty()) {
                ssTen.setAttribute("username", name);
            }
        %>
        <p>Tên của bạn: <%= (ssTen.getAttribute("username"))%></p>
        
    </body>
</html>
