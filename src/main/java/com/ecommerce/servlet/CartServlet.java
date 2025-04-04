package com.ecommerce.servlet;

import com.ecommerce.model.CartItem;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        // Handle Add to Cart action
        if ("add".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            double price = Double.parseDouble(request.getParameter("price"));
            String name = request.getParameter("name");
            int quantity = 1;  // Default quantity is 1

            CartItem item = new CartItem(productId, name, price, quantity);
            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }
            cart.add(item);
            session.setAttribute("cart", cart);
        } 
        // Handle Remove from Cart action
        else if ("remove".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            HttpSession session = request.getSession();
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            cart.removeIf(item -> item.getId() == productId);
            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart.jsp");
    }
}
