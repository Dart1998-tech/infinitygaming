package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import org.generationitaly.infinitygaming.entity.CartItem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/view-cart")
public class ViewCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistence");

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = (Integer) request.getSession().getAttribute("utenteId");

        if (userId == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        EntityManager em = emf.createEntityManager();
        List<CartItem> cartItems = null;

        try {
            em.getTransaction().begin();

            String jpql = "SELECT ci FROM CartItem ci WHERE ci.cart.utente.id = :utenteId";
            TypedQuery<CartItem> query = em.createQuery(jpql, CartItem.class);
            query.setParameter("utenteId", userId);

            cartItems = query.getResultList();

            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace(); 
        } finally {
            em.close();
        }

        request.setAttribute("cartItems", cartItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("carrello.jsp");
        dispatcher.forward(request, response);
    }
}
