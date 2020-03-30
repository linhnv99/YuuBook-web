package com.yuu.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.yuu.common.Common;
import com.yuu.dao.CategoryDao;
import com.yuu.dao.ProductDao;
import com.yuu.daoimpl.CategoryDaoImpl;
import com.yuu.daoimpl.ProductDaoImpl;
import com.yuu.model.Category;
import com.yuu.model.Product;
@WebServlet(urlPatterns = "/admin/edit-product")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EditProductController extends HttpServlet{
	ProductDao productDao = new ProductDaoImpl();
	CategoryDao cateDao = new CategoryDaoImpl();
	Product product = new Product();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> cateList = new ArrayList<Category>();
		int id = Integer.parseInt(req.getParameter("id"));
		cateList = cateDao.getAll();
		product = productDao.get(id);
		req.setAttribute("cateList", cateList);
		req.setAttribute("product", product);
		req.setAttribute("path", req.getRequestURL());
		req.getServletContext().getRequestDispatcher("/admin/view/edit-product.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		double price = Double.parseDouble(req.getParameter("price"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		String des = req.getParameter("des");
		int discount = Integer.parseInt(req.getParameter("discount"));
		System.out.println(discount);
		
		
		int cateId = Integer.parseInt(req.getParameter("cate"));
		Category cate = cateDao.get(cateId);
		
		Part part = req.getPart("image");
		String imageUrl = Common.extractFile(part);
		if (!"".equals(imageUrl)) {
			String savePath = "F:\\JavaWeb\\YuuBook\\WebContent\\uploads\\product" + File.separator + imageUrl;
			File file = new File(savePath);
			part.write(savePath + File.separator);// write file
		}else {
			product = productDao.get(id);
			imageUrl = product.getImage();
		}
		
		Product product = new Product(id,name,price,imageUrl,quantity, cate, des, discount);
		
		productDao.edit(product);
		resp.sendRedirect(req.getContextPath() + "/admin/product-list");
	}
}
