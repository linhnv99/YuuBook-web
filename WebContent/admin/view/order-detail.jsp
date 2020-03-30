<%@page import="java.text.DecimalFormat"%>
<%@page import="com.yuu.model.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="com.yuu.model.Cart"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Order detail</title>

<!-- all css here -->
<link href="<%=Common.url%>/admin/static/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=Common.url%>/admin/static/css/styles.css" rel="stylesheet">
</head>
<style>
     table,
     th,
     td {
          border: 1px solid #ddd;
          border-collapse: collapse;
     }
     th,
     td {
          padding: 10px;
          text-align: left;
     }
</style>
<body>
	<%@include file="nav-sidebar.jsp" %>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
			<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Đơn hàng</li>
				<li class="active">Chi tiết đơn hàng</li>
			</ol>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Chi tiết đơn hàng </h2>
			</div>
		</div>
		<!--/.row-->
		<div class="row">
			<div class="col-sm-10" style="background: #fff; margin-left: 20px;">
				<h3 class="text-center mb-20">Thông tin khách hàng</h3>
					<%
						Cart order = (Cart) request.getAttribute("order");
						List<CartItem> cartItemList = (List<CartItem>) request.getAttribute("cartItemList");
						DecimalFormat df = new DecimalFormat("###,###,###");
					%>
			     	<table style="width:100%">
			     	<%if(order!=null){ %>
			          <tr>
			               <th>Mã hóa đơn:</th>
			               <td><%=order.getId() %></td>
			          </tr>
			          <tr>
			               <th>Tài khoản tạo: </th>
			               <td><%=order.getBuyer().getUsername() %></td>
			          </tr>
			          <tr>
			               <th>Tên người nhận:</th>
			               <td><%=order.getName() %></td>
			          </tr>
			          <tr>
			               <th>Số điện thoại:</th>
			               <td><%=order.getPhone() %></td>
			          </tr>
			          <tr>
			               <th>Email</th>
			               <td><%=order.getEmail() %></td>
			          </tr>
			          <tr>
			               <th>Địa chị nhận: </th>
			               <td><%=order.getAddress() %></td>
			          </tr>
			          <tr>
			               <th>Ngày tạo: </th>
			               <td><%=order.getBuyDate() %></td>
			          </tr>
			          <tr>
			               <th>Trạng thái: </th>
			               <td><%=order.getStatus() == 0 ? "Đang xử lý" : "Đã xong" %></td>
			          </tr>
			          <%} %>
			     </table>
			     <h3 class="text-center mb-20">Đơn hàng</h3>
			     
			     <table style="width:100%; margin-bottom: 20px;">
			          <tr>
			               <th>Sản phẩm</th>
			               <th>Đơn giá</th>
			               <th>Thành tiền</th>
			          </tr>
			          <%if(cartItemList!=null)
			        		for(CartItem cItem : cartItemList){
			        	%>
				          <tr>
				               <td><%=cItem.getProduct().getName() %> <strong>x <%=cItem.getQuantity() %></strong></td>
				               <td><%=df.format(cItem.getUnitPrice()) %></td>
				               <td><%=df.format(cItem.getQuantity() * cItem.getUnitPrice()) %> VND</td>
				          </tr>
						<%} %>
			          <tr>
			               <th>Tổng thành tiền</th>
			               <%	double totalOrder = 0;
		                    	if(cartItemList!=null){
		                    		for(CartItem cItem : cartItemList){
		                    			totalOrder += cItem.getQuantity() * cItem.getUnitPrice();
		                    		}
		                    	}
		                    %>
		                    <td colspan="2"><strong><%=df.format(totalOrder) %> VND</strong></td>
			          </tr>
			     </table>
			<a class="btn btn-primary d-block mt-4" href="<%=Common.url%>/admin/order-list">Quay lại</a>
			</div>
		</div>
	</div>
</body>
<!-- all js here -->
<script src="<%=Common.url%>/admin/static/js/lumino.glyphs.js"></script>
<script src="<%=Common.url%>/admin/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/bootstrap.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/index.js"></script>
</html>