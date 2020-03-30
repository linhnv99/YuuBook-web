package com.yuu.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yuu.dao.UserDao;
import com.yuu.daoimpl.UserDaoImpl;
import com.yuu.model.User;

@WebServlet(urlPatterns = "/admin/profile")
public class ProfileController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User userAcc = (User) session.getAttribute("account");
		req.setAttribute("userAcc", userAcc);
		
	}
}
