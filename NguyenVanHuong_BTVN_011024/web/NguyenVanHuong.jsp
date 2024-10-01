<%-- 
    Document   : NguyenVanHuong
    Created on : Oct 1, 2024, 9:54:39 AM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Caculator</title>
        
        <style>
            body {
            font-family: Arial, sans-serif;
            background-color: #e0e0e0;
            text-align: center;
            padding: 50px;
        }
        .container {
            background-color: #db95b7;
            border-radius: 10px;
            display: inline-block;
            padding: 20px; /* Thêm padding cho container */
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-right: 20px;
        }
        label {
            display: inline-block;
            width: 150px; 
            text-align: left;
            margin: 10px 0px 10px 50px;
        }
        input[type="number"] {
            padding: 5px;
            border: 2px solid #ccc;
            display: inline-block;
            width: 150px;
        }
        input[type="text"] {
            padding: 5px;
            border: 2px solid #ccc;
            display: inline-block;
            width: 150px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px 30px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        input[readonly] {
            background-color: #ffffd2;
            color: black;
        }
        

        h1 {
            background-color: #c63768;
            margin: 0 0 10px 0;
            width: 450px;
            height: 60px;
            line-height: 60px;
            color: white; /* Đổi màu chữ cho dễ đọc */
            text-align: center; /* Căn giữa văn bản */
        }
        </style>
    </head>
    <body>
        <div class = "container">
            <form method="POST">
                <h1>Cộng Trừ Nhân Chia</h1>
                <div class = "form-group">
                    <label for="a">Nhập a :</label>
                    <input type="number" name="a" id="a" required="">
                </div>
                
                <div class = "form-group">
                    <label for="b">Nhập b :</label>
                    <input type="number" name="b" id="b" required="">
                </div>
                
                <div class = "form-group">
                    <label for="result">Kết quả :</label>
                    <input type="number" name="result" id="result" readonly>
                </div>
                
                <input type="submit" value="+">
                <input type="submit" value="-">
                <input type="submit" value="*">
                <input type="submit" value="/">
                <input type="reset" name="reset">
                
            </form>
        </div>
        
        <%
            
        %>
    </body>
</html>
