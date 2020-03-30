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

@WebServlet(urlPatterns = "/admin/edit-category")
public class EditCategoryController extends HttpServlet {
	CategoryDao cateDao = new CategoryDaoImpl();
	Category cate = new Category();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		// lấy thông tin cate
		cate = cateDao.get(id);
		req.setAttribute("cate", cate);
		req.getServletContext().getRequestDispatcher("/admin/view/edit-category.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");

		if ("".equals(name.trim())) {
			cate = cateDao.get(id);

			req.setAttribute("errMess", "Không được để trống.");
			req.setAttribute("cate", cate);
			req.getServletContext().getRequestDispatcher("/admin/view/edit-category.jsp").forward(req, resp);
			return;
		}
		cate = new Category(id, name);
		cateDao.edit(cate);
		resp.sendRedirect(req.getContextPath() + "/admin/category");
	}
}
