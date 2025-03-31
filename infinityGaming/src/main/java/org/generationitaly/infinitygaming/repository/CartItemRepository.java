package org.generationitaly.infinitygaming.repository;

import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.CartItem;
import org.generationitaly.infinitygaming.entity.Gioco;
import org.generationitaly.infinitygaming.entity.Utente;

public interface CartItemRepository extends JpaRepository<CartItem, Long>{
    

    List<CartItem> findByCart(Cart cart);    
    
    void deleteByCart(Cart cart);


}
