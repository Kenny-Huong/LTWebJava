<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nhập Thông Tin</title>
    </head>
    <body>
        <form action="NguyenVanHuong_NhapThongTin.jsp" method="POST">
            <label for="name">Nhập Tên:</label>
        <input type="text" id="name" name="name" value="<%= (session.getAttribute("name") != null) ? session.getAttribute("name") : "" %>"><br><br>

        <label for="age">Nhập Tuổi:</label>
        <input type="text" id="age" name="age" value="<%= (session.getAttribute("age") != null) ? session.getAttribute("age") : "" %>"><br><br>

        <input type="submit" value="HIỂN THỊ">
        </form>
        
        <%
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        if (name != null && age != null && !name.isEmpty() && !age.isEmpty()) { 
            session.setAttribute("name", name);
            session.setAttribute("age", age);
            response.sendRedirect("NguyenVanHuong_HienThi.jsp");
        } else if (request.getMethod().equalsIgnoreCase("POST")) {
            String errorMessage = "";
            if (name == null || name.isEmpty()) {
                errorMessage = "Tên bạn đang bỏ trống.";
            }
            if (age == null || age.isEmpty()) {
                if (!errorMessage.isEmpty()) {
                    errorMessage += " ";
                }
                errorMessage += "Tuổi bạn đang bỏ trống.";
            }

         
            session.setAttribute("errorMessage", errorMessage);
            response.sendRedirect("NguyenVanHuong_Loi.jsp");
        }
    %>
    </body>
</html>
