/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.*;
/**
 *
 * @author nguye
 */
public class KetNoi {
    public static Connection KNCSDL() throws SQLException {
        
       try {
            // Nạp trình điều khiển
            Class.forName("com.mysql.cj.jdbc.Driver"); // Đảm bảo sử dụng driver đúng
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver không tìm thấy", e);
        }
        
        // Kết nối đến cơ sở dữ liệu
        return DriverManager.getConnection("jdbc:mysql://localhost:3366/qlsach?useSSL=false&serverTimezone=UTC", "root", "");
    }
}
