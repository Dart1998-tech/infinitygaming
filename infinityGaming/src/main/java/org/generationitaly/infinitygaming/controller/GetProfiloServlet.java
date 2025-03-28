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


@WebServlet("/GetProfilo")
public class GetProfiloServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;
        private UtenteRepository utenteRepository = UtenteRepositoryImpl.getInstance();
        
    public GetProfiloServlet() {
        super();
                System.out.println("constructor 'PersoneServlet()' invoked!");
    }
    
    
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {
                
                System.out.println("method 'GetProfiloServlet.doGet(request, response)' invoked!");
                
                HttpSession session = request.getSession();
                Utente utente = (Utente) session.getAttribute("utente");
                
                // Se l'utente non è presente, prova a recuperarlo dal database usando l'id
                if (utente == null && session.getAttribute("id") != null) {
                    String username = (String) session.getAttribute("id");
                    System.out.println("Utente non trovato nella sessione, ma ID presente: " + username);
                    // Recupera l'utente dal database usando l'username
                    utente = utenteRepository.findByUsername(username);
                    
                    if (utente != null) {
                        System.out.println("Utente recuperato dal database: " + utente.getUsername());
                        // Salva l'utente nella sessione per usi futuri
                        session.setAttribute("utente", utente);
                    } else {
                        System.out.println("Utente non trovato nel database con username: " + username);
                    }
                }
                
                if (utente == null) {
                    System.out.println("Utente non trovato, reindirizzamento a index.jsp");
                    response.sendRedirect("index.jsp");
                    return;
                }
                
                System.out.println("Impostando l'attributo profiloUtente: " + utente.getUsername());
                request.setAttribute("profiloUtente", utente);

                RequestDispatcher dispatcher = request.getRequestDispatcher("profilo.jsp");
                dispatcher.forward(request, response);
                
        }
}