package org.generationitaly.infinitygaming.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Random;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.CartItem;
import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.OrdineItem;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.CartItemRepository;
import org.generationitaly.infinitygaming.repository.CartRepository;
import org.generationitaly.infinitygaming.repository.UtenteRepository;
import org.generationitaly.infinitygaming.repository.impl.CartItemRepositoryImpl;
import org.generationitaly.infinitygaming.repository.impl.CartRepositoryImpl;
import org.generationitaly.infinitygaming.repository.impl.OrdineRepositoryImpl;
import org.generationitaly.infinitygaming.repository.OrdineRepository;
import org.generationitaly.infinitygaming.repository.impl.UtenteRepositoryImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

	private UtenteRepository utenteRepository = UtenteRepositoryImpl.getInstance();
	private OrdineRepository ordineRepository = OrdineRepositoryImpl.getInstance();
	private CartItemRepository cartItemRepository = CartItemRepositoryImpl.getInstance();
	private CartRepository cartRepository = CartRepositoryImpl.getInstance();
	private Random random = new Random();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("utente") == null) {
			response.sendRedirect("login");
			return;
		}

		Utente utente = (Utente) session.getAttribute("utente");
		Cart cart = cartRepository.findByUtente(utente);

		request.setAttribute("cart", cart);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("checkout.jsp");
		requestDispatcher.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("utente") == null) {
			response.sendRedirect("login");
			return;
		}

		Utente utente = (Utente) session.getAttribute("utente");

		Cart cart = cartRepository.findByUtente(utente);

		Ordine ordine = new Ordine();
		ordine.setUtente(utente);
		ordine.setDataOrdine(new Date());
		for (CartItem cartItem : cart.getCartItems()) {

			OrdineItem ordineItem = new OrdineItem();
			ordineItem.setGameKey("key-" + random.nextInt(0, 12) + ordine.getDataOrdine().getTime());
			ordineItem.setGioco(cartItem.getGioco());
			ordineItem.setOrdine(ordine);
			ordineItem.setPrezzo(cartItem.getGioco().getPrezzo());
			ordine.setPrezzo(ordine.getPrezzo() + ordineItem.getPrezzo());

			ordine.getItems().add(ordineItem);

			cartItemRepository.delete(cartItem);
		}

		utente.setFondi(utente.getFondi() - ordine.getPrezzo());
		utenteRepository.update(utente);
		ordineRepository.save(ordine);

		response.sendRedirect("dettaglio-ordine?idOrdine=" + ordine.getId());
	}

}
