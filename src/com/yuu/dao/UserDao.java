package com.yuu.dao;

import java.util.List;

import com.yuu.model.User;

public interface UserDao {
	User checkUser(String username, String password);

	User get(String username);

	User get(int id);

	List<User> getUserList(int page, int recordsPerPage);

	void add(User user);
	
	void edit(User user);
	
	void delete(int id);
	
	int getTotalRecords();
	
	List<User> search(String key, int page, int recordsPerPage);
}
