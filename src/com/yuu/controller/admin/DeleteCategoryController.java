package com.yuu.controller.admin;

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
@WebServlet(urlPatterns = "/admin/delete-category")
public class DeleteCategoryController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		CategoryDao cateDao = new CategoryDaoImpl();
		ProductDao productDao = new ProductDaoImpl();
		ArrayList<Category> cateList = (ArrayList<Category>) cateDao.getAll();
		if(productDao.checkCategory(id)) {
			req.setAttribute("cateList", cateList);
			req.setAttribute("notDelete", "Không thành công ! Vui lòng xóa các sản phẩm có tên danh mục này trước.");
			req.getServletContext().getRequestDispatcher("/admin/view/category.jsp").forward(req, resp);
			return;
		}
		cateDao.delete(id);
		resp.sendRedirect(req.getContextPath() + "/admin/category");
	}
}
