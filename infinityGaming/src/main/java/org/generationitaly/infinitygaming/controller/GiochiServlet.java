package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.List;

import org.generationitaly.infinitygaming.entity.Gioco;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/giochi")
public class GiochiServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
	private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistence");
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();
        List<Gioco> giochi = null;
        
        try {
            TypedQuery<Gioco> query = em.createQuery("SELECT g FROM Gioco g", Gioco.class);
            giochi = query.getResultList();
            
            request.setAttribute("giochi", giochi);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("Giochi.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().append("Si è verificato un errore durante il recupero dei giochi: " + e.getMessage());
        } finally {
            em.close();
        }
    }
}
