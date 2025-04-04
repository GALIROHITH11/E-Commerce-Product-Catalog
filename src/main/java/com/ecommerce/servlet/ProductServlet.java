package com.ecommerce.servlet;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet handling product-related actions such as adding, deleting, and displaying products.
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            productDAO.deleteProduct(productId);
            response.sendRedirect("manageProducts.jsp?message=Product Deleted Successfully");
        } else {
            List<Product> productList = productDAO.getAllProducts();
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("addProduct".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String image = request.getParameter("image");
            String category = request.getParameter("category");

            Product product = new Product(name, price, image, category);
            boolean success = productDAO.addProduct(product);

            if (success) {
                response.sendRedirect("manageProducts.jsp?message=Product Added Successfully");
            } else {
                response.sendRedirect("manageProducts.jsp?error=Failed to Add Product");
            }
        }
    }
}
