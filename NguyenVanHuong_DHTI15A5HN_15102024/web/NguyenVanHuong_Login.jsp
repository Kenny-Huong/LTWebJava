<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng nhập</title>
</head>
<body>
    <h2>ĐĂNG NHẬP</h2>
    <form action="NguyenVanHuong_Login.jsp" method="post">
        <label for="username">Tên đăng nhập:</label>
        <input type="text" id="username" name="username" value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
        <br>
        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" value="<%= request.getParameter("password") != null ? request.getParameter("password") : "" %>">
        <br>
        <input type="submit" value="Đăng nhập">
        <br>
        <input type="button" value="Thoát" onclick="window.location.href='index.jsp';">
    </form>

    <%
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        if (userName != null && password != null) {
            if (userName.equals("NguyenVanHuong") && password.equals("123")) {
                session.setAttribute("username", userName);
                response.sendRedirect("DNThanhcong.jsp");
            } else {
                out.println("<p style='color:red;'>Bạn đã nhập sai thông tin về UserName hoặc Password</p>");
            }
        }
    %>
</body>
</html>
