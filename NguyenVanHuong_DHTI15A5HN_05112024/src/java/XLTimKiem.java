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
import java.math.BigDecimal;
import java.sql.*;

/**
 *
 * @author nguye
 */
@WebServlet(urlPatterns = {"/XLTimKiem"})
public class XLTimKiem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet XLTimKiem</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet XLTimKiem at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maDienThoai = request.getParameter("maDienThoai");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3366/qldt", "root", "");

            String sql = "SELECT * FROM dienthoai WHERE Ma = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, maDienThoai);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                out.println("<h2>Kết quả tìm kiếm:</h2>");
                out.println("<p>Mã: " + rs.getString("Ma") + "</p>");
                out.println("<p>Tên: " + rs.getString("Ten") + "</p>");
                out.println("<p>Số lượng: " + rs.getInt("Soluong") + "</p>");

                // Sử dụng BigDecimal để đảm bảo độ chính xác và tránh hiển thị dưới dạng khoa học
                BigDecimal dongia = rs.getBigDecimal("Dongia");
                out.println("<p>Đơn giá: " + dongia.toPlainString() + "</p>");
            } else {
                out.println("<h2>Không có mã điện thoại cần tìm</h2>");
            }


            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<h3>Warniggg !!!!!! Cảnh báo</h3>");
            out.println("<p>Lỗi khi tìm kiếm dữ liệu.</p>");
        } finally {
            out.close();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
