package com.yuu.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yuu.dao.CategoryDao;
import com.yuu.dao.ProductDao;
import com.yuu.jdbc.DBConnection;
import com.yuu.model.Category;
import com.yuu.model.Product;

public class ProductDaoImpl extends DBConnection implements ProductDao{
	private int totalRecords;
	@Override
	public List<Product> getProductList(int page, int recordsPerPage) {
		List<Product> list = new ArrayList<Product>();
		Connection con = super.getDBConnection();
		Statement st = null;
		String sql = "SELECT * FROM product LIMIT " + page + "," + recordsPerPage + " ";
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				CategoryDao cateDao = new CategoryDaoImpl();
				
				product.setId(rs.getInt("product_id"));
				product.setName(rs.getString("product_name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setDes(rs.getString("des"));
				product.setDiscount(rs.getInt("discount"));
				
				cate = cateDao.get(rs.getInt("cate_id"));
				product.setCategory(cate);
				list.add(product);
			}
			rs = st.executeQuery("SELECT count(*) FROM product");
			if(rs.next()) {
				this.totalRecords = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void add(Product product) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "INSERT INTO product(product_name,image,price,quantity,cate_id,des,discount) VALUES(?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setString(2, product.getImage());
			ps.setDouble(3, product.getPrice());
			ps.setInt(4, product.getQuantity());
			ps.setInt(5, product.getCategory().getId());
			ps.setString(6, product.getDes());
			ps.setInt(7, product.getDiscount());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Product get(int id) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "SELECT * FROM product WHERE product_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				CategoryDao cateDao = new CategoryDaoImpl();
				
				product.setId(rs.getInt("product_id"));
				product.setName(rs.getString("product_name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setDes(rs.getString("des"));
				product.setDiscount(rs.getInt("discount"));
				cate = cateDao.get(rs.getInt("cate_id"));
				product.setCategory(cate);
				return product;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public void edit(Product product) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "UPDATE product set product_name=?, image=?, price=?, quantity=?, cate_id=?, des=?, discount=? WHERE product_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setString(2, product.getImage());
			ps.setDouble(3,	product.getPrice());
			ps.setInt(4, product.getQuantity());
			ps.setInt(5, product.getCategory().getId());
			ps.setString(6, product.getDes());
			ps.setInt(7, product.getDiscount());
			ps.setInt(8, product.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void delete(int id) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "DELETE FROM product WHERE product_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public int getTotalRecords() {
		// TODO Auto-generated method stub
		return totalRecords;
	}

	@Override
	public List<Product> search(int cateID, String key, int page, int recordsPerPage) {
		List<Product> list = new ArrayList<Product>();
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "SELECT * FROM product WHERE ";
		String sql1 = "SELECT COUNT(*) FROM product WHERE ";
		if("".equals(key)) {
			sql += "cate_id = ? LIMIT ?,?";
			sql1 += "cate_id = ?";
		}else if(cateID == 0) {
			sql += "product_name LIKE ? LIMIT ?,?";
			sql1 += "product_name LIKE ?";
		}else {
			sql += "product_name LIKE ? AND cate_id = ? LIMIT ?,?";
			sql1 += "product_name LIKE ? AND cate_id = ?";
		}
		
		try {
			ps = con.prepareStatement(sql);
			if("".equals(key)) {
				ps.setInt(1, cateID);
				ps.setInt(2, page);
				ps.setInt(3, recordsPerPage);
			}else if(cateID == 0) {
				ps.setString(1, "%"+key+"%");
				ps.setInt(2, page);
				ps.setInt(3, recordsPerPage);
			}else {
				ps.setString(1, "%"+key+"%");
				ps.setInt(2, cateID);
				ps.setInt(3, page);
				ps.setInt(4, recordsPerPage);
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				CategoryDao cateDao = new CategoryDaoImpl();
				
				product.setId(rs.getInt("product_id"));
				product.setName(rs.getString("product_name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setDes(rs.getString("des"));
				product.setDiscount(rs.getInt("discount"));
				
				cate = cateDao.get(rs.getInt("cate_id"));
				product.setCategory(cate);
				list.add(product);
			}
			ps = con.prepareStatement(sql1);
			if("".equals(key)) {
				ps.setInt(1, cateID);
			}else if(cateID == 0) {
				ps.setString(1, "%"+key+"%");
			}else {
				ps.setString(1, "%"+key+"%");
				ps.setInt(2, cateID);
			}
			rs= ps.executeQuery();
			if(rs.next()) {
				this.totalRecords = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean checkCategory(int id) {
		Connection con = super.getDBConnection();
		Statement st = null;
		String sql = "SELECT * FROM product WHERE product.cate_id = " + id;
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Product> getAll() {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM product";
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				CategoryDao cateDao = new CategoryDaoImpl();
				
				product.setId(rs.getInt("product_id"));
				product.setName(rs.getString("product_name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setDes(rs.getString("des"));
				product.setDiscount(rs.getInt("discount"));
				
				cate = cateDao.get(rs.getInt("cate_id"));
				product.setCategory(cate);
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Product> searchProductByCategory(int cateID, int page, int recordsPerPage) {
		Connection con = super.getDBConnection();
		List<Product> list = new ArrayList<Product>();
		PreparedStatement ps = null;
		String sql = "SELECT * FROM product WHERE cate_id = ? LIMIT ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, cateID);
			ps.setInt(2, page);
			ps.setInt(3, recordsPerPage);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				CategoryDao cateDao = new CategoryDaoImpl();
				
				product.setId(rs.getInt("product_id"));
				product.setName(rs.getString("product_name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setDes(rs.getString("des"));
				product.setDiscount(rs.getInt("discount"));
				
				cate = cateDao.get(rs.getInt("cate_id"));
				product.setCategory(cate);
				list.add(product);
			}
			rs= ps.executeQuery("SELECT COUNT(*) FROM product WHERE cate_id = "+cateID+"");
			if(rs.next()) {
				this.totalRecords = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Product> searchProductByName(String key, int page, int recordsPerPage) {
		Connection con = super.getDBConnection();
		List<Product> list = new ArrayList<Product>();
		PreparedStatement ps = null;
		String sql = "SELECT * FROM product WHERE product_name LIKE ? LIMIT ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+key+"%");
			ps.setInt(2, page);
			ps.setInt(3, recordsPerPage);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				Category cate = new Category();
				CategoryDao cateDao = new CategoryDaoImpl();
				
				product.setId(rs.getInt("product_id"));
				product.setName(rs.getString("product_name"));
				product.setImage(rs.getString("image"));
				product.setPrice(rs.getDouble("price"));
				product.setQuantity(rs.getInt("quantity"));
				product.setDes(rs.getString("des"));
				product.setDiscount(rs.getInt("discount"));
				
				cate = cateDao.get(rs.getInt("cate_id"));
				product.setCategory(cate);
				list.add(product);
			}
			rs = ps.executeQuery("SELECT COUNT(*) FROM product WHERE product_name LIKE '%"+key+"%'");
			if(rs.next()) {
				this.totalRecords = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

}
