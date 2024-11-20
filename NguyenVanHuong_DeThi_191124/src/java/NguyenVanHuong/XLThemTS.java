/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package NguyenVanHuong;

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
@WebServlet(name = "XLThemTS", urlPatterns = {"/XLThemTS"})
public class XLThemTS extends HttpServlet {

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
            out.println("<title>Servlet XLThemTS</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet XLThemTS at " + request.getContextPath() + "</h1>");
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
        String soBaoDanh = request.getParameter("SoBaoDanh");
        String hoTen = request.getParameter("HoTen");
        String diemToanStr = request.getParameter("DiemToan");
        String diemVanStr = request.getParameter("DiemVan");

        float diemToan = 0;
        float diemVan = 0;
        String message = "";

        try {
            diemToan = Float.parseFloat(diemToanStr);
            diemVan = Float.parseFloat(diemVanStr);
        } catch (NumberFormatException e) {
            message = "Điểm nhập không hợp lệ!";
        }

        Connection conn = null;
        PreparedStatement psCheck = null;
        PreparedStatement psInsert = null;
        ResultSet rs = null;

        try {
            conn = KetNoi.KNCSDL();

            // Kiểm tra số báo danh trùng lặp
            String checkQuery = "SELECT * FROM ThiSinh WHERE SBD = ?";
            psCheck = conn.prepareStatement(checkQuery);
            psCheck.setString(1, soBaoDanh);
            rs = psCheck.executeQuery();

            if (rs.next()) {
                message = "Số báo danh " +soBaoDanh+" đã tồn tại!";
            } else {
                String insertQuery = "INSERT INTO ThiSinh (SBD, HoTen, DiemToan, DiemVan) VALUES (?, ?, ?, ?)";
                psInsert = conn.prepareStatement(insertQuery);
                psInsert.setString(1, soBaoDanh);
                psInsert.setString(2, hoTen);
                psInsert.setFloat(3, diemToan);
                psInsert.setFloat(4, diemVan);

                int rowsInserted = psInsert.executeUpdate();
                if (rowsInserted > 0) {
                    message = "Thêm thành công Thí Sinh với SBD "+soBaoDanh+"!";
                } else {
                    message = "Lỗi thêm thí sinh!";
                }
            }
        } catch (Exception e) {
            message = "Lỗi: " + e.getMessage();
        } finally {
            try {
                if (rs != null) rs.close();
                if (psCheck != null) psCheck.close();
                if (psInsert != null) psInsert.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        // Gửi dữ liệu về lại JSP
        request.setAttribute("SBD", soBaoDanh);
        request.setAttribute("Hoten", hoTen);
        request.setAttribute("DiemToan", diemToanStr);
        request.setAttribute("DiemVan", diemVanStr);
        request.setAttribute("message", message);

        request.getRequestDispatcher("ThemTS.jsp").forward(request, response);
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
