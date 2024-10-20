<%-- 
    Document   : NguyenVanHuong_Loi
    Created on : Oct 15, 2024, 10:18:11 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Lỗi</h2>
        <h2>Nguyễn Văn Hướng - DHTI15A5HN - 21103100115</h2>
    <p><%= session.getAttribute("errorMessage") %></p>
    <p><a href="NguyenVanHuong_NhapThongTin.jsp">Nhập lại.</a></p>
    </body>
</html>
