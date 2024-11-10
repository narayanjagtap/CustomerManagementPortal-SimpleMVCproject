<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }
        .message-container, .form-container {
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
        .form-container {
            max-width: 400px;
            margin: 0 auto;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #6598f7;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #4a80db;
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
        String c_item = "";
        String price = "";
        String feedback = "";

        if (c_id != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/mvc", "root", "Sumit4403");
                
                // Retrieve existing customer details to populate the form
                PreparedStatement psSelect = con.prepareStatement("SELECT * FROM restaurant WHERE c_id = ?");
                psSelect.setString(1, c_id);
                ResultSet rs = psSelect.executeQuery();

                if (rs.next()) {
                    c_item = rs.getString("c_item");
                    price = rs.getString("price");
                    feedback = rs.getString("feedback");
                }

                rs.close();
                psSelect.close();

                // Check if form data is submitted
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    c_item = request.getParameter("c_item");
                    price = request.getParameter("price");
                    feedback = request.getParameter("feedback");

                    PreparedStatement psUpdate = con.prepareStatement("UPDATE restaurant SET c_item = ?, price = ?, feedback = ? WHERE c_id = ?");
                    psUpdate.setString(1, c_item);
                    psUpdate.setString(2, price);
                    psUpdate.setString(3, feedback);
                    psUpdate.setString(4, c_id);

                    int result = psUpdate.executeUpdate();

                    if (result > 0) {
                        out.println("<div class='message-container'><h2>Customer details updated successfully!</h2></div>");
                    } else {
                        out.println("<div class='message-container'><h2>Failed to update customer details. Please check the customer ID.</h2></div>");
                    }

                    psUpdate.close();
                }

                con.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='message-container'><h2>Error: " + e.getMessage() + "</h2></div>");
            }
        } else {
            out.println("<div class='message-container'><h2>Customer ID is missing in the request.</h2></div>");
        }
    %>

    <!-- Form for editing customer details -->
    <div class="form-container">
        <form method="post" action="editCustomer.jsp">
            <input type="hidden" name="customerId" value="<%= c_id %>">
            <label for="c_item">Item:</label>
            <input type="text" name="c_item" value="<%= c_item %>" required>
            <label for="price">Price:</label>
            <input type="text" name="price" value="<%= price %>" required>
            <label for="feedback">Feedback:</label>
            <input type="text" name="feedback" value="<%= feedback %>" required>
            <button type="submit">Update</button>
        </form>
    </div>

</body>
</html>
