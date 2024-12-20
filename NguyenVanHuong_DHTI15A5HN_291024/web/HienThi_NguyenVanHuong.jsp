<%-- 
    Document   : HienThi_NguyenVanHuong
    Created on : Oct 29, 2024, 9:24:40 AM
    Author     : nguye
--%>

<%@ page import="java.sql.*, java.util.ArrayList" %>
<%@ page import="com.example.XeMay" %> 
<%
    // Khai báo danh sách để lưu các đối tượng XeMay
    ArrayList<XeMay> danhSachXe = new ArrayList<>();

    // Kết nối đến cơ sở dữ liệu
    String jdbcURL = "jdbc:mysql://localhost:3366/qlxemay";
    String dbUser = "root";
    String dbPassword = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Sử dụng driver phù hợp
        Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Truy vấn dữ liệu từ bảng xemay
        String sql = "SELECT * FROM xemay";
        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        // Thêm các bản ghi vào danh sách
        while (rs.next()) {
            int ma = rs.getInt("Ma");
            String ten = rs.getString("Ten");
            String hangSX = rs.getString("HangSX");
            String mau = rs.getString("Mau");

            XeMay xeMay = new XeMay(ma, ten, hangSX, mau);
            danhSachXe.add(xeMay);
        }

        // Đóng kết nối
        rs.close();
        statement.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hiển Thị Danh Sách Xe Máy</title>
    <style>
        table { width: 50%; border-collapse: collapse; margin: 20px 0; }
        table, th, td { border: 1px solid black; }
        th, td { padding: 10px; text-align: center; }
    </style>
</head>
<body>
    <h2>Danh Sách Xe Máy</h2>
    <h3>Nguyễn Văn Hướng - DHTI15A5HN</h3>
    <table>
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Hãng Sản Xuất</th>
            <th>Màu</th>
        </tr>
        <%
            for (XeMay xe : danhSachXe) {
        %>
        <tr>
            <td><%= xe.getMa() %></td>
            <td><%= xe.getTen() %></td>
            <td><%= xe.getHangSX() %></td>
            <td><%= xe.getMau() %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>