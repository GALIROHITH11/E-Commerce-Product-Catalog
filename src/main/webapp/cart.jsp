<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.ecommerce.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart - E-Commerce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Navbar -->
<jsp:include page="navbar.jsp"/>

<!-- Cart Section -->
<div class="container mt-5">
    <h2 class="text-center">Your Shopping Cart</h2>
    
    <%
        HttpSession sessionCart = request.getSession();
        List<CartItem> cart = (List<CartItem>) sessionCart.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
    %>
        <div class="text-center mt-4">
            <h4>Your cart is empty!</h4>
            <p>Browse our products and add items to your cart.</p>
            <a href="shop.jsp" class="btn btn-primary">Continue Shopping</a>
        </div>
    <%
        } else {
    %>

    <table class="table table-bordered mt-4">
        <thead class="table-dark">
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                double grandTotal = 0;
                for (CartItem item : cart) { 
                    double totalPrice = item.getPrice() * item.getQuantity();
                    grandTotal += totalPrice;
            %>
            <tr>
                <td><%= item.getName() %></td>
                <td>$<%= item.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= totalPrice %></td>
                <td>
                    <a href="CartServlet?action=remove&id=<%= item.getId() %>" class="btn btn-danger btn-sm">Remove</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <div class="d-flex justify-content-between mt-4">
        <h4>Total: $<%= grandTotal %></h4>
        <a href="checkout.jsp" class="btn btn-success">Proceed to Checkout</a>
    </div>

    <% } %>

</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-4 mt-5">
    <p>&copy; 2025 E-Commerce. All rights reserved.</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
