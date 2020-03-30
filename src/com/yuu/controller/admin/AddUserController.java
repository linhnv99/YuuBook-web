package com.yuu.controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.yuu.common.Common;
import com.yuu.dao.UserDao;
import com.yuu.daoimpl.UserDaoImpl;
import com.yuu.model.User;

@WebServlet(urlPatterns = "/admin/add-user")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddUserController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("path", req.getRequestURL());
		req.getServletContext().getRequestDispatcher("/admin/view/add-user.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Set the default response content type and encoding
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		UserDao userDao = new UserDaoImpl();
		String name, username, password, avatar, email, location, filename, phone;
		int level;
		name = req.getParameter("name");
		username = req.getParameter("username");
		password = req.getParameter("password");
		email = req.getParameter("email");
		location = req.getParameter("location");
		level = Integer.parseInt(req.getParameter("level"));
		phone = req.getParameter("phone");
		
		User checkUserName = userDao.get(username);
		if (checkUserName != null) {
			req.setAttribute("errMess", "Tên người dùng đã tồn tại.");
			req.getServletContext().getRequestDispatcher("/admin/view/add-user.jsp").forward(req, resp);
			return;
		}
		if (Common.validUserName(username)) {
			req.setAttribute("errMess", "Username không được chứa khoảng trắng.");
			req.getServletContext().getRequestDispatcher("/admin/view/add-user.jsp").forward(req, resp);
			return;
		}
		if (Common.checkEmpty(name, username, password)) {
			req.setAttribute("errMess", "Nhập sai.");
			req.getServletContext().getRequestDispatcher("/admin/view/add-user.jsp").forward(req, resp);
			return;
		}

		// process image
		Part part = req.getPart("avatar");
		filename = Common.extractFile(part);
		if (!"".equals(filename)) {
			String savePath = "F:\\JavaWeb\\YuuBook\\WebContent\\uploads\\avatar" + File.separator + filename;
			File file = new File(savePath);
			part.write(savePath + File.separator);// write file
		}

		User user = new User();
		user.setName(name);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setImage(filename);
		user.setLevel(level);
		user.setLocation(location);
		user.setPhone(phone);
		userDao.add(user);

		resp.sendRedirect(req.getContextPath() + "/admin/user-list");
	}
}
