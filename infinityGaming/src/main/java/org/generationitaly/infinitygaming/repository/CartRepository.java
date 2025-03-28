package org.generationitaly.infinitygaming.repository;

import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.Utente;

public interface CartRepository {
    
    Optional<Cart> findByUtente(Utente utente);
    
    Cart save(Cart cart);

    void delete(Cart cart);
    
    Optional<Cart> findById(Long id);
}
