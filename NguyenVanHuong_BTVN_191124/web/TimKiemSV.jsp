<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="QLSinhVien.KetNoi"%>
<!DOCTYPE html>
<html>
<head>
    <title>Tìm kiếm sinh viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }
        
        h2 {
            color: #333;
        }

        h3 {
            color: #4CAF50;
        }

        .search-form {
            text-align: center;
            margin: 20px;
        }

        .search-form input {
            padding: 10px;
            margin: 5px;
            width: 250px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .search-form button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .search-form button:hover {
            background-color: #45a049;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-results {
            text-align: center;
            color: red;
            font-weight: bold;
        }

        .error {
            text-align: center;
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Tìm kiếm thông tin sinh viên - Nguyễn Văn Hướng</h2>

    <!-- Form tìm kiếm -->
    <div class="search-form">
        <form action="TimKiemSV.jsp" method="get">
            <label for="masv">Nhập mã sinh viên:</label>
            <!-- Giữ lại giá trị đã nhập vào ô input -->
            <input type="text" id="masv" name="masv" placeholder="Nhập mã sinh viên" value="${param.masv}" required>
            <button type="submit">Tìm kiếm</button>
        </form>
    </div>

    <% 
        String masv = request.getParameter("masv");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = KetNoi.KNCSDL();
            
            // Hiển thị danh sách toàn bộ sinh viên
            String queryDanhSach = "SELECT * FROM sinhvien";
            ps = con.prepareStatement(queryDanhSach);
            rs = ps.executeQuery();
    %>

    <h3 style="text-align: center;">Danh sách sinh viên</h3>
    <table>
        <thead>
            <tr>
                <th>Mã SV</th>
                <th>Họ và tên</th>
                <th>Ngày sinh</th>
                <th>Điểm trung bình</th>
                <th>Học bổng</th>
            </tr>
        </thead>
        <tbody>
            <% 
                while (rs.next()) { 
                    float diemTB = rs.getFloat("DiemTB");
                    int hocBong = diemTB >= 9 ? 5000000 : (diemTB >= 8.5 ? 3000000 : 0);
            %>
            <tr>
                <td><%= rs.getString("MaSV") %></td>
                <td><%= rs.getString("HoTen") %></td>
                <td><%= rs.getDate("NgaySinh") %></td>
                <td><%= diemTB %></td>
                <td><%= (hocBong > 0 ? hocBong + " VNĐ" : "Không có học bổng") %></td>
            </tr>
            <% 
                } 
            %>
        </tbody>
    </table>

    <%   
            rs.close();
           
            if (masv != null && !masv.trim().isEmpty()) {
                String queryTimKiem = "SELECT * FROM sinhvien WHERE MaSV = ?";
                ps = con.prepareStatement(queryTimKiem);
                ps.setString(1, masv);
                rs = ps.executeQuery();
                
                if (rs.next()) {
                    String hoTen = rs.getString("HoTen");
                    Date ngaySinh = rs.getDate("NgaySinh");
                    float diemTB = rs.getFloat("DiemTB");
                    int hocBong = diemTB >= 9 ? 5000000 : (diemTB >= 8.5 ? 3000000 : 0);
    %>
    <h3 style="text-align: center;">Kết quả tìm kiếm</h3>
    <table>
        <thead>
            <tr>
                <th>Mã SV</th>
                <th>Họ và tên</th>
                <th>Ngày sinh</th>
                <th>Điểm trung bình</th>
                <th>Học bổng</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= masv %></td>
                <td><%= hoTen %></td>
                <td><%= ngaySinh %></td>
                <td><%= diemTB %></td>
                <td><%= (hocBong > 0 ? hocBong + " VNĐ" : "Không có học bổng") %></td>
            </tr>
        </tbody>
    </table>
    <% 
                } else { 
    %>
    <p class="no-results">Không tìm thấy sinh viên với mã: <%= masv %></p>
    <% 
                } 
            } 
        } catch (SQLException e) { 
    %>
    <p class="error">Lỗi kết nối cơ sở dữ liệu: <%= e.getMessage() %></p>
    <% 
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
