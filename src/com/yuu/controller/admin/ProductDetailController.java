package com.yuu.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.ProductDao;
import com.yuu.daoimpl.ProductDaoImpl;
import com.yuu.model.Product;
@WebServlet(urlPatterns = "/admin/product-detail")
public class ProductDetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		ProductDao productDao = new ProductDaoImpl();
		Product product = productDao.get(id);
		req.setAttribute("product", product);
		
		req.setAttribute("path", req.getRequestURL());
		req.getServletContext().getRequestDispatcher("/admin/view/detail.jsp").forward(req, resp);
	}
}
