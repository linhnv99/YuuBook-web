package com.yuu.dao;

import java.util.List;

import com.yuu.model.Cart;
import com.yuu.model.CartItem;

public interface CartItemDao {
	
	void add(CartItem cItem);
	
	List<CartItem> getCartItem(Cart cart);
	
	void delete(String cartID);
	
}
