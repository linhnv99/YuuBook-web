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

@WebServlet(urlPatterns = "/admin/search-user")
public class SearchUserController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao userDao = new UserDaoImpl();
		List<User> resultSearch = new ArrayList<User>();
		
		String key = req.getParameter("key");
		if("".equals(key.trim())) {
			resp.sendRedirect(req.getContextPath()+"/admin/user-list");
		}
		else {
			int page = 1;
			int recordsPerPage = 3;
			if(req.getParameter("page")!=null)
				page = Integer.parseInt(req.getParameter("page"));
			
			resultSearch = userDao.search(key, (page - 1) * recordsPerPage, recordsPerPage);
			int totalRecords = userDao.getTotalRecords();
			int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
			
			req.setAttribute("userList", resultSearch);
			req.setAttribute("currentPage", page);
			req.setAttribute("totalPages", totalPages);
			req.setAttribute("totalRecords", totalRecords);
			req.setAttribute("key", key);
			
			req.getServletContext().getRequestDispatcher("/admin/view/user.jsp").forward(req, resp);
		}
	}
}
