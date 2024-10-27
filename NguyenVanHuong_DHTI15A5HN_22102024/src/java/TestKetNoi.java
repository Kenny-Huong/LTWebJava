/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 *
 * @author nguye
 */
@WebServlet(urlPatterns = {"/TestKetNoi"})
public class TestKetNoi extends HttpServlet {

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
            out.println("<title>Servlet TestKetNoi</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TestKetNoi at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        Connection ketnoi = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            out.println("<html><head>");
            out.println("<style>");
            out.println("body { font-family: Arial, sans-serif; margin: 20px; }");
            out.println("table { width: 450px; border-collapse: collapse; }");
            out.println("table, th, td { border: 2px solid black; padding: 10px; text-align: center;}");
            out.println("th { background-color: #f2f2f2; }");
            out.println("</style>");
            out.println("</head><body>");

            // Thiết lập kết nối cơ sở dữ liệu
            ketnoi = KetNoi.KNCSDL();
     
            // Khởi tạo đối tượng Statement
            statement = ketnoi.createStatement();
            
            // Thực thi câu lệnh SQL
            String sql = "SELECT * FROM sinhvien";
            resultSet = statement.executeQuery(sql);
            

            // Bắt đầu bảng hiển thị
            out.print("<h1>Danh Sách Sinh Viên</h1>");
            out.print("<h1>Nguyễn Văn Hướng - DHTI15A5HN</h1>");
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>Mã sinh viên</th>");
            out.println("<th>Tên sinh viên</th>");
            out.println("</tr>");
             
            //Đọc các bản ghi trong resultSet và hiển thị lên trình duyệt
            // Duyệt qua dữ liệu sinh viên và hiển thị
            while (resultSet.next()) {
                String masv = resultSet.getString("id_sinhvien");
                String tensv = resultSet.getString("ten_sinhvien");
                

                out.println("<tr>");
                out.println("<td>" + masv + "</td>");
                out.println("<td>" + tensv + "</td>");
               
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</body></html>");


            
        } catch (SQLException e) {
            out.println("Lỗi: " + e.getMessage());
        } finally {
            // Đóng tài nguyên
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (ketnoi != null) ketnoi.close();
            } catch (SQLException e) {
            }
        }
        out.close();    
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
        processRequest(request, response);
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
