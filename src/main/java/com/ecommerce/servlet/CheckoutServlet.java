package com.ecommerce.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("payment");

        // Here, we could add logic to process the order, save to DB, etc.
        HttpSession session = request.getSession();
        session.setAttribute("orderDetails", "Full Name: " + fullname + ", Address: " + address + ", Payment: " + paymentMethod);

        // Clear the cart after checkout
        session.removeAttribute("cart");

        response.sendRedirect("orderConfirmation.jsp");
    }
}
