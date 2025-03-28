package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.List;

import org.generationitaly.infinitygaming.entity.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
//    private CartRepository cartRepository;
//    private CartItemRepository cartItemRepository;
//    private GiocoRepository giocoRepository;
    
    public CartServlet() {
        super();
//        cartRepository = CartRepositoryImpl.getInstance();
//        cartItemRepository = CartItemRepositoryImpl.getInstance();
//        giocoRepository = GiocoRepositoryImpl.getInstance();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.equals("/")) {
            showCart(request, response);
        } else if (pathInfo.equals("/clear")) {
            clearCart(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || pathInfo.equals("/")) {
            addToCart(request, response);
        } else if (pathInfo.equals("/update")) {
            updateCartItem(request, response);
        } else if (pathInfo.equals("/remove")) {
            removeFromCart(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    private void showCart(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	/*
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        if (utente == null) {
            List<CartItem> cartItems = getSessionCart(session);
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("cartTotal", calculateTotal(cartItems));
        } else {
            Optional<Cart> optionalCart = cartRepository.findByUtente(utente);
            Cart cart;
            
            if (optionalCart.isPresent()) {
                cart = optionalCart.get();
            } else {
                cart = new Cart(utente);
                cart = cartRepository.save(cart);
            }
            
            List<CartItem> cartItems = cartItemRepository.findByCart(cart);
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("cartTotal", calculateTotal(cartItems));
        }
        
        request.getRequestDispatcher("/carrello.jsp").forward(request, response);
        */
    }
    
    private void addToCart(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        /* String giocoIdStr = request.getParameter("giocoId");
        
        if (giocoIdStr == null ) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametri mancanti");
            return;
        }
        
        try {
            int giocoId = Integer.parseInt(giocoIdStr);
            
            
            //Optional<Gioco> optionalGioco = giocoRepository.findByIdGioco(giocoId);
            if (!optionalGioco.isPresent()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Gioco non trovato");
                return;
            }
            
            Gioco gioco = optionalGioco.get();
            HttpSession session = request.getSession();
            Utente utente = (Utente) session.getAttribute("utente");
            
            if (utente == null) {
                addToSessionCart(session, gioco);
            } else {
                Optional<Cart> optionalCart = cartRepository.findByUtente(utente);
                Cart cart;
                
                if (optionalCart.isPresent()) {
                    cart = optionalCart.get();
                } else {
                    cart = new Cart(utente);
                    cart = cartRepository.save(cart);
                }
                
                Optional<CartItem> optionalCartItem = cartItemRepository.findByCartAndGioco(cart, gioco);
                
                if (optionalCartItem.isPresent()) {
                    CartItem cartItem = optionalCartItem.get();
                    cartItemRepository.save(cartItem);
                } else {
                    CartItem cartItem = new CartItem(cart, gioco, gioco.getPrezzo());
                    cartItemRepository.save(cartItem);
                }
            }
            
            response.sendRedirect(request.getContextPath() + "/cart");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametri non validi");
        }
        */
    }
    
    private void updateCartItem(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	/*
        String cartItemIdStr = request.getParameter("cartItemId");
        
        if (cartItemIdStr == null ) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametri mancanti");
            return;
        }
        
        try {
            int cartItemId = Integer.parseInt(cartItemIdStr);

            
            HttpSession session = request.getSession();
            Utente utente = (Utente) session.getAttribute("utente");
            
            if (utente == null) {
                updateSessionCartItem(session, cartItemId);
            } else {
                Optional<CartItem> optionalCartItem = cartItemRepository.findByIdCart(cartItemId);
                
                if (optionalCartItem.isPresent()) {
                    CartItem cartItem = optionalCartItem.get();
                    cartItemRepository.save(cartItem);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Elemento del carrello non trovato");
                    return;
                }
            }
            
            response.sendRedirect(request.getContextPath() + "/cart");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametri non validi");
        }
        */
    }
    
    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	/*
        String cartItemIdStr = request.getParameter("cartItemId");
        
        if (cartItemIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametri mancanti");
            return;
        }
        
        try {
            Long cartItemId = Long.parseLong(cartItemIdStr);
            
            HttpSession session = request.getSession();
            Utente utente = (Utente) session.getAttribute("utente");
            
            if (utente == null) {
                removeFromSessionCart(session, cartItemId);
            } else {
                Optional<CartItem> optionalCartItem = cartItemRepository.findById(cartItemId);
                
                if (optionalCartItem.isPresent()) {
                    CartItem cartItem = optionalCartItem.get();
                    cartItemRepository.delete(cartItem);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Elemento del carrello non trovato");
                    return;
                }
            }
            
            response.sendRedirect(request.getContextPath() + "/cart");
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametri non validi");
        }
        */
    }
    
    private void clearCart(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	/*
        HttpSession session = request.getSession();
        Utente utente = (Utente) session.getAttribute("utente");
        
        if (utente == null) {
            session.removeAttribute("cartItems");
        } else {
            Optional<Cart> optionalCart = cartRepository.findByUtente(utente);
            
            if (optionalCart.isPresent()) {
                Cart cart = optionalCart.get();
                cartItemRepository.deleteByCart(cart);
            }
        }
        
        response.sendRedirect(request.getContextPath() + "/cart");
        */
    }
    
    
    @SuppressWarnings("unchecked")
    private List<CartItem> getSessionCart(HttpSession session) {
    	/*
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
        
        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("cartItems", cartItems);
        }
        
        return cartItems;
        */
    	return null;
    }
    
    private void addToSessionCart(HttpSession session, String gioco) {
    	/*
        List<CartItem> cartItems = getSessionCart(session);
        
        for (CartItem item : cartItems) {
            if (item.getId()==(gioco.getId())) {
                return;
            }
        }
        
        CartItem cartItem = new CartItem();
        cartItem.setGioco(gioco);
        cartItem.setPrezzo(gioco.getPrezzo());
        cartItems.add(cartItem);
        */
    }
    
    private void updateSessionCartItem(HttpSession session, int cartItemId) {
    	/*
        List<CartItem> cartItems = getSessionCart(session);
        
        for (CartItem item : cartItems) {
            if (item.getId()==(cartItemId)) {
                return;
            }
        }
        */
    }
    
    private void removeFromSessionCart(HttpSession session, Long cartItemId) {
    	/*
        List<CartItem> cartItems = getSessionCart(session);
        
        cartItems.removeIf(item -> item.getId()==(cartItemId));
        */
    }
    
    private float calculateTotal(List<CartItem> cartItems) {
    	/*
        float total = 0;
        
        for (CartItem item : cartItems) {
            total += item.getPrezzo();
        }
        
        return total;
    	*/
    	return 0;
    }
    
}
