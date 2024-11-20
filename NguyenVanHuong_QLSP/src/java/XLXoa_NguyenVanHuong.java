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
import java.sql.*;
/**
 *
 * @author nguye
 */
@WebServlet(urlPatterns = {"/XLXoa_NguyenVanHuong"})
public class XLXoa_NguyenVanHuong extends HttpServlet {

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
            out.println("<title>Servlet XLXoa_NguyenVanHuong</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet XLXoa_NguyenVanHuong at " + request.getContextPath() + "</h1>");
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
        Connection conn = null;
    PreparedStatement pstmt = null;
    String dbURL = "jdbc:mysql://localhost:3366/QLSanPham";
    String dbUser = "root";
    String dbPass = "";

    String maSP = request.getParameter("maSP");

    try {
        // Kết nối đến cơ sở dữ liệu
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Câu lệnh xóa sản phẩm theo mã sản phẩm
        String sql = "DELETE FROM SanPham WHERE MaSP = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(maSP));

        // Thực thi câu lệnh xóa
        int rowsAffected = pstmt.executeUpdate();

        // Nếu xóa thành công, gửi thông báo thành công
        if (rowsAffected > 0) {
            request.setAttribute("message", "Xóa sản phẩm thành công.");
        } else {
            // Nếu không tìm thấy sản phẩm để xóa, gửi thông báo lỗi
            request.setAttribute("message", "Không tìm thấy sản phẩm với mã " + maSP);
        }

        // Chuyển tiếp đến trang Xoa_NguyenVanHuong.jsp
        request.getRequestDispatcher("Xoa_NguyenVanHuong.jsp").forward(request, response);

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        }
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
