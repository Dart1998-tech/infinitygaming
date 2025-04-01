package org.generationitaly.infinitygaming.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.generationitaly.infinitygaming.entity.Gioco;
import org.generationitaly.infinitygaming.repository.GiocoRepository;
import org.generationitaly.infinitygaming.repository.impl.GiocoRepositoryImpl;

@WebServlet("/gioco")
public class GiocoServlet extends HttpServlet {
	
	private GiocoRepository giocoRepository = GiocoRepositoryImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		long id = Long.parseLong(request.getParameter("id"));
		Gioco gioco = giocoRepository.findById(id);
		
		request.setAttribute("gioco", gioco);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/gioco.jsp");
		dispatcher.forward(request, response);
	}

}
