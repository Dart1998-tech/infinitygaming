package org.generationitaly.infinitygaming.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.UtenteRepository;
import org.generationitaly.infinitygaming.repository.impl.UtenteRepositoryImpl;

@WebServlet("/utente")
public class UtenteServlet extends HttpServlet {
	private UtenteRepository utenteRepository = UtenteRepositoryImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Utente utente = (Utente)session.getAttribute("utente");
		
		if(utente == null) {
			response.sendRedirect("login");
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/profilo.jsp");
		dispatcher.forward(request, response);
	}
}
