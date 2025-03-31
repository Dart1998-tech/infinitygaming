package org.generationitaly.infinitygaming.repository.impl;

import java.util.List;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.CartRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class CartRepositoryImpl extends JpaRepositoryImpl<Cart, Long> implements CartRepository {

	private static CartRepositoryImpl instance;

	private CartRepositoryImpl() {

		super(Cart.class);
	}

	public static CartRepositoryImpl getInstance() {
		if (instance == null) {
			instance = new CartRepositoryImpl();
		}
		return instance;
	}

	@Override
	public Cart findByUtente(Utente utente) {
		Cart cart = null;
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Cart> query = em.createQuery("FROM Cart c WHERE c.utente = :utente", entityClass);
			query.setParameter("utente", utente);
			List<Cart> carts = query.getResultList();
			cart = carts.isEmpty() ? null : carts.get(0);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null)
				em.close();
		}
		return cart;
	}

}
