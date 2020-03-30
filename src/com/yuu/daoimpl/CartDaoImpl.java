package com.yuu.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yuu.dao.CartDao;
import com.yuu.dao.UserDao;
import com.yuu.jdbc.DBConnection;
import com.yuu.model.Cart;
import com.yuu.model.User;

public class CartDaoImpl extends DBConnection implements CartDao{
	private int totalRecords;
	@Override
	public void add(Cart cart) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "INSERT INTO cart VALUES(?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cart.getId());
			ps.setInt(2, cart.getBuyer().getId());
			ps.setString(3, cart.getName());
			ps.setString(4, cart.getEmail());
			ps.setString(5, cart.getAddress());
			ps.setString(6, cart.getPhone());
			ps.setString(7, cart.getBuyDate());
			ps.setInt(8, cart.getStatus());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Cart> getOrderList(int page, int recordsPerPage) {
		Connection con = super.getDBConnection();
		List<Cart> orderList = new ArrayList<Cart>();
		PreparedStatement ps = null;
		String sql = "SELECT cart.cart_id,c_name,c_email,c_address,c_phone,buy_date, status, user.user_id "
				+ "FROM cart inner join user on cart.user_id = user.user_id order by buy_date ASC LIMIT ?,?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, page);
			ps.setInt(2, recordsPerPage);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Cart cart = new Cart();
				UserDao userDao = new UserDaoImpl();
				
				cart.setId(rs.getString("cart_id"));
				cart.setName(rs.getString("c_name"));
				cart.setEmail(rs.getString("c_email"));
				cart.setAddress(rs.getString("c_address"));
				cart.setBuyDate(rs.getString("buy_date"));
				cart.setStatus(rs.getInt("status"));
				cart.setPhone(rs.getString("c_phone"));
				
				User user = userDao.get(rs.getInt("user_id"));
				cart.setBuyer(user);
				orderList.add(cart);
			}
			String sql1 = "SELECT Count(*) FROM cart";
			rs = ps.executeQuery(sql1);
			if(rs.next()) {
				this.totalRecords = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderList;
	}

	@Override
	public void delete(String cartID) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "DELETE FROM cart WHERE cart_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cartID);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public Cart get(String id) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "SELECT cart.cart_id,c_name,c_email,c_address,c_phone,buy_date, status, user.user_id "
				+ "FROM cart inner join user on cart.user_id = user.user_id WHERE cart.cart_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Cart cart = new Cart();
				UserDao userDao = new UserDaoImpl();
				
				cart.setId(rs.getString("cart_id"));
				cart.setName(rs.getString("c_name"));
				cart.setEmail(rs.getString("c_email"));
				cart.setAddress(rs.getString("c_address"));
				cart.setBuyDate(rs.getString("buy_date"));
				cart.setStatus(rs.getInt("status"));
				cart.setPhone(rs.getString("c_phone"));
				
				User user = userDao.get(rs.getInt("user_id"));
				cart.setBuyer(user);
				return cart;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void EditStatus(Cart cart) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "UPDATE cart set status = ? WHERE cart.cart_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, cart.getStatus() == 0 ? 1 : 0);
			ps.setString(2, cart.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Cart> search(String key, int page, int recordsPerPage) {
		Connection con = super.getDBConnection();
		List<Cart> orderList = new ArrayList<Cart>();
		PreparedStatement ps = null;
		String sql = "SELECT cart.cart_id,c_name,c_email,c_address,c_phone,buy_date, status, user.user_id "
				+ "FROM cart inner join user on cart.user_id = user.user_id WHERE c_name LIKE ?"
				+ "order by buy_date ASC LIMIT ?,?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+key+"%");
			ps.setInt(2, page);
			ps.setInt(3, recordsPerPage);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Cart cart = new Cart();
				UserDao userDao = new UserDaoImpl();
				
				cart.setId(rs.getString("cart_id"));
				cart.setName(rs.getString("c_name"));
				cart.setEmail(rs.getString("c_email"));
				cart.setAddress(rs.getString("c_address"));
				cart.setBuyDate(rs.getString("buy_date"));
				cart.setStatus(rs.getInt("status"));
				cart.setPhone(rs.getString("c_phone"));
				
				User user = userDao.get(rs.getInt("user_id"));
				cart.setBuyer(user);
				orderList.add(cart);
			}
			String sql1 = "SELECT Count(*) FROM cart WHERE c_name LIKE '%"+ key +"%'";
			rs = ps.executeQuery(sql1);
			if(rs.next()) {
				this.totalRecords = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderList;
	}
	
	@Override
	public List<Cart> filter(int status, int page, int recordsPerPage) {
		Connection con = super.getDBConnection();
		List<Cart> orderList = new ArrayList<Cart>();
		PreparedStatement ps = null;
		String sql = "SELECT cart.cart_id,c_name,c_email,c_address,c_phone,buy_date, status, user.user_id "
				+ "FROM cart inner join user on cart.user_id = user.user_id WHERE status = ? order by buy_date ASC LIMIT ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, status);
			ps.setInt(2, page);
			ps.setInt(3, recordsPerPage);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Cart cart = new Cart();
				UserDao userDao = new UserDaoImpl();
				
				cart.setId(rs.getString("cart_id"));
				cart.setName(rs.getString("c_name"));
				cart.setEmail(rs.getString("c_email"));
				cart.setAddress(rs.getString("c_address"));
				cart.setBuyDate(rs.getString("buy_date"));
				cart.setStatus(rs.getInt("status"));
				cart.setPhone(rs.getString("c_phone"));
				
				User user = userDao.get(rs.getInt("user_id"));
				cart.setBuyer(user);
				orderList.add(cart);
			}
			String sql1 = "SELECT Count(*) FROM cart WHERE status = "+ status;
			rs = ps.executeQuery(sql1);
			if(rs.next()) {
				this.totalRecords = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderList;
	}

	@Override
	public int getTotalRecords() {
		// TODO Auto-generated method stub
		return totalRecords;
	}


}
