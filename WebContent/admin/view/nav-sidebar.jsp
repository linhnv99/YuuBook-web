<%@page import="com.yuu.common.Common"%>
<%@page import="com.yuu.model.User"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%
	StringBuffer path = (StringBuffer) request.getAttribute("path");
%>
<%
	User userAcc = (User) session.getAttribute("account");
%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><span>YuuBook</span>Admin</a>
			<ul class="user-menu">
				<li class="dropdown pull-right"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> 
					<%if("".equals(userAcc.getImage())){ %>
						<span class="glyphicon glyphicon-user"></span> 
					<%} else {%>
						<img class="rounded" src="<%=Common.url %>/uploads/avatar/<%=userAcc.getImage() %>"
						style="width: 32px; height: 32px;border-radius: 50%;"/>
					<%} %>
					<span class="ml-10">
						<%=userAcc != null ? userAcc.getName() : ""%>
					</span>
						
					<span class="caret"></span></a>
					
					<ul class="dropdown-menu" role="menu">
						<li><a href="<%=Common.url%>/admin/profile"><span
								class="glyphicon glyphicon-user"></span> Profile</a></li>
						<li><a href="<%=Common.url%>/logout"><span
								class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>
<!-- navbar -->
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
	<form role="search">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="Search">
		</div>
	</form>
	<ul class="nav menu">
		<li
			class="<%=path != null && path.indexOf("dashboard") > -1 ? "active" : ""%>">
			<a href="<%=Common.url%>/admin/dashboard"><span
				class="glyphicon glyphicon-dashboard"></span> Trang chủ</a>
		</li>
		<li
			class="<%=path != null && path.indexOf("product") > -1 ? "active" : ""%>"><a
			href="<%=Common.url%>/admin/product-list"><svg class="glyph stroked calendar">
						<use xlink:href="#stroked-calendar" /></svg> </span> Sản phẩm</a></li>
		<li
			class="<%=path != null && path.indexOf("category") > -1 ? "active" : ""%>">
			<a href="<%=Common.url%>/admin/category"><span
				class="glyphicon glyphicon-list-alt"></span> Danh mục</a>
		</li>
		<li
			class="<%=path != null && path.indexOf("user") > -1 ? "active" : ""%>"><a
			href="<%=Common.url%>/admin/user-list"><span
				class="glyphicon glyphicon-user"></span> Người dùng</a></li>
		<li
			class="<%=path != null && path.indexOf("order") > -1 ? "active" : ""%>"
			><a href="<%=Common.url%>/admin/order-list"><svg class="glyph stroked bag">
						<use xlink:href="#stroked-bag"></use>
					</svg> Đơn Hàng</a></li>
		<p></p>
	</ul>
</div>
<!--/.sidebar-->
