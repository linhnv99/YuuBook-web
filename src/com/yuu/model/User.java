package com.yuu.model;

public class User {
	private int id;
	private int level;
	private String name;
	private String username;
	private String password;
	private String image;
	private String email;
	private String location;
	private String phone;

	public User() {
		super();
	}

	public User(int id, int level, String name, String username, String password, String image, String email,
			String location, String phone) {
		super();
		this.id = id;
		this.level = level;
		this.name = name;
		this.username = username;
		this.password = password;
		this.image = image;
		this.email = email;
		this.location = location;
		this.phone = phone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
