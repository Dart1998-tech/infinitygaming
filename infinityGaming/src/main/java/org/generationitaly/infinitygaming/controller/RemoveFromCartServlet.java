package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.generationitaly.infinitygaming.entity.CartItem;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cartItemIdParam = request.getParameter("cartItemId");

        if (cartItemIdParam == null || !cartItemIdParam.matches("\\d+")) {
            response.sendRedirect("cart.jsp?error=InvalidItem");
            return;
        }

        int cartItemId = Integer.parseInt(cartItemIdParam);
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();

            CartItem cartItem = em.find(CartItem.class, cartItemId);

            if (cartItem != null) {
                em.remove(cartItem); 
                em.getTransaction().commit();
                response.sendRedirect("cart.jsp?success=ItemRemoved");
            } else {
                em.getTransaction().rollback();
                response.sendRedirect("cart.jsp?error=ItemNotFound");
            }
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace(); 
            response.sendRedirect("cart.jsp?error=DatabaseError");
        } finally {
            em.close();
        }
    }
}