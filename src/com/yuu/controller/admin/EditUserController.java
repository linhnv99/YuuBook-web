package com.yuu.controller.admin;

import java.io.File;
import java.io.IOException;

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

@WebServlet(urlPatterns = "/admin/edit-user")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EditUserController extends HttpServlet {
	UserDao userDao = new UserDaoImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = Integer.parseInt(req.getParameter("id"));
		User user = userDao.get(userId);

		req.setAttribute("user", user);
		req.getServletContext().getRequestDispatcher("/admin/view/edit-user.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String name, username, password, avatar, email, location, filename, phone;
		int level, id;
		name = req.getParameter("name");
		username = req.getParameter("username");
		password = req.getParameter("password");
		email = req.getParameter("email");
		location = req.getParameter("location");
		level = Integer.parseInt(req.getParameter("level"));
		id = Integer.parseInt(req.getParameter("id"));
		phone = req.getParameter("phone");
		//TH: Nếu đổi username => kiểm tra tồn tại
		User userInfor = userDao.get(id);
		if(userInfor.getUsername().equals(username)) {
		}else {
			User checkUserName = userDao.get(username);
			if (checkUserName!=null) {
				req.setAttribute("errMess", "Tên người dùng đã tồn tại.");
				req.setAttribute("user", userInfor);
				req.getServletContext().getRequestDispatcher("/admin/view/edit-user.jsp").forward(req, resp);
				return;
			}
		}
		
		if (Common.validUserName(username)) {
			req.setAttribute("errMess", "Username không được chứa khoảng trắng.");
			req.setAttribute("user", userInfor);
			req.getServletContext().getRequestDispatcher("/admin/view/edit-user.jsp").forward(req, resp);
			return;
		}
		
		if(Common.checkEmpty(name, username, password)) {
			req.setAttribute("errMess", "Nhập sai.");
			req.setAttribute("user", userInfor);
			req.getServletContext().getRequestDispatcher("/admin/view/edit-user.jsp").forward(req, resp);
			return;
		}
		
		// process image
		Part part = req.getPart("avatar");
		filename = Common.extractFile(part);
		if (!"".equals(filename)) {
			String savePath = "F:\\JavaWeb\\YuuBook\\WebContent\\uploads\\avatar" + File.separator + filename;
			File file = new File(savePath);
			part.write(savePath + File.separator);// write file
		} else {
			filename = req.getParameter("old-image");
		}
		
		User user = new User(id, level, name, username, password, filename, email, location, phone);
		userDao.edit(user);
		resp.sendRedirect(req.getContextPath() + "/admin/user-list");
	}
}
