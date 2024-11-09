<%-- 
    T�i li?u   : Them_NguyenVanHuong.jsp
    Ng�y t?o   : 29 th�ng 10 n?m 2024, 10:48:09 AM
    T�c gi?    : Nguy?n V?n H??ng
--%>

<%@ page import="java.sql.*, java.util.ArrayList" %>
<%@ page import="com.example.XeMay" %> 

<%
    // Kh?i t?o danh s�ch ?? l?u tr? th�ng tin xe m�y
    ArrayList<XeMay> danhSachXe = new ArrayList<>();

    // K?t n?i ??n c? s? d? li?u
    String jdbcURL = "jdbc:mysql://localhost:3366/qlxemay"; // ??a ch? c? s? d? li?u
    String dbUser = "root"; // T�i kho?n ng??i d�ng
    String dbPassword = ""; // M?t kh?u (n?u c�)

    try {
        // T?i driver JDBC cho MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Thi?t l?p k?t n?i ??n c? s? d? li?u
        Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Truy v?n d? li?u t? b?ng xemay
        String sql = "SELECT * FROM xemay";
        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        // Th�m c�c b?n ghi v�o danh s�ch
        while (resultSet.next()) {
            int ma = resultSet.getInt("Ma"); // L?y m� xe
            String ten = resultSet.getString("Ten"); // L?y t�n xe
            String hangSX = resultSet.getString("HangSX"); // L?y h�ng s?n xu?t
            String mau = resultSet.getString("Mau"); // L?y m�u

            XeMay xeMay = new XeMay(ma, ten, hangSX, mau);
            danhSachXe.add(xeMay);
        }

        // ?�ng k?t n?i
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
    <title>Th�m Xe M�y</title>
    <style>
        table { width: 50%; border-collapse: collapse; margin: 20px 0; }
        table, th, td { border: 1px solid black; }
        th, td { padding: 10px; text-align: center; }
    </style>
</head>
<body>
    <h2>Th�m Th�ng Tin Xe M�y</h2>
    <form action="HTServlet_NguyenVanHuong" method="post">
        <label for="ten">T�n:</label>
        <input type="text" id="ten" name="ten" required><br>

        <label for="hangSX">H�ng SX :</label>
        <input type="text" id="hangSX" name="hangSX" required><br>

        <label for="mau">M�u:</label>
        <input type="text" id="mau" name="mau" required><br>

        <input type="submit" value="Th�m">
    </form>

    <h3>Danh S�ch Xe M�y Hi�n C�</h3>
    <table border="1">
        <tr>
            <th>M�</th>
            <th>T�n</th>
            <th>H�ng S?n Xu?t</th>
            <th>M�u</th>
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
