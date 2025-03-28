package org.generationitaly.infinitygaming.repository;

import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.CartItem;
import org.generationitaly.infinitygaming.entity.Gioco;

public interface CartItemRepository {
    

    List<CartItem> findByCart(Cart cart);
    

    Optional<CartItem> findByCartAndGioco(Cart cart, Gioco gioco);
    

    CartItem save(CartItem cartItem);
    

    void delete(CartItem cartItem);
    

    Optional<CartItem> findById(Long id);
    
    void deleteByCart(Cart cart);


	Optional<CartItem> findByIdCart(int cartItemId);
}
