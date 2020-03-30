package com.yuu.model;

import java.io.Serializable;
import java.util.Date;

public class Cart implements Serializable{
	private String id;
	private User buyer;
	private String name;
	private String email;
	private String address;
	private String phone;
	private String buyDate;
	private int status;

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(String id, User buyer, String name, String email, String address, String phone, String buyDate,
			int status) {
		super();
		this.id = id;
		this.buyer = buyer;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.buyDate = buyDate;
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public User getBuyer() {
		return buyer;
	}

	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
}
