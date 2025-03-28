package org.generationitaly.infinitygaming.repository;

import java.util.List;

import org.generationitaly.infinitygaming.entity.Gioco;

public interface GiocoRepository extends JpaRepository<Gioco, Long> {

	List<Gioco> findByGenere(String genere);

	List<Gioco> findByPiattaforma(String piattaforma);
	
	List<Gioco> findByTitoloLike(String titolo);

}
