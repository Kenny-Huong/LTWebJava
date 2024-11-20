<%-- 
    Document   : ThemTS
    Created on : Nov 19, 2024, 9:20:30 AM
    Author     : nguye
--%>

<%@page import="java.sql.*"%>
<%@page import="NguyenVanHuong.KetNoi"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Thí Sinh</title>
    <style>
        /* Cơ bản cho body */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        /* Phần form thêm thí sinh */
        form {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            width: 300px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        form input[type="text"],
        form input[type="number"] {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            cursor: pointer;
            border-radius: 4px;
        }

        form input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Cảnh báo thông báo lỗi */
        p {
            color: red;
            text-align: center;
        }

        /* Bảng danh sách thí sinh */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #f2f2f2;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Tạo một đường phân cách giữa phần form và bảng */
        hr {
            margin: 20px auto;
            width: 80%;
        }
    </style>
</head>
<body>
    <h1>Thêm Thí Sinh</h1>
        <%-- Hiển thị thông báo nếu có --%>
        <%-- Hiển thị thông báo nếu có --%>
        <%
            String message = (String) request.getAttribute("message");
            String soBaoDanh = (String) request.getAttribute("SBD");
            String hoTen = (String) request.getAttribute("Hoten");
            String diemToan = (String) request.getAttribute("DiemToan");
            String diemVan = (String) request.getAttribute("DiemVan");
            if (message != null) {
        %>
            <p style="color: red;"><%= message %></p>
        <%
            }
         %>

    <form action="XLThemTS" method="post">
        Số báo danh: <input type="text" name="SoBaoDanh" value="<%= soBaoDanh != null ? soBaoDanh : "" %>" required><br><br>
        Họ tên: <input type="text" name="HoTen" value="<%= hoTen != null ? hoTen : "" %>" required><br><br>
        Điểm toán: <input type="number" name="DiemToan" step="0.1" value="<%= diemToan != null ? diemToan : "" %>" required><br><br>
        Điểm văn: <input type="number" name="DiemVan" step="0.1" value="<%= diemVan != null ? diemVan : "" %>" required><br><br>
        <input type="submit" value="Thêm">
    </form>
    <hr>
    <h2>Danh sách thí sinh</h2>
    <table border="1">
        <tr>
            <th>Số báo danh</th>
            <th>Họ tên</th>
            <th>Điểm toán</th>
            <th>Điểm văn</th>
            <th>Kết quả</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Kết nối cơ sở dữ liệu bằng KetNoi
                conn = KetNoi.KNCSDL();
                stmt = conn.createStatement();
                String query = "SELECT * FROM thisinh";
                rs = stmt.executeQuery(query);
                while (rs.next()) {
                    float tongDiem = rs.getFloat("DiemToan") + rs.getFloat("DiemVan");
                    String ketQua = (tongDiem >= 10) ? "Đỗ" : "Trượt";
        %>
        <tr>
            <td><%= rs.getString("SBD") %></td>
            <td><%= rs.getString("HoTen") %></td>
            <td><%= rs.getFloat("DiemToan") %></td>
            <td><%= rs.getFloat("DiemVan") %></td>
            <td><%= ketQua %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
</body>
</html>

