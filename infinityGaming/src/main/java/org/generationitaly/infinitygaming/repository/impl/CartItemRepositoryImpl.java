package org.generationitaly.infinitygaming.repository.impl;

import org.generationitaly.infinitygaming.entity.CartItem;
import org.generationitaly.infinitygaming.repository.CartItemRepository;

public class CartItemRepositoryImpl extends JpaRepositoryImpl<CartItem, Long> implements CartItemRepository {

	CartItemRepositoryImpl() {
		super(CartItem.class);
	}

	private static CartItemRepositoryImpl instance;

	public static CartItemRepositoryImpl getInstance() {
		if (instance == null) {
			instance = new CartItemRepositoryImpl();
		}
		return instance;
	}
}
