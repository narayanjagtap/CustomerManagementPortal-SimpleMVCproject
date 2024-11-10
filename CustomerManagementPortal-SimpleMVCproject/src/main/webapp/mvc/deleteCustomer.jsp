<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }
        .message-container {
            text-align: center;
            padding: 20px;
            margin-top: 50px;
        }
        .back-button {
            display: inline-block;
            margin: 20px auto;
            padding: 10px 15px;
            background-color: #6598f7;
            color: white;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <a href="index.html" class="back-button">Home Page</a>
        <a href="Restaurant.html" class="back-button">Add Customer</a>
        <a href="PrintData.jsp" class="back-button">View Customer</a>
    </div>

    <%
        String c_id = request.getParameter("customerId");

        if (c_id != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mvc", "root", "Sumit4403");
                PreparedStatement ps = con.prepareStatement("DELETE FROM restaurant WHERE c_id = ?");
                ps.setString(1, c_id);

                int result = ps.executeUpdate();

                if (result > 0) {
    %>
                    <div class="message-container">
                        <h2>Customer deleted successfully!</h2>
                    </div>
    <%
                } else {
    %>
                    <div class="message-container">
                        <h2>Failed to delete customer. Customer ID not found.</h2>
                    </div>
    <%
                }
                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
    %>
                <div class="message-container">
                    <h2>Error: <%= e.getMessage() %></h2>
                </div>
    <%
            }
        } else {
    %>
            <div class="message-container">
                <h2>Customer ID is missing. Please provide a valid ID.</h2>
            </div>
    <%
        }
    %>
</body>
</html>
