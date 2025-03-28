package org.generationitaly.infinitygaming.repository.impl;

import java.util.List;

import org.generationitaly.infinitygaming.entity.Gioco;
import org.generationitaly.infinitygaming.repository.GiocoRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

public class GiocoRepositoryImpl extends JpaRepositoryImpl<Gioco, Long> implements GiocoRepository {

	private static GiocoRepository instance;

	public static GiocoRepository getInstance() {
		if (instance == null)
			instance = new GiocoRepositoryImpl();
		return instance;
	}

	public GiocoRepositoryImpl() {
		super(Gioco.class);
	}

	@Override
	public List<Gioco> findByGenere(String genere) {
		List<Gioco> giochi = null;
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Gioco> query = em.createQuery("FROM Gioco g WHERE g.genere.nome = :genere", entityClass);
			query.setParameter("genere", genere);
			giochi = query.getResultList();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null)
				em.close();
		}
		return giochi;
	}

	@Override
	public List<Gioco> findByPiattaforma(String piattaforma) {
		List<Gioco> giochi = null;
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Gioco> query = em.createQuery(
					"SELECT g FROM Gioco g JOIN g.piattaforme gp JOIN gp.piattaforma p WHERE p.nome = :piattaforma",
					entityClass);
			query.setParameter("piattaforma", piattaforma);
			giochi = query.getResultList();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null)
				em.close();
		}
		return giochi;
	}

	@Override
	public List<Gioco> findByTitoloLike(String titolo) {
		List<Gioco> giochi = null;
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Gioco> query = em.createQuery("FROM Gioco g WHERE g.titolo LIKE :titolo", entityClass);
			query.setParameter("titolo", "%" + titolo + "%");
			giochi = query.getResultList();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null)
				em.close();
		}
		return giochi;
	}

}
