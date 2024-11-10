# Customer Management Portal

This is a simple Java MVC (Model-View-Controller) web application built using JSP and JDBC. It allows users to add, view, edit, and delete customer records from a MySQL database. The application is designed for managing customer details in a restaurant setting.

## Features

- **Add Customer**: Add new customer details such as item ordered, price, and feedback.
- **View Customer**: View all customer records from the database.
- **Edit Customer**: Update existing customer details.
- **Delete Customer**: Remove customer records from the database.

## Project Structure

The project follows the MVC design pattern, with the structure as shown below:

```
CustomerManagementPortal-SimpleMVCproject
├── src/main/java
│   └── MVC
│       ├── RestaurantBean.java     // Java Bean for Customer data
│       ├── RestaurantDAO.java      // Data Access Object for database operations
│       ├── PrintData.java          // Controller for printing customer data
│       └── package-info.java
├── src/main/webapp
│   ├── index.html                  // Home page with options to add/view customer
│   ├── mvc
│       ├── addCustomer.jsp         // Page to add customer details
│       ├── editCustomer.jsp        // Page to edit customer details
│       ├── deleteCustomer.jsp      // Page to delete customer details
│       ├── PrintData.jsp           // Page to view customer details
│   ├── WEB-INF
│       └── lib                     // Contains necessary libraries
└── build
```

## Technologies Used

- **Java** (JSP, JDBC)
- **MySQL** for the database
- **HTML/CSS** for front-end design
- **Eclipse** as the IDE

## Screenshots

### Home Page
![Home Page](https://github.com/narayanjagtap/CustomerManagementPortal-SimpleMVCproject/blob/main/images/home.png)

### Add Customer
![Edit Customer](https://github.com/narayanjagtap/CustomerManagementPortal-SimpleMVCproject/blob/main/images/add.png)

### View Customer
![Edit Customer](https://github.com/narayanjagtap/CustomerManagementPortal-SimpleMVCproject/blob/main/images/list.png)

### Edit Customer
![Edit Customer](https://github.com/narayanjagtap/CustomerManagementPortal-SimpleMVCproject/blob/main/images/update.png)

### Delete Customer
![Edit Customer](https://github.com/narayanjagtap/CustomerManagementPortal-SimpleMVCproject/blob/main/images/delete.png)


## Contributing

Feel free to submit issues or pull requests to enhance the project. Ensure that your code follows the MVC pattern for maintainability.
