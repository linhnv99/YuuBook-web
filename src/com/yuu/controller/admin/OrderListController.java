package com.yuu.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.CartDao;
import com.yuu.daoimpl.CartDaoImpl;
import com.yuu.model.Cart;

@WebServlet(urlPatterns = "/admin/order-list")
public class OrderListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CartDao cartDao = new CartDaoImpl();

		int page = 1;
		int recordsPerPage = 5;

		if (req.getParameter("page") != null)
			page = Integer.parseInt(req.getParameter("page"));
		List<Cart> orderList = cartDao.getOrderList((page - 1) * recordsPerPage, recordsPerPage);
		int totalRecords = cartDao.getTotalRecords();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

		req.setAttribute("orderList", orderList);
		req.setAttribute("currentPage", page);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("totalRecords", totalRecords);
		System.out.println(page);
		System.out.println(totalPages);
		System.out.println(totalRecords);
		req.setAttribute("path", req.getRequestURL());
		req.getServletContext().getRequestDispatcher("/admin/view/order-list.jsp").forward(req, resp);
	}
}
