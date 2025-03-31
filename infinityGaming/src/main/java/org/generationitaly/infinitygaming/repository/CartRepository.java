package org.generationitaly.infinitygaming.repository;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.Utente;

public interface CartRepository extends JpaRepository<Cart, Long> {

	Cart findByUtente(Utente utente);

}
