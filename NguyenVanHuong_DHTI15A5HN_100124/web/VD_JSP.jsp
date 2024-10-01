<%-- 
    Document   : VD_JSP
    Created on : Oct 1, 2024, 9:17:36 AM
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
        <h1>Nguyễn Văn Hướng _ Ví dụ đầu tiên về JSP</h1>
        <%
            int x = 5;
            String st = "Lớp DHTI15A5HN";
            double y = 8.9;
        %>
        <p>Gía trị của x là : <%=x%></p>
        <p>Xâu st là : <%=st%></p>
        <p>Gía trị biến y là : <%=y%></p>
        
        <!-- Form nhập họ tên -->
        <form action="VD_JSP.jsp" method="post">
            <label for="hoTen">Nhập họ tên của bạn:</label><br>
            <input type="text" id="hoTen" name="hoTen" placeholder="Họ và tên"><br><br>
            <input type="submit" value="Gửi">
        </form>
        
        <!-- Hiển thị họ tên đã nhập -->
        <%
            String hoTen = request.getParameter("hoTen");
            if (hoTen != null && !hoTen.isEmpty()) {
        %>
            <p>Họ tên bạn đã nhập là: <%=hoTen%></p>
        <%
            }
        %>
    </body>
</html>