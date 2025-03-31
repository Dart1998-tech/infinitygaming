package org.generationitaly.infinitygaming.repository.impl;

import java.util.List;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.Ordine;
import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.OrdineRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class OrdineRepositoryImpl extends JpaRepositoryImpl<Ordine, Long> implements OrdineRepository {

	private static OrdineRepositoryImpl instance;

	public static OrdineRepositoryImpl getInstance() {
		if (instance == null) {
			instance = new OrdineRepositoryImpl();
		}
		return instance;
	}

	public OrdineRepositoryImpl() {
		super(Ordine.class);
	}

	@Override
	public List<Ordine> findByUtente(Utente utente) {
		List<Ordine> ordini = null;
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Ordine> query = em.createQuery("FROM Ordine o WHERE o.utente = :utente", entityClass);
			query.setParameter("utente", utente);
			ordini = query.getResultList();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null)
				em.close();
		}
		return ordini;
	}

}
