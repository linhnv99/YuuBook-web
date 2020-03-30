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

@WebServlet(urlPatterns = "/admin/search-product")
public class SearchProductController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> productList = new ArrayList<Product>();
		ProductDao productDao = new ProductDaoImpl();
		CategoryDao cateDao = new CategoryDaoImpl();
		int cateID = Integer.parseInt(req.getParameter("cate"));
		String key = req.getParameter("key");

		if (cateID == 0 && "".equals(key.trim())) {
			resp.sendRedirect(req.getContextPath() + "/admin/product-list");
			return;
		}

		int page = 1;
		int recordsPerPage = 5;
		if (req.getParameter("page") != null)
			page = Integer.parseInt(req.getParameter("page"));
		productList = productDao.search(cateID, key, (page - 1) * recordsPerPage, recordsPerPage);
		int totalRecords = productDao.getTotalRecords();
		int totalPages = (int) Math.ceil(totalRecords * 1.0 / recordsPerPage);

		ArrayList<Category> cateList = (ArrayList<Category>) cateDao.getAll();
		Category cate = cateDao.get(cateID);

		req.setAttribute("productList", productList);
		req.setAttribute("currentPage", page);
		req.setAttribute("totalPages", totalPages);
		req.setAttribute("totalRecords", totalRecords);

		req.setAttribute("key", key);
		req.setAttribute("cate", cate);
		req.setAttribute("cateList", cateList);
		req.getServletContext().getRequestDispatcher("/admin/view/product.jsp").forward(req, resp);
	}
}
