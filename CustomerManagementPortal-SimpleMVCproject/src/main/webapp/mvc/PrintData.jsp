<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="MVC.PrintData, MVC.RestaurantBean, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Data</title>
<style>
    .header-container {
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
    }
    h1 {
        color: #333;
        font-size: 50px;
        font-weight: bold;
        margin: 0;
    }
    .home-button {
        position: absolute;
        left: 150px;
        padding: 10px;
        background-color: #6598f7;
        color: white;
        font-weight: bold;
        text-decoration: none;
        border-radius: 5px;
    }
    .add-button {
        position: absolute;
        left: 260px;
        padding: 10px;
        background-color: #6598f7;
        color: white;
        font-weight: bold;
        text-decoration: none;
        border-radius: 5px;
    }
    table {
        width: 80%;
        border-collapse: collapse;
        margin: 20px auto;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #6598f7;
        color: white;
    }
</style>
</head>
<body>
    <div class="header-container">
        <!-- Home Button Positioned on the Top Left -->
        <a href="index.html" class="home-button">Home page</a>
        <a href="Restaurant.html" class="add-button">Add customer</a>
        
        <h1>Customer Details</h1>
    </div>

    <table>
    <tr>
        <th>Customer ID</th>
        <th>Item Name</th>
        <th>Price</th>
        <th>Feedback</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <%
        PrintData printData = new PrintData();
        ArrayList<RestaurantBean> customers = printData.getCustomerData();
        for (RestaurantBean customer : customers) {
    %>
    <tr>
        <td><%= customer.getC_id() %></td>
        <td><%= customer.getC_item() %></td>
        <td><%= customer.getPrice() %></td>
        <td><%= customer.getFeedback() %></td>
        <td><a href="editCustomer.jsp?customerId=<%= customer.getC_id() %>">Edit</a></td>
        <td><a href="deleteCustomer.jsp?customerId=<%= customer.getC_id() %>">Delete</a></td>
    </tr>
    <% } %>
</table>

</body>
</html>
