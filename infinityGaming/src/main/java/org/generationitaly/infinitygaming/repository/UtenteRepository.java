package org.generationitaly.infinitygaming.repository;

import org.generationitaly.infinitygaming.entity.Utente;

public interface UtenteRepository extends JpaRepository<Utente, Long> {

	Utente findByUsername(String username);

}
