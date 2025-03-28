package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.CartItem;
import org.generationitaly.infinitygaming.entity.OrdineItem;
import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.CartItemRepository;
import org.generationitaly.infinitygaming.repository.CartRepository;
import org.generationitaly.infinitygaming.repository.OrderItemRepository;
import org.generationitaly.infinitygaming.repository.OrdineRepository;
import org.generationitaly.infinitygaming.repository.impl.CartItemRepositoryImpl;
import org.generationitaly.infinitygaming.repository.impl.CartRepositoryImpl;
import org.generationitaly.infinitygaming.repository.impl.OrderItemRepositoryImpl;
import org.generationitaly.infinitygaming.repository.impl.OrdineRepositoryImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private CartRepository cartRepository;
    private CartItemRepository cartItemRepository;
    private OrdineRepository ordineRepository;
    private OrderItemRepository orderItemRepository;
    
    public CheckoutServlet() {
        super();
        cartRepository = CartRepositoryImpl.getInstance();
        cartItemRepository = CartItemRepositoryImpl.getInstance();
        ordineRepository = OrdineRepositoryImpl.getInstance();
        orderItemRepository = OrderItemRepositoryImpl.getInstance();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.equals("/")) {
            showCheckout(request, response);
        } else if (pathInfo.equals("/confirmation")) {
            showConfirmation(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.equals("/")) {
            processCheckout(request, response);
        } else if (pathInfo.equals("/process")) {
            processOrder(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    private void showCheckout(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        if (utente == null) {
            List<CartItem> cartItems = getSessionCart(session);
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("cartTotal", calculateTotal(cartItems));
        } else {
            Optional<Cart> optionalCart = cartRepository.findByUtente(utente);
            
            if (optionalCart.isPresent()) {
                Cart cart = optionalCart.get();
                List<CartItem> cartItems = cartItemRepository.findByCart(cart);
                request.setAttribute("cartItems", cartItems);
                request.setAttribute("cartTotal", calculateTotal(cartItems));
            } else {
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }
        }
        
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }
    
    private void processCheckout(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        if (utente == null) {
            session.setAttribute("redirectAfterLogin", request.getContextPath() + "/checkout");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        Optional<Cart> optionalCart = cartRepository.findByUtente(utente);
        
        if (!optionalCart.isPresent() || cartItemRepository.findByCart(optionalCart.get()).isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }
        
        response.sendRedirect(request.getContextPath() + "/checkout");
    }
    
    private void processOrder(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        if (utente == null) {
            session.setAttribute("redirectAfterLogin", request.getContextPath() + "/checkout");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        Optional<Cart> optionalCart = cartRepository.findByUtente(utente);
        
        if (!optionalCart.isPresent()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }
        
        Cart cart = optionalCart.get();
        List<CartItem> cartItems = cartItemRepository.findByCart(cart);
        
        if (cartItems.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }
        
        Ordine ordine = new Ordine();
        ordine.setUtenteId(utente);
        ordine.setPrezzo(calculateTotal(cartItems));
        
        ordine = ordineRepository.save(ordine);
        
        for (CartItem cartItem : cartItems) {
            OrdineItem orderItem = new OrdineItem();
            orderItem.setOrder(ordine);
            orderItem.setGioco(cartItem.getGioco());
            orderItem.setPrezzo(cartItem.getPrezzo());
            
            orderItemRepository.save(orderItem);
        }
        
        cartItemRepository.deleteByCart(cart);
        
        session.setAttribute("lastOrderId", ordine.getOrdineId());
        
        response.sendRedirect(request.getContextPath() + "/checkout/confirmation");
    }
    
    private void showConfirmation(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer ordineId = (Integer) session.getAttribute("lastOrderId");
        
        if (ordineId == null) {
            response.sendRedirect(request.getContextPath() + "/welcome-home.jsp");
            return;
        }
        
        Optional<Ordine> optionalOrdine = ordineRepository.findById(Integer.valueOf(ordineId));
        
        if (!optionalOrdine.isPresent()) {
            response.sendRedirect(request.getContextPath() + "/welcome-home.jsp");
            return;
        }
        
        Ordine ordine = optionalOrdine.get();
        List<OrdineItem> orderItems = orderItemRepository.findByOrder(ordine);
        
        request.setAttribute("ordine", ordine);
        request.setAttribute("orderItems", orderItems);
        
        session.removeAttribute("lastOrderId");
        
        request.getRequestDispatcher("/conferma-ordine.jsp").forward(request, response);
    }
    
    
    @SuppressWarnings("unchecked")
    private List<CartItem> getSessionCart(HttpSession session) {
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
        
        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("cartItems", cartItems);
        }
        
        return cartItems;
    }
    
    private double calculateTotal(List<CartItem> cartItems) {
        float total = 0;
        
        for (CartItem item : cartItems) {
            total += item.getPrezzo();
        }
        
        return total;
    }
}
