package org.generationitaly.infinitygaming.controller;

import java.io.IOException;

import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.repository.OrdineRepository;
import org.generationitaly.infinitygaming.repository.impl.OrdineRepositoryImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/dettaglio-ordine")
public class DettaglioOrdineServlet extends HttpServlet {

	private OrdineRepository ordineRepository = OrdineRepositoryImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("utente") == null) {
			response.sendRedirect("login");
			return;
		}

		long ordineId = Long.parseLong(request.getParameter("idOrdine"));

		Ordine ordine = ordineRepository.findById(ordineId);

		request.setAttribute("ordine", ordine);

		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dettaglio-ordine.jsp");
		requestDispatcher.forward(request, response);
	}

}
