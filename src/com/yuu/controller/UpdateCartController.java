package com.yuu.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yuu.model.CartItem;
@WebServlet(urlPatterns = "/update-cart")
public class UpdateCartController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart");
		
		String action = req.getParameter("action");
		int index = Integer.parseInt(req.getParameter("idx"));
		int quantity = cartList.get(index).getQuantity();
		if(action == null) {
		}
		if("asc".equals(action)) {
			int q = cartList.get(index).getProduct().getQuantity();// số lượng của mặt hàng
			if(cartList.get(index).getQuantity() >= q) {
				req.setAttribute("errMess", "Hàng trong kho không đủ.");
				req.setAttribute("cartList", cartList);
				req.getServletContext().getRequestDispatcher("/client/view/cart.jsp").forward(req, resp);
				return;
			}
			cartList.get(index).setQuantity(quantity + 1);
		}
		if("desc".equals(action)) {
			if(quantity == 1) {
				cartList.get(index).setQuantity(quantity);
			}else {
				cartList.get(index).setQuantity(quantity - 1);
			}
		}
		resp.sendRedirect(req.getContextPath() + "/cart");
	}
}
