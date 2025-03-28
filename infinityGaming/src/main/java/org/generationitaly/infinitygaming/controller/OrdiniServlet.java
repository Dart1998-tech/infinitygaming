package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.OrderItem;
import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.OrderItemRepository;
import org.generationitaly.infinitygaming.repository.OrdineRepository;
import org.generationitaly.infinitygaming.repository.impl.OrderItemRepositoryImpl;
import org.generationitaly.infinitygaming.repository.impl.OrdineRepositoryImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ordini")
public class OrdiniServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private OrdineRepository ordineRepository;
    private OrderItemRepository orderItemRepository;
    
    public OrdiniServlet() {
        super();
        ordineRepository = OrdineRepositoryImpl.getInstance();
        orderItemRepository = OrderItemRepositoryImpl.getInstance();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.equals("/")) {
            showOrderList(request, response);
        } else if (pathInfo.startsWith("/dettaglio/")) {
            showOrderDetails(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    private void showOrderList(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        if (utente == null) {
            session.setAttribute("redirectAfterLogin", request.getContextPath() + "/ordini");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        List<Ordine> ordini = ordineRepository.findByUtente(utente);
        request.setAttribute("ordini", ordini);
        
        request.getRequestDispatcher("/ordini.jsp").forward(request, response);
    }
    
    private void showOrderDetails(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        if (utente == null) {
            session.setAttribute("redirectAfterLogin", request.getContextPath() + request.getRequestURI());
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        String pathInfo = request.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        
        if (pathParts.length < 3) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        
        try {
            int ordineId = Integer.parseInt(pathParts[2]);
            
            Optional<Ordine> optionalOrdine = ordineRepository.findById(ordineId);
            
            if (!optionalOrdine.isPresent()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Ordine non trovato");
                return;
            }
            
            Ordine ordine = optionalOrdine.get();
            
            if (!(ordine.getUtenteId().getId() == (utente.getId()))) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Non hai il permesso di visualizzare questo ordine");
                return;
            }
            
            List<OrderItem> orderItems = orderItemRepository.findByOrder(ordine);
            
            request.setAttribute("ordine", ordine);
            request.setAttribute("orderItems", orderItems);
            
            request.getRequestDispatcher("/dettaglio-ordine.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID ordine non valido");
        }
    }
}
