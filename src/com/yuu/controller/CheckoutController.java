package com.yuu.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yuu.common.Common;
import com.yuu.dao.CartDao;
import com.yuu.dao.CartItemDao;
import com.yuu.daoimpl.CartDaoImpl;
import com.yuu.daoimpl.CartItemDaoImpl;
import com.yuu.model.Cart;
import com.yuu.model.CartItem;
import com.yuu.model.User;

@WebServlet(urlPatterns = "/client/checkout")
public class CheckoutController extends HttpServlet {
	DateFormat df = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	CartItemDao cItemDao = new CartItemDaoImpl();
	CartDao cartDao = new CartDaoImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session.getAttribute("account") == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		req.getServletContext().getRequestDispatcher("/client/view/checkout.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");

		User buyer = new User();
		buyer = (User) session.getAttribute("account");

		Cart cart = new Cart();
		Date date = new Date();
		cart.setId(Common.getRandomUUID());
		cart.setBuyer(buyer);
		cart.setStatus(0);
		cart.setName(name);
		cart.setAddress(address);
		cart.setEmail(email);
		cart.setPhone(phone);
		cart.setBuyDate(df.format(date));

		cartDao.add(cart);

		List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart");

		// Thêm cart_id cho từng item
		for (CartItem item : cartList) {
			item.setCart(cart);
			cItemDao.add(item);
		}

		session.removeAttribute("cart");
		resp.sendRedirect(req.getContextPath() + "/home");
	}

}
