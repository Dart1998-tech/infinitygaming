package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.Date;

import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.UtenteRepository;
import org.generationitaly.infinitygaming.repository.impl.UtenteRepositoryImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registrazione")
public class RegisterServlet extends HttpServlet {

	private UtenteRepository utenteRepository = UtenteRepositoryImpl.getInstance();


	protected void doPost(jakarta.servlet.http.HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		
		
		Utente utente = new Utente();
		utente.setNome(firstName);
		utente.setCognome(lastName);
		utente.setEmail(email);
		utente.setUsername(username);
		utente.setPassword(password);
		utente.setRegdate(new Date());
		
		utenteRepository.save(utente);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("welcome.jsp");
		requestDispatcher.forward(request, response);
	}
}
