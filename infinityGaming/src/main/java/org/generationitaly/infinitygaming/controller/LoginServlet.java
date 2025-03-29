package org.generationitaly.infinitygaming.controller;

import java.io.IOException;

import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.UtenteRepository;
import org.generationitaly.infinitygaming.repository.impl.UtenteRepositoryImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UtenteRepository utenteRepository = UtenteRepositoryImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("method 'LoginServlet.doPost(request, response)' invoked!");
		/*- <input id="input-username" name="username" type="text"> */
		String username = request.getParameter("username");
		/*- <input id="input-password" name="password" type="password"> */
		String password = request.getParameter("password");
		System.out.println("param 'username': " + username);
		System.out.println("param 'password': " + password);
		Utente utente = utenteRepository.findByUsername(username);
		if (utente != null && utente.getPassword().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", utente.getUsername());
			session.setAttribute("utente", utente);
			response.sendRedirect("home");
		} else {

			/*-
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(request, response);
			*/
			response.sendRedirect("index.jsp?errore=Credenziali errate");
		}
	}

}
