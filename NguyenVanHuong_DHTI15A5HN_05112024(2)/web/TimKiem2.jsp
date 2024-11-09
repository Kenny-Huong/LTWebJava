<%-- 
    Document   : TimKiem2
    Created on : Nov 5, 2024, 1:37:25 PM
    Author     : nguye
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="ThuVien.DienThoai"%>
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
        <h1>Bảng Tìm Kiếm</h1>
    <!-- Bảng hiển thị kết quả tìm kiếm -->
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
                String maDienThoai = request.getParameter("maDienThoai");
                ArrayList<DienThoai> arrHT = (ArrayList<DienThoai>) request.getAttribute("arrsv");
                if(arrHT != null && !arrHT.isEmpty()){
                    for(DienThoai dt : arrHT){
            %>
            <tr>
                <td><%= dt.getMa() %></td>
                <td><%= dt.getTen() %></td>
                <td><%= dt.getSoluong() %></td>
                <td><%= df.format(dt.getDongia()) %></td>
            </tr>
            <%
                    }
                } else if (arrHT != null) { // Nếu đã tìm kiếm nhưng không có kết quả
            %>
            <tr>
                <td colspan="4">Không có dữ liệu của mã "<%= maDienThoai %>" đó trong bảng</td>
            </tr>
            <%
                } else {
            %>
            <tr>
                <td colspan="4">Vui lòng nhập mã để tìm kiếm</td>
            </tr>
            <%
                }
            %>

        </tbody>
    </table>
</body>
</html>