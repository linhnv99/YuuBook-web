package com.yuu.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.yuu.dao.CategoryDao;
import com.yuu.jdbc.DBConnection;
import com.yuu.model.Category;

public class CategoryDaoImpl extends DBConnection implements CategoryDao{

	@Override
	public List<Category> getAll() {
		List<Category> list = new ArrayList<Category>();
		Connection con = super.getDBConnection();
		Statement st = null;
		String sql = "SELECT * FROM category";
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Category cate = new Category();
				cate.setId(rs.getInt("cate_id"));
				cate.setName(rs.getString("cate_name"));
				list.add(cate);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void add(Category cate) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "INSERT INTO category(cate_name) VALUES(?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cate.getName());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Category get(int id) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "SELECT * FROM category WHERE cate_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Category cate = new Category();
				cate.setId(rs.getInt("cate_id"));
				cate.setName(rs.getString("cate_name"));
				return cate;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void edit(Category cate) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "UPDATE category SET cate_name = ? WHERE cate_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, cate.getName());
			ps.setInt(2, cate.getId());
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
		String sql = "DELETE FROM category WHERE cate_id = ?";
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
	public Map<Category, Integer> getTotalProductByCate() {
		Map<Category, Integer> list = new LinkedHashMap<Category, Integer>();
		CategoryDao cateDao = new CategoryDaoImpl();
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "select category.cate_id, count(*) as 'sosanpham' from category inner join product on category.cate_id = product.cate_id group by category.cate_id";
		try {
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Category cate = cateDao.get(rs.getInt("cate_id"));
				list.put(cate, rs.getInt("sosanpham"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
