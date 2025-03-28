package org.generationitaly.infinitygaming.repository.impl;

import java.util.List;

import org.generationitaly.infinitygaming.entity.Utente;
import org.generationitaly.infinitygaming.repository.UtenteRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class UtenteRepositoryImpl extends JpaRepositoryImpl<Utente, Long> implements UtenteRepository {

	private static UtenteRepositoryImpl instance;

	public static UtenteRepository getInstance() {
		if (instance == null)
			instance = new UtenteRepositoryImpl();
		return instance;
	}

	public UtenteRepositoryImpl() {
		super(Utente.class);
	}
	@Override
	public Utente findByUsername(String username) {
		Utente utente = null;
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Utente> query = em.createQuery("FROM Utente u WHERE u.username = :username", entityClass);
			query.setParameter("username", username);
			List<Utente> utenti = query.getResultList();
			utente = utenti.isEmpty() ? null : utenti.get(0);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null)
				em.close();
		}
		return utente;
	}

}
