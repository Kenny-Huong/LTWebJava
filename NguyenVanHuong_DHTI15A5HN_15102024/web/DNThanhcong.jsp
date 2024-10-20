<%-- 
    Document   : DNThanhcong
    Created on : Oct 15, 2024, 9:09:33 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng nhập thành công</title>
</head>
<body>
    <h2>Chào mừng bạn đã đăng nhập thành công!</h2>
    
    <%
        // Lấy giá trị username từ session
        
        String userName = (String) session.getAttribute("username");
    %>
    
    <p>Tên đăng nhập: <%= userName %></p>
</body>
</html>
