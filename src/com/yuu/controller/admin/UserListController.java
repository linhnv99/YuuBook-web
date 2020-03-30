package com.yuu.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.UserDao;
import com.yuu.daoimpl.UserDaoImpl;
import com.yuu.model.User;

@WebServlet(urlPatterns = "/admin/user-list")
public class UserListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<User> userList = new ArrayList<User>();
		UserDao userDao = new UserDaoImpl();

		int page = 1;
		int recordsPerPage = 10;
		
		if(req.getParameter("page")!=null)
			page = Integer.parseInt(req.getParameter("page"));
		
		userList = userDao.getUserList((page - 1) * recordsPerPage, recordsPerPage);
		int totalRecords = userDao.getTotalRecords();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);


		req.setAttribute("userList", userList);
		req.setAttribute("currentPage", page);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("totalRecords", totalRecords);
		req.setAttribute("path", req.getRequestURL());
		req.getServletContext().getRequestDispatcher("/admin/view/user.jsp").forward(req, resp);
	}
}
