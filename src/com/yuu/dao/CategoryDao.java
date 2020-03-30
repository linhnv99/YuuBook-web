package com.yuu.dao;

import java.util.List;
import java.util.Map;

import com.yuu.model.Category;

public interface CategoryDao {
	List<Category> getAll();
	
	void add(Category cate);
	
	Category get(int id);
	
	void edit(Category cate);
	
	void delete(int id);
	
	Map<Category, Integer> getTotalProductByCate();
}
