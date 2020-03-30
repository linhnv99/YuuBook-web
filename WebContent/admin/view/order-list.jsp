<%@page import="java.text.DecimalFormat"%>
<%@page import="com.yuu.model.CartItem"%>
<%@page import="com.yuu.daoimpl.CartItemDaoImpl"%>
<%@page import="com.yuu.dao.CartItemDao"%>
<%@page import="com.yuu.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Đơn hàng</title>
</head>
<link href="<%=Common.url%>/admin/static/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=Common.url%>/admin/static/css/styles.css" rel="stylesheet">
<style>
	tr td,th{
	text-align: center;
	}
</style>
<body>
	<%
		String key = (String) request.getAttribute("key");
		String status = request.getParameter("status");
	%>
	<%@include file="nav-sidebar.jsp"%>
	<!-- navbar-sidebar -->
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Đơn hàng</li>
			</ol>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Danh sách đơn hàng</h2>
			</div>
		</div>
		<!--/.row-->
		<div class="row">
			<div class="col-sm-12">
				<div
					style="display: flex; justify-content: space-between; margin-top: 15px;">
					<form action="<%=Common.url %>/admin/search-order" method="GET">
						<input class="search" type="text" placeholder="Tìm kiếm theo tên người nhận" name="key" 
						value="<%=key!=null ? key : "" %>">
						<button class="btn btn-primary">Tìm kiếm</button>
					</form>
					<form action="<%=Common.url%>/admin/filter">
						<select class="search" name="status">
							<option value="-1" >-- Trạng thái --</option>
							<option value="0" <%=status!=null && "0".equals(status) ? "selected" : "" %>>Đang xử lý</option>
							<option value="1" <%=status!=null && "1".equals(status) ? "selected" : "" %>>Đã xử lý xong</option>
						</select>
						<button class="btn btn-primary">Lọc</button>
					</form>
				</div>
				<table class="table table-striped mt-10">
					<tr id="tbl-first-row">
						<th width="6%">Tài khoản</th>
						<th width="8%">Tên người nhận</th>
						<th width="8%">Số điện thoại</th>
						<th width="10%">Email</th>
						<th width="8%">Tổng Tiền</th>
						<th width="10%">Ngày tạo</th>
						<th width="8%">Trạng thái</th>
						<th width="10%">Tùy chọn</th>
					</tr>
					<%
						List<Cart> orderList = (List<Cart>) request.getAttribute("orderList");
						DecimalFormat df = new DecimalFormat("###,###,###");
						CartItemDao cItemDao = new CartItemDaoImpl();
					%>
					<%if(orderList!=null)
						for(Cart cart : orderList){	
					%>
						<tr>
		                    <td><%=cart.getBuyer().getUsername() %></td>
		                    <td><%=cart.getName() %></td>
		                    <td><%=cart.getPhone() %></td>
		                    <td><%=cart.getEmail() %></td>
		                    <%
		                    	double totalOrder = 0;
		                    	List<CartItem> cartItemList = cItemDao.getCartItem(cart); 
		                    	if(cartItemList!=null){
		                    		for(CartItem cItem : cartItemList){
		                    			totalOrder += cItem.getQuantity() * cItem.getUnitPrice();
		                    		}
		                    	}
		                    %>
		                    <td><%=df.format(totalOrder) %> VND</td>
		                    <td><%=cart.getBuyDate() %></td>
		                    <td>
		                    	<%if(cart.getStatus()==0){ %>
		                    	<span>
		                    		<a href="<%=Common.url %>/admin/order-status?id=<%=cart.getId() %>" style="display:block; height: 30px;">
		                    		<svg style="color: red;" class="glyph stroked cancel"><use xlink:href="#stroked-cancel"/></svg></a>
		                    		Đang xử lý 
		                    	</span>
		                    	<%}else{ %>
		                    	<span>
		                    		<a href="<%=Common.url %>/admin/order-status?id=<%=cart.getId() %>" style="display:block; height: 30px;">
		                    		<svg style="color: green; font-weight: bold" class="glyph stroked checkmark"><use xlink:href="#stroked-checkmark"/></svg></a>
		                    		Đã xong 
		                    	</span>
		                    	<%} %>
		                    </td>
							<td>
								<a class="btn btn-primary" href="<%=Common.url%>/admin/order-detail?id=<%=cart.getId()%>">Chi tiết</a>
								<a class="btn btn-danger"
									href="<%=Common.url %>/admin/delete-order?id=<%=cart.getId() %>"
									onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
							</td>
						</tr>
					<%} %>
				</table>
				<div class="clearfix"></div>
				<%
					int totalPages = (int) request.getAttribute("totalPages");
					int currentPage = (int) request.getAttribute("currentPage");
					int totalRecords = (int) request.getAttribute("totalRecords");
				%>
				
				<%if(key!=null){ %>
					<span>
					Tổng số: <%=totalRecords %> đơn hàng.
					</span>
					<div aria-label="Page navigation">
						<ul class="pagination">
							<%if(currentPage != 1){ %>
								<li><a aria-label="Previous" href="search-order?page=<%=currentPage-1 %>&&key=<%=key %> "> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<%} %>
							
							<%for(int i = 1; i <= totalPages; i++){ %>
								<li class="<%=i==currentPage ? "active" : ""%>"><a href="search-order?page=<%=i%>&&key=<%=key %>"><%=i %></a></li>
							<%} %>
							
							<%if(currentPage != totalPages){ %>
								<li><a aria-label="Next" href="search-order?page=<%=currentPage+1 %>&&key=<%=key %>"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
							<%} %>
						</ul>
					</div>
				<%} else if("0".equals(status) || "1".equals(status)){ %>
					<span>
					Tổng số: <%=totalRecords %> đơn hàng.
					</span>
					<div aria-label="Page navigation">
						<ul class="pagination">
							<%if(currentPage != 1){ %>
								<li><a aria-label="Previous" href="filter?page=<%=currentPage-1 %>&&status=<%=status %> "> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<%} %>
							
							<%for(int i = 1; i <= totalPages; i++){ %>
								<li class="<%=i==currentPage ? "active" : ""%>"><a href="filter?page=<%=i%>&&status=<%=status %>"><%=i %></a></li>
							<%} %>
							
							<%if(currentPage != totalPages){ %>
								<li><a aria-label="Next" href="filter?page=<%=currentPage+1 %>&&status=<%=status %>"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
							<%} %>
						</ul>
					</div>
				<%} else{%>
					<span>
						Tổng số: <%=totalRecords %> đơn hàng.
					</span>
					<div aria-label="Page navigation">
						<ul class="pagination">
							<%if(currentPage != 1){ %>
								<li><a aria-label="Previous" href="order-list?page=<%=currentPage-1 %>"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<%} %>
							
							<%for(int i = 1; i <= totalPages; i++){ %>
								<li class="<%=i==currentPage ? "active" : ""%>">
									<a href="order-list?page=<%=i%>"><%=i %></a>
								</li>
							<%} %>
							
							<%if(currentPage != totalPages){ %>
								<li><a aria-label="Next" href="order-list?page=<%=currentPage+1 %>"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
							<%} %>
						</ul>
					</div>
				<%} %>
			</div>
		</div>
	</div>
</body>
<script src="<%=Common.url%>/admin/static/js/lumino.glyphs.js"></script>
<script src="<%=Common.url%>/admin/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/bootstrap.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/index.js"></script>
</html>