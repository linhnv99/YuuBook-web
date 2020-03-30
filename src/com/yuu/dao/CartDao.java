package com.yuu.dao;

import java.util.List;

import com.yuu.model.Cart;

public interface CartDao {
	void add(Cart cart);
	
	List<Cart> getOrderList(int page, int recordsPerPage);
	
	void delete(String cartID);
	
	Cart get(String id);
	
	void EditStatus(Cart cart);
	
	int getTotalRecords();
	
	List<Cart> search(String key, int page, int recordsPerPage);
	
	List<Cart> filter(int status, int page, int recordsPerPage);
}
