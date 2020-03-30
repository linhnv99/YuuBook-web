package com.yuu.controller;

import java.io.IOException;
import java.util.ArrayList;

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
@WebServlet(urlPatterns = "/home")
public class HomeController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CategoryDao cateDao = new CategoryDaoImpl();
		ProductDao productDao = new ProductDaoImpl();
		
		ArrayList<Category> cateList = (ArrayList<Category>) cateDao.getAll();
		ArrayList<Product> productList = (ArrayList<Product>) productDao.getAll();
		
		req.setAttribute("cateList", cateList);
		req.setAttribute("productList", productList);
		req.getServletContext().getRequestDispatcher("/client/view/index.jsp").forward(req, resp);
	}
}
