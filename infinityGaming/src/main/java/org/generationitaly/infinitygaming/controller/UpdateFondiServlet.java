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

@WebServlet("/update-fondi")
public class UpdateFondiServlet extends HttpServlet {
	private UtenteRepository utenteRepository = UtenteRepositoryImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("utente") == null) {
			response.sendRedirect("index.jsp");
			return;
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("UpdateFondi.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("utente") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		Utente utente = (Utente) session.getAttribute("utente");
		double fondi = Double.parseDouble(request.getParameter("fondi"));

		utente.setFondi(utente.getFondi() + fondi);
		utenteRepository.update(utente);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("UpdateFondi.jsp");
		requestDispatcher.forward(request, response);

	}
}
