package com.yuu.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yuu.common.Common;
import com.yuu.dao.ProductDao;
import com.yuu.daoimpl.ProductDaoImpl;
import com.yuu.model.CartItem;
import com.yuu.model.Product;
@WebServlet(urlPatterns = "/add-to-cart")
public class AddToCartController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int proID = Integer.parseInt(req.getParameter("id"));
		double unitPrice = 0;
		ProductDao productDao = new ProductDaoImpl();
		Product product = productDao.get(proID);
		CartItem cItem = new CartItem();
		
		cItem.setId(Common.getRandomUUID());
		if(product.getDiscount()!=0) {
			unitPrice = product.getPrice() - (product.getPrice() * product.getDiscount() / 100);
		}else {
			unitPrice = product.getPrice();
		}
		cItem.setUnitPrice(unitPrice);
		cItem.setProduct(product);
		
		// Xử lý số lượng sản phẩm khi thêm vào giỏ hàng.
		HttpSession session = req.getSession();
		if(session.getAttribute("cart") == null) {
			List<CartItem> cartList = new ArrayList<CartItem>();
			cItem.setQuantity(1);
			cartList.add(cItem);
			session.setAttribute("cart", cartList);
		}else {
			List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart");
			int index = isExisting(proID, cartList);
			if(index == -1) {// chua tồn tại trong giỏ hàng
				cItem.setQuantity(1);
				cartList.add(cItem);
			}else {
				int q = cartList.get(index).getProduct().getQuantity();// số lượng của mặt hàng trong kho.
				if(cartList.get(index).getQuantity() >= q) {
					req.setAttribute("errMess", "Hàng trong kho không đủ.");
					req.setAttribute("cartList", cartList);
					req.getServletContext().getRequestDispatcher("/client/view/cart.jsp").forward(req, resp);
					return;
				}
				int quantity = cartList.get(index).getQuantity() + 1;
				cartList.get(index).setQuantity(quantity);
			}
			session.setAttribute("cart", cartList);
		}
		resp.sendRedirect(req.getContextPath() + "/cart");
	}

	private int isExisting(int proID, List<CartItem> cartList) {
		for(int i = 0; i < cartList.size(); i++) {
			if(cartList.get(i).getProduct().getId() ==  proID) {
				return i;
			}
		}
		return -1;
	}

}
