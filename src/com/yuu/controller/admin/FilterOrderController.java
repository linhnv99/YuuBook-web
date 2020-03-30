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
@WebServlet(urlPatterns = "/admin/filter")
public class FilterOrderController extends HttpServlet{
	CartDao cartDao = new CartDaoImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int status = Integer.parseInt(req.getParameter("status"));
		if(status == -1) {
			resp.sendRedirect(req.getContextPath() + "/admin/order-list");
			return;
		}else {
			int page = 1;
			int recordsPerPage = 5;
			if (req.getParameter("page") != null)
				page = Integer.parseInt(req.getParameter("page"));
			List<Cart> orderList = cartDao.filter(status, (page - 1) * recordsPerPage, recordsPerPage);
			int totalRecords = cartDao.getTotalRecords();
			int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

			req.setAttribute("orderList", orderList);
			req.setAttribute("currentPage", page);
			req.setAttribute("totalPages", totalPages);
			req.setAttribute("totalRecords", totalRecords);

			req.setAttribute("path", req.getRequestURL());
			req.getServletContext().getRequestDispatcher("/admin/view/order-list.jsp").forward(req, resp);
		}
	}
}
