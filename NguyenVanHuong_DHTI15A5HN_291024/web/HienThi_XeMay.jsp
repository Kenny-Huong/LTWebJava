<%-- 
    Document   : HienThi_XeMay
    Created on : Oct 29, 2024, 11:11:47 AM
    Author     : nguye
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.XeMay" %>
<html>
<head>
    <title>Danh sách Xe Máy</title>
     <style>
        table { width: 50%; border-collapse: collapse; margin: 20px 0; }
        table, th, td { border: 1px solid black; }
        th, td { padding: 10px; text-align: center; }
    </style>
</head>
<body>
    <h1>Danh sách Xe Máy</h1>
    <table border="1">
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Hãng SX</th>
            <th>Màu</th>
        </tr>
        <%
            // Lấy danh sách xe máy từ request
            ArrayList<XeMay> danhSachXe = (ArrayList<XeMay>) request.getAttribute("danhSachXe");
            if (danhSachXe != null) {
                for (XeMay xeMay : danhSachXe) {
        %>
                    <tr>
                        <td><%= xeMay.getMa() %></td>
                        <td><%= xeMay.getTen() %></td>
                        <td><%= xeMay.getHangSX() %></td>
                        <td><%= xeMay.getMau() %></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="4">Không có dữ liệu để hiển thị</td>
                </tr>
        <%
            }
        %>
    </table>
    <a href="Them_NguyenVanHuong.jsp">Quay lại trang thêm xe máy</a> <!-- Nếu bạn có form để thêm xe máy -->
</body>
</html>
