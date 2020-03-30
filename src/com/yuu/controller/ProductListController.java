package com.yuu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.CategoryDao;
import com.yuu.dao.ProductDao;
import com.yuu.daoimpl.CategoryDaoImpl;
import com.yuu.daoimpl.ProductDaoImpl;
import com.yuu.model.Category;
import com.yuu.model.Product;

@WebServlet(urlPatterns = "/product/list")
public class ProductListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> productList = new ArrayList<Product>();
		ProductDao productDao = new ProductDaoImpl();

		int page = 1;
		int recordsPerPage = 9;

		if (req.getParameter("page") != null)
			page = Integer.parseInt(req.getParameter("page"));

		productList = productDao.getProductList((page - 1) * recordsPerPage, recordsPerPage);
		int totalRecords = productDao.getTotalRecords();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

		req.setAttribute("productList", productList);
		req.setAttribute("currentPage", page);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("totalRecords", totalRecords);

		req.getServletContext().getRequestDispatcher("/client/view/product-grid.jsp").forward(req, resp);
	}
}
