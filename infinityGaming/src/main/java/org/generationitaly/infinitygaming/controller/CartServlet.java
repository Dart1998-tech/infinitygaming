package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.List;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.CartItem;
import org.generationitaly.infinitygaming.entity.Utente;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/carrello")
public class CartServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    	HttpSession session = request.getSession();
		if (session.getAttribute("utente") == null) {
			response.sendRedirect("login");
			return;
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("carrello.jsp");
		requestDispatcher.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    	HttpSession session = request.getSession();
		if (session.getAttribute("utente") == null) {
			response.sendRedirect("login");
			return;
		}
    }
}
