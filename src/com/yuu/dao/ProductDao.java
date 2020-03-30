package com.yuu.dao;

import java.util.List;

import com.yuu.model.Product;

public interface ProductDao {
	List<Product> getProductList(int page, int recordsPerPage);
	
	void add(Product product);
	
	Product get(int id);
	
	void edit(Product product);
	
	void delete(int id);
	
	int getTotalRecords();
	
	List<Product> search(int cateID, String key, int page, int recordsPerPage);
	
	boolean checkCategory(int id);
	
	List<Product> getAll();
	
	List<Product> searchProductByCategory(int cateID,int page, int recordsPerPage);
	
	List<Product> searchProductByName(String key,int page, int recordsPerPage);
}
