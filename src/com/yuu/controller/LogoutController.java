package com.yuu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(urlPatterns = "/logout")
public class LogoutController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.invalidate();
		Cookie[] cookies = req.getCookies();
		Cookie cUsername = new Cookie("username", null);
		Cookie cRemember = new Cookie("rememberMe", null);
		cUsername.setMaxAge(0);
		cRemember.setMaxAge(0);
		resp.addCookie(cUsername);
		resp.addCookie(cRemember);
//		req.setAttribute("mess", "Logout success!");
//		req.getServletContext().getRequestDispatcher("/admin/view/login.jsp").forward(req, resp);
		resp.sendRedirect(req.getContextPath()+"/login");
	}
}
