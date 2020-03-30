package com.yuu.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yuu.dao.UserDao;
import com.yuu.daoimpl.UserDaoImpl;
import com.yuu.model.User;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/client/view/login.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String remember = req.getParameter("remember");
		String errMess = "";
		boolean isRemember = false;
		
		if("".equals(username.trim()) || "".equals(password.trim())) {
			errMess = "Username and password can't be empty!";
			req.setAttribute("errMess", errMess);
			req.getServletContext().getRequestDispatcher("/client/view/login.jsp").forward(req, resp);
			return;
		}
		if("on".equals(remember)) {
			isRemember = true;
		}
		UserDao userDao = new UserDaoImpl();
		User user = userDao.checkUser(username, password);
		HttpSession session = req.getSession();
		
		if(user!=null) {
			session.setAttribute("account", user);
			if(isRemember) {
				saveAccount(resp, user);
			}
			resp.sendRedirect(req.getContextPath()+"/middle");
		}else {
			errMess = "Username or password doesn't exist!";
			req.setAttribute("errMess", errMess);
			req.getServletContext().getRequestDispatcher("/client/view/login.jsp").forward(req, resp);
			return;
		}
		
	}
	private void saveAccount(HttpServletResponse resp, User user) {
		Cookie username = new Cookie("username", user.getUsername());
		Cookie rememberMe = new Cookie("rememberMe","on");
		username.setMaxAge(60*60*24);
		rememberMe.setMaxAge(60*60*24);
		resp.addCookie(username);
		resp.addCookie(rememberMe);
	}
}
