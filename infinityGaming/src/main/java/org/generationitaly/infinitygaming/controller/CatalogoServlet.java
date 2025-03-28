package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.generationitaly.infinitygaming.entity.Gioco;
import org.generationitaly.infinitygaming.repository.GiocoRepository;
import org.generationitaly.infinitygaming.repository.impl.GiocoRepositoryImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet {

	private GiocoRepository giocoRepository = GiocoRepositoryImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String genere = request.getParameter("categoria");
		String piattaforma = request.getParameter("piattaforma");
		String query = request.getParameter("query");
		List<Gioco> giochi = new ArrayList<>();

		if (genere != null && !genere.isEmpty() && !genere.equals("tutti")) {
			giochi = giocoRepository.findByGenere(genere);
		} else if (piattaforma != null && !piattaforma.isEmpty()) {
			giochi = giocoRepository.findByPiattaforma(piattaforma);
			request.setAttribute("giochi", giochi);
			switch (piattaforma) {
			case "PC": {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/pc.jsp");
				dispatcher.forward(request, response);
				return;
			}
			case "PZ": {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/playstation.jsp");
				dispatcher.forward(request, response);
				return;
			}
			case "NOENTIENDO": {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/NoEntiendo.jsp");
				dispatcher.forward(request, response);
				return;
			}
			case "YBOX": {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/xboxN.jsp");
				dispatcher.forward(request, response);
				return;
			}
			}
		} else if (query != null && !query.isEmpty()) {
			giochi = giocoRepository.findByTitoloLike(query);
			request.setAttribute("giochi", giochi);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/search-result.jsp");
			dispatcher.forward(request, response);
			return;
		} else {
			giochi = giocoRepository.findAll();
		}
		request.setAttribute("giochi", giochi);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/catalogo-giochi.jsp");
		dispatcher.forward(request, response);
	}
}