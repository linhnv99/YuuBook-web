package com.yuu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.ProductDao;
import com.yuu.daoimpl.ProductDaoImpl;
import com.yuu.model.Product;
@WebServlet(urlPatterns = "/product/search-name")
public class ProductSearchByName extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String key = req.getParameter("key");
		ProductDao productDao = new ProductDaoImpl();
		List<Product> productList = new ArrayList<Product>();
		
		if("".equals(key.trim())) {
			resp.sendRedirect(req.getContextPath() + "/product/list");
			return;
		}
		
		
		int page = 1;
		int recordsPerPage = 9;

		if (req.getParameter("page") != null)
			page = Integer.parseInt(req.getParameter("page"));

		productList = productDao.searchProductByName(key, (page-1) * recordsPerPage, recordsPerPage);
		int totalRecords = productDao.getTotalRecords();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
		
		req.setAttribute("productList", productList);
		req.setAttribute("currentPage", page);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("totalRecords", totalRecords);
		req.setAttribute("key", key);
		req.getServletContext().getRequestDispatcher("/client/view/product-grid.jsp").forward(req, resp);
	}
}
