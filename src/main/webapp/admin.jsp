<%@ page import="java.sql.*" %>
<%@ page import="com.ecommerce.dao.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Panel - E-Commerce</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="text-center text-danger">Admin Dashboard</h2>
    <h4 class="text-center text-primary">Product List</h4>
    <table class="table table-striped mt-3">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM products");
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td>$<%= rs.getDouble("price") %></td>
                <td>
                    <a href="AdminServlet?action=delete&id=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
                </td>
            </tr>
            <%
                }
                conn.close();
            %>
        </tbody>
    </table>
</div>

</body>
</html>
