
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author nguye
 */
public class Test {
    public static void main(String[] args) throws SQLException {
        // Cài đặt UTF-8 cho console
        try {
            System.setOut(new PrintStream(System.out, true, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
        }
        
         
        Connection kn = KetNoi.KNCSDL();
        if(kn==null){
            System.out.println("Kết nối của đại vương có vấn đề");
        }else{
            System.out.println("Kết nối thành công rồi");
        }
    }
}
