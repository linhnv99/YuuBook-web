package com.yuu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

@WebServlet(urlPatterns = "/product/search-cate")
public class ProductSearchByCate extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		ProductDao productDao = new ProductDaoImpl();
		List<Product> productList = new ArrayList<Product>();
		CategoryDao cateDao = new CategoryDaoImpl();

		int page = 1;
		int recordsPerPage = 9;

		if (req.getParameter("page") != null)
			page = Integer.parseInt(req.getParameter("page"));

		productList = productDao.searchProductByCategory(id, (page - 1) * recordsPerPage, recordsPerPage);
		int totalRecords = productDao.getTotalRecords();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

		Category cate = cateDao.get(id);
		req.setAttribute("productList", productList);
		req.setAttribute("currentPage", page);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("totalRecords", totalRecords);
		req.setAttribute("cate", cate);
		req.getServletContext().getRequestDispatcher("/client/view/product-grid.jsp").forward(req, resp);
	}
}
