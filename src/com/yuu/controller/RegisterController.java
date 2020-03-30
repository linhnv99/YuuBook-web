package com.yuu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.common.Common;
import com.yuu.dao.UserDao;
import com.yuu.daoimpl.UserDaoImpl;
import com.yuu.model.User;
@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getServletContext().getRequestDispatcher("/client/view/register.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Set the default response content type and encoding
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		int level = 2;
		String image = "";
		UserDao userDao = new UserDaoImpl();
		
		User checkUserName = userDao.get(username);
		if (checkUserName != null) {
			req.setAttribute("errMess", "Tên người dùng đã tồn tại.");
			req.getServletContext().getRequestDispatcher("/client/view/register.jsp").forward(req, resp);
			return;
		}
		if (Common.validUserName(username)) {
			req.setAttribute("errMess", "Username không được chứa khoảng trắng.");
			req.getServletContext().getRequestDispatcher("/client/view/register.jsp").forward(req, resp);
			return;
		}
		if (Common.checkEmpty(name, username, password)) {
			req.setAttribute("errMess", "Không được để trống.");
			req.getServletContext().getRequestDispatcher("/client/view/register.jsp").forward(req, resp);
			return;
		}
		
		User user = new User();
		user.setName(name);
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setImage(image);
		user.setLevel(level);
		userDao.add(user);
		resp.sendRedirect(req.getContextPath() + "/login");
	}
}
