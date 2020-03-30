package com.yuu.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.CartDao;
import com.yuu.dao.CartItemDao;
import com.yuu.daoimpl.CartDaoImpl;
import com.yuu.daoimpl.CartItemDaoImpl;
@WebServlet(urlPatterns = "/admin/delete-order")
public class DeleteOrderController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cartID = req.getParameter("id");
		CartDao cartDao = new CartDaoImpl();
		CartItemDao cItemDao = new CartItemDaoImpl();
		cItemDao.delete(cartID);
		cartDao.delete(cartID);
		resp.sendRedirect(req.getContextPath() + "/admin/order-list");
	}
}
