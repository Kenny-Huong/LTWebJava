import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = {"/XLTimKiem2"})
public class XLTimKiem2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maDienThoai = request.getParameter("maDienThoai");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
     
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3366/qldt", "root", "");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM dienthoai WHERE Ma = ?")) {

            stmt.setString(1, maDienThoai);
            ResultSet rs = stmt.executeQuery();

            ArrayList<DienThoai> arr = new ArrayList<>();
            while (rs.next()) {
                DienThoai dt = new DienThoai();
                dt.setMa(rs.getString("Ma"));
                dt.setTen(rs.getString("Ten"));
                dt.setSoluong(rs.getInt("Soluong"));
                dt.setDongia(rs.getDouble("Dongia"));
                arr.add(dt);
            }

            request.setAttribute("arrsv", arr);
            request.getRequestDispatcher("TimKiem2.jsp").forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(XLTimKiem2.class.getName()).log(Level.SEVERE, null, ex);
            out.println("<p>An error occurred while processing the request. Please try again later.</p>");
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Servlet xử lý tìm kiếm điện thoại";
    }
}
