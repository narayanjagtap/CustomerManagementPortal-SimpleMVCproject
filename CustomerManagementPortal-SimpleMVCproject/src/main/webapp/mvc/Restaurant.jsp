<%@ page import="MVC.RestaurantBean, MVC.RestaurantDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Controller_JSP_File</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }
        .message-container {
            display: flex;
            justify-content: center;
            padding: 20px;
            margin-top: 50px;
        }
        .message-box {
            border: 2px solid #6598f7;
            width: 400px;
            padding: 20px;
            position: relative;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .message-box h1 {
            text-align: center;
            color: #333;
        }
        .status-label {
            position: absolute;
            top: -15px;
            left: 10px;
            background-color: #6598f7;
            color: white;
            padding: 0 5px;
            font-weight: bold;
            border-radius: 3px;
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
            text-align: center;
        }
        .back-button:hover {
            background-color: #527ad9;
        }
    </style>
</head>
<body>

    <!-- Back to Home Button -->
    <div style="text-align: center;">
        <a href="index.html" class="back-button">Home page</a>
        <a href="Restaurant.html" class="back-button">Add customer</a>
        <a href="PrintData.jsp" class="back-button">View customer</a>
    </div>

    <%
        String c_id = request.getParameter("c_id");
        String c_item = request.getParameter("c_item");
        String price = request.getParameter("price");
        String feedback = request.getParameter("feedback");

        RestaurantBean restaurant = new RestaurantBean();
        restaurant.setC_id(c_id);
        restaurant.setC_item(c_item);
        restaurant.setPrice(price);
        restaurant.setFeedback(feedback);

        int result = RestaurantDAO.saveData(restaurant);

        if (result > 0) {
    %>
        <div class="message-container">
            <div class="message-box">
                <span class="status-label">Success</span>
                <h1>Data saved successfully!</h1>
            </div>
        </div>
    <%
        } else {
    %>
        <div class="message-container">
            <div class="message-box">
                <span class="status-label">Error</span>
                <h1>Failed to save data. Please try again.</h1>
            </div>
        </div>
    <%
        }
    %>

</body>
</html>
