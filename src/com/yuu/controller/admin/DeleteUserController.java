package com.yuu.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.UserDao;
import com.yuu.daoimpl.UserDaoImpl;
@WebServlet(urlPatterns = "/admin/delete-user")
public class DeleteUserController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		UserDao userDao = new UserDaoImpl();
		userDao.delete(id);
		resp.sendRedirect(req.getContextPath() + "/admin/user-list");
	}
}
