package com.yuu.model;

public class Product {
	private int id;
	private String name;
	private double price;
	private String image;
	private int quantity;
	private Category category;
	private String des;
	private int discount;

	public Product() {
		super();
	}

	public Product(int id, String name, double price, String image, int quantity, Category category, String des,int discount) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.image = image;
		this.quantity = quantity;
		this.category = category;
		this.des = des;
		this.discount = discount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

}
