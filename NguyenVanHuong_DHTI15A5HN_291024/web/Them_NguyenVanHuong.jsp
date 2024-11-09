<%-- 
    Tài li?u   : Them_NguyenVanHuong.jsp
    Ngày t?o   : 29 tháng 10 n?m 2024, 10:48:09 AM
    Tác gi?    : Nguy?n V?n H??ng
--%>

<%@ page import="java.sql.*, java.util.ArrayList" %>
<%@ page import="com.example.XeMay" %> 

<%
    // Kh?i t?o danh sách ?? l?u tr? thông tin xe máy
    ArrayList<XeMay> danhSachXe = new ArrayList<>();

    // K?t n?i ??n c? s? d? li?u
    String jdbcURL = "jdbc:mysql://localhost:3366/qlxemay"; // ??a ch? c? s? d? li?u
    String dbUser = "root"; // Tài kho?n ng??i dùng
    String dbPassword = ""; // M?t kh?u (n?u có)

    try {
        // T?i driver JDBC cho MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Thi?t l?p k?t n?i ??n c? s? d? li?u
        Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Truy v?n d? li?u t? b?ng xemay
        String sql = "SELECT * FROM xemay";
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        // Thêm các b?n ghi vào danh sách
        while (resultSet.next()) {
            int ma = resultSet.getInt("Ma"); // L?y mã xe
            String ten = resultSet.getString("Ten"); // L?y tên xe
            String hangSX = resultSet.getString("HangSX"); // L?y hãng s?n xu?t
            String mau = resultSet.getString("Mau"); // L?y màu

            XeMay xeMay = new XeMay(ma, ten, hangSX, mau);
            danhSachXe.add(xeMay);
        }

        // ?óng k?t n?i
        resultSet.close();
        statement.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Xe Máy</title>
    <style>
        table { width: 50%; border-collapse: collapse; margin: 20px 0; }
        table, th, td { border: 1px solid black; }
        th, td { padding: 10px; text-align: center; }
    </style>
</head>
<body>
    <h2>Thêm Thông Tin Xe Máy</h2>
    <form action="HTServlet_NguyenVanHuong" method="post">
        <label for="ten">Tên:</label>
        <input type="text" id="ten" name="ten" required><br>

        <label for="hangSX">Hãng SX :</label>
        <input type="text" id="hangSX" name="hangSX" required><br>

        <label for="mau">Màu:</label>
        <input type="text" id="mau" name="mau" required><br>

        <input type="submit" value="Thêm">
    </form>

    <h3>Danh Sách Xe Máy Hiên Có</h3>
    <table border="1">
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Hãng S?n Xu?t</th>
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
