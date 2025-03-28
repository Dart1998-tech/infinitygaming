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

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UtenteRepository utenteRepository = UtenteRepositoryImpl.getInstance();

	public class UpdatePersonaServlet {
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			System.out.println("method 'UpdatePersonaServlet.doGet(request, response)' invoked!");

			HttpSession session = request.getSession();
			if (session.getAttribute("utente") == null) {
				response.sendRedirect("index.jsp");
				return;
			}

			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("param 'id': " + id);
			// Utente utente = utenteRepository.findIdUser(id);
			Utente utente = null;
			System.out.println(utente);
			request.setAttribute("utente", utente);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("form-update-persona.jsp");
			requestDispatcher.forward(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			System.out.println("method 'UpdatePersonaServlet.doPost(request, response)' invoked!");

			HttpSession session = request.getSession();
			if (session.getAttribute("utente") == null) {
				response.sendRedirect("index.jsp");
				return;
			}

			int id = Integer.parseInt(request.getParameter("id"));
			// Utente utente = utenteRepository.findIdUser(id);
			Utente utente = null;
			utente.setFondi(utente.getFondi() + 100);

			utenteRepository.update(utente);
			response.sendRedirect("utente");
		}

	}
}
