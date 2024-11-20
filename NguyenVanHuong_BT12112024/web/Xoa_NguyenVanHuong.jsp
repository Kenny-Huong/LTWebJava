<%-- 
    Document   : Xoa_NguyenVanHuong
    Created on : Nov 12, 2024, 10:44:24 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            max-width: 800px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        form {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"] {
            padding: 8px;
            width: calc(100% - 22px);
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
     <div class="container">
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            String dbURL = "jdbc:mysql://localhost:3366/QLSanPham";
            String dbUser = "root";
            String dbPass = ""; 

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                stmt = conn.createStatement();
                String sql = "SELECT * FROM SanPham";
                rs = stmt.executeQuery(sql);
        %>
            <h2>Danh sách sản phẩm</h2>
            <table>
                <tr>
                    <th>Mã SP</th>
                    <th>Tên SP</th>
                    <th>Loại SP</th>
                    <th>Giá</th>
                </tr>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("MaSP") %></td>
                    <td><%= rs.getString("TenSP") %></td>
                    <td><%= rs.getString("LoaiSP") %></td>
                    <td><%= rs.getDouble("Gia") %> VNĐ</td>
                </tr>
                <%
                    }
                %>
            </table>
            <form action="XLXoa_NguyenVanHuong" method="post">
                <label>Nhập mã sản phẩm cần xóa:</label>
                <input type="text" name="maSP" required>
                <input type="submit" value="Xóa sản phẩm">
            </form>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
</body>
</html>