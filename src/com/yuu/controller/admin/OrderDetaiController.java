package com.yuu.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yuu.dao.CartDao;
import com.yuu.dao.CartItemDao;
import com.yuu.daoimpl.CartDaoImpl;
import com.yuu.daoimpl.CartItemDaoImpl;
import com.yuu.model.Cart;
import com.yuu.model.CartItem;

@WebServlet(urlPatterns = "/admin/order-detail")
public class OrderDetaiController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cartID = req.getParameter("id");
		CartDao cartDao = new CartDaoImpl();
		CartItemDao cItemDao = new CartItemDaoImpl();
		Cart cart = cartDao.get(cartID);
		List<CartItem> cartItemList = cItemDao.getCartItem(cart);
		req.setAttribute("order", cart);
		req.setAttribute("cartItemList", cartItemList);
		req.getServletContext().getRequestDispatcher("/admin/view/order-detail.jsp").forward(req, resp);
	}
}
