<%-- 
    Document   : DienTichHCN_NguyenVanHuong
    Created on : Oct 1, 2024, 10:08:12 AM
    Author     : nguye
--%>

<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tính Diện Tích Hình Chữ Nhật</title>
        
        
    </head>
    <body>
        <h1>Tính Diện Tích Hình Chữ Nhật</h1>
        <h2>Nguyễn Văn Hướng - DHTI15A5HN - 21103100115</h2>
        
        <form  method="post">
            <label for="a">Chiều dài:</label>
            <input type="text" id="a" name="a" required><br><br>
            
            <label for="b">Chiều rộng:</label>
            <input type="text" id="b" name="b" required=""><br><br>
            
            <input type="submit" value="Tính Diện Tích">
        </form>
        
        <%
        
        String chieuDai = request.getParameter("a");
        String chieuRong = request.getParameter("b");

        if (chieuDai != null && chieuRong != null) {
            
            double a = Double.parseDouble(chieuDai);
            double b = Double.parseDouble(chieuRong);

            if (a > 0 && b > 0) {
                
                double dienTich = a * b;
        %>
                <p class="result">Diện tích hình chữ nhật là: <%= dienTich %></p>
        <%
            } else {
             
                out.println("<p class='error'>Chiều dài và chiều rộng phải lớn hơn 0!</p>");
            }
        }
        %>
        
    </body>
</html>
