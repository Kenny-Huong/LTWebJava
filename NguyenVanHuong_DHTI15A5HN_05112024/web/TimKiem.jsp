<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách Điện Thoại</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        form {
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 200px;
        }
        input[type="submit"] {
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>DANH SÁCH ĐIỆN THOẠI</h2>
    <h3>Nguyễn Văn Hướng - DHTI15A5HN - 2110310115</h3>
    <form action="XLTimKiem2" method="POST">
        Nhập mã điện thoại: <input type="text" name="maDienThoai"/>
        <input type="submit" value="Tìm kiếm"/>
    </form>
    <!-- Bảng hiển thị toàn bộ dữ liệu -->
    <table>
        <thead>
            <tr>
                <th>Mã</th>
                <th>Tên</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
            </tr>
        </thead>
        <tbody>
            <%
                DecimalFormat df = new DecimalFormat("#,###");
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3366/qldt", "root", "");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM dienthoai");

                    while(rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("Ma") + "</td>");
                        out.println("<td>" + rs.getString("Ten") + "</td>");
                        out.println("<td>" + rs.getInt("Soluong") + "</td>");
                        out.println("<td>" + df.format(rs.getDouble("Dongia")) + "</td>");
                        out.println("</tr>");
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch(Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
    
    
</body>
</html>
