<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="com.ecommerce.dao.DBConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop - E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Navbar -->
<jsp:include page="navbar.jsp"/>

<!-- Hero Section -->
<div class="container mt-5">
    <div class="row text-center">
        <div class="col-md-12">
            <h1 class="display-4">Shop Our Products</h1>
            <p>Explore products in different categories and enjoy shopping online with us!</p>
        </div>
    </div>
</div>

<!-- Filter Section -->
<div class="container mt-5">
    <div class="row">
        <!-- Sidebar for Categories -->
        <div class="col-md-3">
            <h4>Filter by Category</h4>
            <form action="ProductServlet" method="get">
                <div class="list-group">
                    <a href="ProductServlet?category=Electronics" class="list-group-item list-group-item-action">Electronics</a>
                    <a href="ProductServlet?category=Fashion" class="list-group-item list-group-item-action">Fashion</a>
                    <a href="ProductServlet?category=Home" class="list-group-item list-group-item-action">Home & Kitchen</a>
                    <a href="ProductServlet?category=Beauty" class="list-group-item list-group-item-action">Beauty & Personal Care</a>
                    <a href="ProductServlet?category=Sports" class="list-group-item list-group-item-action">Sports</a>
                    <a href="ProductServlet" class="list-group-item list-group-item-action">All Products</a>
                </div>
            </form>
        </div>

        <!-- Product Section -->
        <div class="col-md-9">
            <h2 class="text-center">Featured Products</h2>
            <div class="row">
                <%
                    List<Product> productList = (List<Product>) request.getAttribute("productList");
                    if (productList != null && !productList.isEmpty()) {
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
                    <p>No products available in this category.</p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
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
