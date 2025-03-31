package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.Date;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.UtenteRepository;
import org.generationitaly.infinitygaming.repository.impl.UtenteRepositoryImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registrazione")
public class RegisterServlet extends HttpServlet {

	private UtenteRepository utenteRepository = UtenteRepositoryImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		
		String firstName = request.getParameter("nome");
		String lastName = request.getParameter("cognome");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Utente utente = new Utente();
		Cart cart = new Cart();

		utente.setNome(firstName);
		utente.setCognome(lastName);
		utente.setEmail(email);
		utente.setUsername(username);
		utente.setPassword(password);
		utente.setRegdate(new Date());
		utente.setCart(cart);
		cart.setUtente(utente);

		utenteRepository.save(utente);
		
		
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("welcome.jsp");
		requestDispatcher.forward(request, response);
	}
}
