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
import com.yuu.daoimpl.CategoryDaoImpl;
import com.yuu.model.Category;
@WebServlet(urlPatterns = "/admin/category")
public class CategoryController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String errMess = "";
		if(req.getAttribute("errMess")!=null) {
			errMess =(String) req.getAttribute("errMess");
		}
		CategoryDao  cateDao = new CategoryDaoImpl();
		List<Category> list = new ArrayList<Category>();
		list = cateDao.getAll();
		
		req.setAttribute("cateList", list);
		req.setAttribute("errMess", errMess);
		
		req.setAttribute("path", req.getRequestURL());
		req.getServletContext().getRequestDispatcher("/admin/view/category.jsp").forward(req, resp);
	}
}
