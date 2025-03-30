package org.generationitaly.infinitygaming.repository.impl;

import java.util.List;
import java.util.Optional;

import org.generationitaly.infinitygaming.entity.Cart;
import org.generationitaly.infinitygaming.entity.CartItem;
import org.generationitaly.infinitygaming.entity.Gioco;
import org.generationitaly.infinitygaming.repository.CartItemRepository;
import org.generationitaly.infinitygaming.repository.GiocoRepository;

public class CartItemRepositoryImpl implements CartItemRepository {
    
    private static CartItemRepositoryImpl instance;
    private GiocoRepository giocoRepository;
    
    private CartItemRepositoryImpl() {
       // this.giocoRepository = GiocoRepositoryImpl.getInstance();
    }
    
    public static CartItemRepositoryImpl getInstance() {
        if (instance == null) {
            instance = new CartItemRepositoryImpl();
        }
        return instance;
    }

    @Override
    public List<CartItem> findByCart(Cart cart) {
    	return null;
    }

    @Override
    public CartItem save(CartItem cartItem) {

    	return null;
    }

    @Override
    public void delete(CartItem cartItem) {
    }

    @Override
    public CartItem findById(Long id) {

    	return null;
    }

    @Override
    public void deleteByCart(Cart cart) {

    }
}
