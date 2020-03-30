package com.yuu.controller.admin;

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

@WebServlet(urlPatterns = "/admin/product-list")
public class ProductListController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> productList = new ArrayList<Product>();
		List<Category> cateList = new ArrayList<Category>();
		ProductDao productDao = new ProductDaoImpl();
 
		int page = 1;
		int recordsPerPage = 8;

		if (req.getParameter("page") != null)
			page = Integer.parseInt(req.getParameter("page"));

		productList = productDao.getProductList((page - 1) * recordsPerPage, recordsPerPage);
		int totalRecords = productDao.getTotalRecords();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);
		//get category
		CategoryDao cateDao = new CategoryDaoImpl();
		cateList = (List<Category>) cateDao.getAll();

		req.setAttribute("productList", productList);
		req.setAttribute("currentPage", page);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("totalRecords", totalRecords);
		req.setAttribute("cateList", cateList);

		req.setAttribute("path", req.getRequestURL());
		req.getServletContext().getRequestDispatcher("/admin/view/product.jsp").forward(req, resp);
	}
}
