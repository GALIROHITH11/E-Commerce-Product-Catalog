<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ecommerce.model.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List - E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Navbar -->
<jsp:include page="navbar.jsp"/>

<!-- Product Section -->
<div class="container mt-5">
    <h2 class="text-center">Our Products</h2>
    <div class="row">
        <% 
            // Fetch the product list from the request attribute
            List<Product> productList = (List<Product>) request.getAttribute("productList");
            
            if (productList != null && !productList.isEmpty()) {
                // Loop through the product list and display each product
                for (Product product : productList) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm">
                <img src="images/<%= product.getImage() %>" class="card-img-top" alt="<%= product.getName() %>">
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <p class="card-text">$<%= product.getPrice() %></p>
                    <a href="CartServlet?action=add&id=<%= product.getId() %>&name=<%= product.getName() %>&price=<%= product.getPrice() %>&quantity=1" class="btn btn-primary w-100">Add to Cart</a>
                </div>
            </div>
        </div>
        <% 
                } 
            } else {
        %>
        <div class="col-md-12 text-center">
            <p>No products found.</p>
        </div>
        <% 
            }
        %>
    </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-4 mt-5">
    <p>&copy; 2025 E-Commerce. All rights reserved.</p>
</footer>

<!-- Bootstrap JS and Dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
