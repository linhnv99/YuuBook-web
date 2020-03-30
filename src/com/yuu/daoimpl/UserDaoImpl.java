package com.yuu.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yuu.dao.UserDao;
import com.yuu.jdbc.DBConnection;
import com.yuu.model.User;

public class UserDaoImpl extends DBConnection implements UserDao {
	private int noOfRecords;

	@Override
	public User checkUser(String username, String password) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "SELECT * FROM user WHERE username=? AND password=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("user_id"));
				u.setName(rs.getString("name"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setImage(rs.getString("image"));
				u.setEmail(rs.getString("email"));
				u.setLevel(rs.getInt("level"));
				u.setLocation(rs.getString("location"));
				u.setPhone(rs.getString("phone"));
				return u;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User get(String username) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "SELECT * FROM user WHERE username=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("user_id"));
				u.setName(rs.getString("name"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setImage(rs.getString("image"));
				u.setEmail(rs.getString("email"));
				u.setLevel(rs.getInt("level"));
				u.setLocation(rs.getString("location"));
				u.setPhone(rs.getString("phone"));
				return u;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User get(int id) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "SELECT * FROM user WHERE user_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("user_id"));
				u.setName(rs.getString("name"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setImage(rs.getString("image"));
				u.setEmail(rs.getString("email"));
				u.setLevel(rs.getInt("level"));
				u.setLocation(rs.getString("location"));
				u.setPhone(rs.getString("phone"));
				return u;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;  
	}

	@Override
	public List<User> getUserList(int page, int recordsPerPage) {
		Connection con = super.getDBConnection();
		List<User> list = new ArrayList<User>();
		Statement st = null;
		String sql = "SELECT * FROM user limit "+ page +","+recordsPerPage;
		try {
			st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("user_id"));
				u.setName(rs.getString("name"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setImage(rs.getString("image"));
				u.setEmail(rs.getString("email"));
				u.setLevel(rs.getInt("level"));
				u.setLocation(rs.getString("location"));
				u.setPhone(rs.getString("phone"));
				list.add(u);
			}
			rs = st.executeQuery("SELECT COUNT(*) FROM user");// lấy tất cả các bản ghi.
			if(rs.next()) {
				this.noOfRecords = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getTotalRecords() {
		// TODO Auto-generated method stub
		return noOfRecords;
	}

	@Override
	public void add(User user) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "INSERT INTO user(name,username,password,image,email,level,location,phone) VALUES(?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getImage());
			ps.setString(5, user.getEmail());
			ps.setInt(6, user.getLevel());
			ps.setString(7, user.getLocation());
			ps.setString(8, user.getPhone());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void edit(User user) {
		Connection con = super.getDBConnection();
		PreparedStatement ps = null;
		String sql = "UPDATE user SET name=?,username=?,password=?,image=?,email=?,level=?,location=?,phone=? WHERE user_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getImage());
			ps.setString(5, user.getEmail());
			ps.setInt(6, user.getLevel());
			ps.setString(7, user.getLocation());
			ps.setString(8, user.getPhone());
			ps.setInt(9, user.getId());
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
		String sql = "DELETE FROM user WHERE user_id=?";
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
	public List<User> search(String key, int page, int recordsPerPage ) {
		Connection con = super.getDBConnection();
		List<User> list = new ArrayList<User>();
		PreparedStatement ps = null;
		String sql = "SELECT * FROM user WHERE name LIKE ? LIMIT ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+key+"%");
			ps.setInt(2, page);
			ps.setInt(3, recordsPerPage);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("user_id"));
				u.setName(rs.getString("name"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setImage(rs.getString("image"));
				u.setEmail(rs.getString("email"));
				u.setLevel(rs.getInt("level"));
				u.setLocation(rs.getString("location"));
				u.setPhone(rs.getString("phone"));
				list.add(u);
			}
			
			ps = con.prepareStatement("SELECT COUNT(*) FROM user WHERE name LIKE ?");
			ps.setString(1, "%"+key+"%");
			rs= ps.executeQuery();
			if(rs.next()) {
				this.noOfRecords = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
		
}
