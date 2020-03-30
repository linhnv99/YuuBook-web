package com.yuu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yuu.model.User;
@WebServlet(urlPatterns = "/middle")
public class MiddleController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session != null && session.getAttribute("account") != null) {
			User user = (User) session.getAttribute("account");
			if(user.getLevel() == 1) {
				resp.sendRedirect(req.getContextPath()+"/admin/dashboard");
			}else {
				resp.sendRedirect(req.getContextPath()+"/home");
			}
		}else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}
}
