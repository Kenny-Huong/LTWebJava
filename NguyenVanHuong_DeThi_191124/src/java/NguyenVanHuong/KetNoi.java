/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package NguyenVanHuong;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author nguye
 */
public class KetNoi {
    public static Connection KNCSDL() throws SQLException{
        try {
            //Nạp trình điều khiển
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            //Thực hiện kết nối 
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3366/qlthisinh","root","");
            return cn;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(KetNoi.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}