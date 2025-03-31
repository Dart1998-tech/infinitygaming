package org.generationitaly.infinitygaming.controller;

import java.io.IOException;

import org.generationitaly.infinitygaming.repository.CartItemRepository;
import org.generationitaly.infinitygaming.repository.impl.CartItemRepositoryImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/elimina-item")
public class DeleteCartItemServlet extends HttpServlet {
	
	private CartItemRepository cartItemRepository = CartItemRepositoryImpl.getInstance();
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		

		HttpSession session = request.getSession();
		if (session.getAttribute("utente") == null) {
			response.sendRedirect("login");
			return;
		}
		
		long idCartItem= Long.parseLong(request.getParameter("idCartItem"));

		cartItemRepository.deleteById(idCartItem);

		response.sendRedirect("carrello");
	}

}
