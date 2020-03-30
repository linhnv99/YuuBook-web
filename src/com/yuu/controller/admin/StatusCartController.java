package com.yuu.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.CartDao;
import com.yuu.daoimpl.CartDaoImpl;
import com.yuu.model.Cart;
@WebServlet(urlPatterns = "/admin/order-status")
public class StatusCartController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cartID = req.getParameter("id");
		CartDao cartDao = new CartDaoImpl();
		Cart cart = cartDao.get(cartID);
		cartDao.EditStatus(cart);
		resp.sendRedirect(req.getContextPath() + "/admin/order-list");
	}
}
