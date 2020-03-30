package com.yuu.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.CategoryDao;
import com.yuu.daoimpl.CategoryDaoImpl;
import com.yuu.model.Category;
@WebServlet(urlPatterns = "/admin/add-category")
public class AddCategoryController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		if("".equals(name.trim())) {
			req.setAttribute("errMess", "Không được để trống.");
			req.getServletContext().getRequestDispatcher("/admin/category").forward(req, resp);
			return;
		}
		CategoryDao cateDao = new CategoryDaoImpl();
		Category cate = new Category();
		cate.setName(name);
		cateDao.add(cate);
		resp.sendRedirect(req.getContextPath() + "/admin/category");
	}
}
