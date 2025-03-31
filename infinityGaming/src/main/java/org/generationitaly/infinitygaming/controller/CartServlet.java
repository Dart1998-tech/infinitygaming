package org.generationitaly.infinitygaming.controller;

import java.io.IOException;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.CartItem;
import org.generationitaly.infinitygaming.entity.Gioco;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.CartItemRepository;
import org.generationitaly.infinitygaming.repository.CartRepository;
import org.generationitaly.infinitygaming.repository.GiocoRepository;
import org.generationitaly.infinitygaming.repository.impl.CartItemRepositoryImpl;
import org.generationitaly.infinitygaming.repository.impl.CartRepositoryImpl;
import org.generationitaly.infinitygaming.repository.impl.GiocoRepositoryImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/carrello")
public class CartServlet extends HttpServlet {

	private GiocoRepository giocoRepository = GiocoRepositoryImpl.getInstance();
	private CartItemRepository cartItemRepository = CartItemRepositoryImpl.getInstance();
	private CartRepository cartRepository = CartRepositoryImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("utente") == null) {
			response.sendRedirect("login");
			return;
		}

		Utente utente = (Utente) session.getAttribute("utente");
		Cart cart = cartRepository.findByUtente(utente);

		request.setAttribute("cart", cart);
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

		Utente utente = (Utente) session.getAttribute("utente");
		long idGioco = Long.parseLong(request.getParameter("idGioco"));

		Gioco gioco = giocoRepository.findById(idGioco);
		Cart cart = utente.getCart();
		
		CartItem cartItem = new CartItem();
		cartItem.setCart(cart);
		cartItem.setGioco(gioco);

		cartItemRepository.save(cartItem);

		response.sendRedirect("carrello");
	}

}
