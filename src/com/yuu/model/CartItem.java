package com.yuu.model;

import java.io.Serializable;

public class CartItem implements Serializable{
	private String id;
	private int quantity;
	private double unitPrice;
	private Product product;
	private Cart cart;

	public CartItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartItem(String id, int quantity, double unitPrice, Product product, Cart cart) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.product = product;
		this.cart = cart;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
}
