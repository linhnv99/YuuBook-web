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
@WebServlet(urlPatterns = "/admin/add-product")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddProductController extends HttpServlet{
	ProductDao productDao = new ProductDaoImpl();
	CategoryDao cateDao = new CategoryDaoImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> cateList = new ArrayList<Category>();
		cateList = cateDao.getAll();
		req.setAttribute("cateList", cateList);
		req.setAttribute("path", req.getRequestURL());
		req.getServletContext().getRequestDispatcher("/admin/view/add-product.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		double price = Double.parseDouble(req.getParameter("price"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		String des = req.getParameter("des");
		int discount = Integer.parseInt(req.getParameter("discount"));
		
		int cateId = Integer.parseInt(req.getParameter("cate"));
		Category cate = cateDao.get(cateId);
		
		Part part = req.getPart("image");
		String filename = Common.extractFile(part);
		
		String savePath = "F:\\JavaWeb\\YuuBook\\WebContent\\uploads\\product" + File.separator + filename;
		File file = new File(savePath);
		part.write(savePath + File.separator);// write file
		
		
		Product product = new Product();
		product.setName(name);
		product.setImage(filename);
		product.setPrice(price);
		product.setQuantity(quantity);
		product.setCategory(cate);
		product.setDes(des);
		product.setDiscount(discount);
		
		productDao.add(product);
		resp.sendRedirect(req.getContextPath() + "/admin/product-list");
	}
}
