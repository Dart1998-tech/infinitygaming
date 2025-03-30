package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.OrdineItem;
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
    
    private OrdineRepository ordineRepository = OrdineRepositoryImpl.getInstance();
    private OrderItemRepository orderItemRepository= OrderItemRepositoryImpl.getInstance();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
       
    }
}
    
   