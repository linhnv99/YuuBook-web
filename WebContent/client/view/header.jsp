<%@page import="com.yuu.model.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="com.yuu.model.User"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<style>
	.home-hover:hover .home-hover-a {
	color: #dc3545;
	text-decoration: underline;
}
</style>
<header>
	<%
		User userAcc = (User)session.getAttribute("account");
	%>
	<div class="header-top-wrapper-2 border-bottom-2">
		<div class="header-info-wrapper pl-200 pr-200">
			<div class="header-contact-info">
				<ul>
					<li><i class="pe-7s-call"></i> +84 986 613 124</li>
					<li><i class="pe-7s-mail"></i> <a href="#">babeyuu55@gmail.com</a></li>
				</ul>
			</div>
			<div class="electronics-login-register">
				<ul>
					<li><a href="#"><i class="pe-7s-users"></i>My Account</a></li>
					<li>
						<%if(userAcc!=null){ %>
							<a href="<%=Common.url%>/logout"><i class="ti-user"></i> Logout</a>
						<%}else{ %>
							<a href="<%=Common.url%>/login"><i class="ti-user"></i>Login</a>
						<%} %>
					</li>
					<li><a href="<%=Common.url%>/register"><i class="ti-settings"></i> Register</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="header-bottom pt-40 pb-30 clearfix">
		<div class="header-bottom-wrapper pr-200 pl-200">
			<div class="logo-3">
				<a href="<%=Common.url%>/home"> 
					<span style="font-size: 30px; font-weight: bold;">YuuBook</span>.com
				</a>
			</div>
			<div class="categories-search-wrapper categories-search-wrapper2">
				<div class="all-categories">
					<div class="select-wrapper">
						<select class="select" name="select">
							<option value="">All Categories</option>
							<option value="">Smartphones</option>
							<option value="">Computers</option>
							<option value="">Laptops</option>
						</select>
					</div>
				</div>
				<div class="categories-wrapper">
                    <form action="<%=Common.url %>/product/search-name">
                        <input type="text"  placeholder="Enter your keyword" name="key">
                        <button type="submit" >Search</button>
                    </form>
                </div>
			</div>
			<div class="trace-cart-wrapper">
				<div class="categories-cart same-style">
					<%
						List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart");
					%>
					<div class="same-style-icon">
						<a href="<%=Common.url%>/cart"><i class="pe-7s-cart"></i></a>
					</div>
					<div class="same-style-text">
						<a href="<%=Common.url%>/cart">My Cart <br><%=cartList!=null ? cartList.size() : 0 %> Item
						</a>
					</div>
				</div>
			</div>

			<!-- mobile menu -->
			<div
				class="mobile-menu-area electro-menu d-md-block col-md-12 col-lg-12 col-12 d-lg-none d-xl-none">
				<div class="mobile-menu">
					<nav id="mobile-menu-active">
						<ul class="menu-overflow">
							<li><a href="#">HOME</a>
								<ul>
									<li><a href="index.html">Fashion</a></li>

								</ul></li>
							<li><a href="#">pages</a>
								<ul>
									<li><a href="about-us.html">about us</a></li>
								</ul></li>
							<li><a href="<%=Common.url%>/product/list">shop</a>
								<ul>
									<li><a href="shop-grid-2-col.html"> grid 2 column</a></li>
								</ul></li>
							<li><a href="#">BLOG</a>
								<ul>
									<li><a href="blog.html">blog 3 colunm</a></li>
								</ul></li>
							<li><a href="contact.html"> Contact </a></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- end mobile -->
		</div>
	</div>
</header>