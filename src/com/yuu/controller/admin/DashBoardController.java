package com.yuu.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yuu.model.User;
@WebServlet(urlPatterns = "/admin/dashboard")
public class DashBoardController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("account");
		req.setAttribute("name", user.getName());
		req.setAttribute("path", req.getRequestURL());//url 

		req.getServletContext().getRequestDispatcher("/admin/view/index.jsp").forward(req, resp);
	}
}
