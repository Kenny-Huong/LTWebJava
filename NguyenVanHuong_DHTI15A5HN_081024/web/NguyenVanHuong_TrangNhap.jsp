<%-- 
    Document   : NguyenVanHuong_TrangNhap
    Created on : Oct 8, 2024, 10:17:12 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhập Tên</title>
    </head>
    <body>
        <h1>Nguyễn Văn Hướng _ DHTI15A5HN _ 21103100115</h1>
        <form action="NguyenVanHuong_TrangNhap.jsp" method="post">
            <div>
                <label>Nhập tên: </label>
                <input type="text" id="name" name="name">
            </div>
            <div>
                <label>Chọn lớp: </label>
                <select name="lop">
                    <option value="Lớp 10">Lớp 10</option>
                    <option value="Lớp 11">Lớp 11</option>
                    <option value="Lớp 12">Lớp 12</option>
                </select>
            </div>
            <input type="submit" value="Hiển thị">
        </form>

        <% 
        if(request.getMethod().equalsIgnoreCase("POST")) {
            String name = request.getParameter("name");
            String classSelected = request.getParameter("lop");

            session.setAttribute("name", name);
            session.setAttribute("lop", classSelected);

            response.sendRedirect("NguyenVanHuong_TrangHienThi");
        }
    %>
            

    </body>
</html>
