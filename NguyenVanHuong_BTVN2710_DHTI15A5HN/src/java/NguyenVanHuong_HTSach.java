/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.sql.*; // Đảm bảo nhập khẩu đúng các lớp JDBC

/**
 *
 * @author nguye
 */
@WebServlet(urlPatterns = {"/NguyenVanHuong_HTSach"})
public class NguyenVanHuong_HTSach extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        ArrayList<String> sachList = new ArrayList<>();
        Connection c = null; // Khai báo biến Connection

        try {
            // Kết nối đến cơ sở dữ liệu qua class KetNoi
            c = KetNoi.KNCSDL(); // Sử dụng phương thức KNCSDL

            if (c == null) {
                out.println("Không thể kết nối đến cơ sở dữ liệu.");
                return;
            }

            // Truy vấn dữ liệu từ bảng Sach
            String query = "SELECT Ma, Ten, Tacgia, NhaXB FROM sach";
            try (PreparedStatement stmt = c.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
                // Lưu các bản ghi vào ArrayList
                while (rs.next()) {
                    String sach = "Ma: " + rs.getString("Ma") + ", Ten: " + rs.getString("Ten") +
                            ", Tacgia: " + rs.getString("Tacgia") + ", NhaXB: " + rs.getString("NhaXB");
                    sachList.add(sach);
                }

                // Hiển thị các bản ghi từ ArrayList ra màn hình
                for (String sach : sachList) {
                    out.println("<p>" + sach + "</p>");
                }
            } // Tự động đóng PreparedStatement và ResultSet
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("Lỗi: " + e.getMessage());
        } finally {
            // Đóng kết nối nếu không null
            if (c != null) {
                try {
                    c.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            out.close();
        }
    }
}
