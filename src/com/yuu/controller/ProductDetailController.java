package com.yuu.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.ProductDao;
import com.yuu.daoimpl.ProductDaoImpl;
import com.yuu.model.Product;
@WebServlet(urlPatterns = "/product/detail")
public class ProductDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		ProductDao productDao = new ProductDaoImpl();
		ArrayList<Product> productList = (ArrayList<Product>) productDao.getAll();
		Product product = productDao.get(id);
		req.setAttribute("product", product);
		req.setAttribute("productList", productList);
		req.getServletContext().getRequestDispatcher("/client/view/product-detail.jsp").forward(req, resp);
	}
}
