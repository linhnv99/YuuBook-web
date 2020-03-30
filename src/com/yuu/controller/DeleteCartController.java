package com.yuu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yuu.model.CartItem;
@WebServlet(urlPatterns = "/delete-cart")
public class DeleteCartController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int index = Integer.parseInt(req.getParameter("idx"));
		HttpSession session = req.getSession();
		List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart");
		cartList.remove(index);
		resp.sendRedirect(req.getContextPath() + "/cart");
	}
}
