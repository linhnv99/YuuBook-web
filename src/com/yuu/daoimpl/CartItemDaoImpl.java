package com.yuu.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yuu.dao.CartItemDao;
import com.yuu.dao.ProductDao;
import com.yuu.jdbc.DBConnection;
import com.yuu.model.Cart;
import com.yuu.model.CartItem;
import com.yuu.model.Product;

public class CartItemDaoImpl extends DBConnection implements CartItemDao{

	@Override
	public void add(CartItem cItem) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "INSERT INTO cartItem VALUES(?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cItem.getId());
			ps.setInt(2, cItem.getQuantity());
			ps.setDouble(3, cItem.getUnitPrice());
			ps.setInt(4, cItem.getProduct().getId());
			ps.setString(5, cItem.getCart().getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<CartItem> getCartItem(Cart cart) {
		Connection con = super.getDBConnection();
		List<CartItem> list = new ArrayList<CartItem>();
		PreparedStatement ps = null;
		String sql = "SELECT cartItem.id, quantity, unit_price, product_id, cart.cart_id "
				+ "FROM cartItem inner join cart on cartItem.cart_id = cart.cart_id WHERE cart.cart_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cart.getId());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CartItem cItem = new CartItem();
				ProductDao productDao = new ProductDaoImpl();
				
				cItem.setId(rs.getString("id"));
				cItem.setQuantity(rs.getInt("quantity"));
				cItem.setUnitPrice(rs.getDouble("unit_price"));
				
				Product product = productDao.get(rs.getInt("product_id"));
				cItem.setProduct(product);
				cItem.setCart(cart);
				list.add(cItem);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void delete(String cartID) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "DELETE FROM cartItem WHERE cart_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cartID);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
