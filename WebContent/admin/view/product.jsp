<%@page import="com.yuu.model.Category"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.yuu.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product</title>
</head>
<link href="<%=Common.url%>/admin/static/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=Common.url%>/admin/static/css/styles.css" rel="stylesheet">
<style>
	th,td {
		text-align: center
	}
</style>
<body>
	<%@include file="nav-sidebar.jsp"%>
	<!-- navbar-sidebar -->
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Sản phẩm</li>
			</ol>
		</div>

		<div class="row">
			<div class="col-xs-12 col-md-12 col-lg-12">
				<div class="panel panel-primary" style="margin-top: 15px;">
					<div class="panel-heading">Danh sách sản phẩm</div>
					<div class="panel-body">
						<div class="bootstrap-table">
							<div class="table-responsive">
								<div style="display: flex; justify-content: space-between;">
									<a href="<%=Common.url %>/admin/add-product"
										class="btn btn-primary">Thêm sản phẩm</a>
									<form action="<%=Common.url%>/admin/search-product" method="GET">
										<% 
											List<Category> cateList = new ArrayList<Category>();
											cateList = (List<Category>) request.getAttribute("cateList");
											Category cate = (Category) request.getAttribute("cate");
											String key = (String)request.getAttribute("key");
										%>
										<select name="cate" class="search">
											<option value="0">-- Danh mục sản phẩm --</option>
											<%if(cateList!=null){ %>
												<%for(Category c : cateList){ %>
												<option value="<%=c.getId()%>"
												<%=cate!=null && cate.getId() == c.getId() ? "selected" : "" %>
												>
													<%=c.getName() %>
												</option>
												<%} %>
											<%} %>
										</select> 
										<input class="search" type="text" placeholder="Tìm kiếm sản phẩm" name="key"
											value="<%=key!=null ? key : "" %>">
										<button class="btn btn-primary">Tìm kiếm</button>
									</form>
								</div>
								<table class="table table-bordered" style="margin-top: 20px;">
									<thead>
										<tr class="bg-primary">
											<th width="5%">ID</th>
											<th width="10%">Tên Sản phẩm</th>
											<th width="10%">Ảnh sản phẩm</th>
											<th width="10%">Giá sản phẩm</th>
											<th width="6%"> Số lượng</th>
											<th width="10%">Danh mục</th>
											<th width="15%">Mô tả</th>
											<th width="9%">Tùy chọn</th>
										</tr>
									</thead>
									<%
										List<Product> productList = new ArrayList<Product>();
										productList = (List<Product>) request.getAttribute("productList");
										DecimalFormat df = new DecimalFormat("###,###,###");
									%>
									<tbody>
									<%if(productList!=null){ %>
										<%for(Product product : productList){ %>
										<tr>
											<td><%=product.getId() %></td>
											<td><%=product.getName() %></td>
											<td><img src="<%=Common.url%>/uploads/product/<%=product.getImage() %>" width="70" height="70"  alt="product image"/></td>
											<td><%=df.format(product.getPrice()) %> VND</td>
											<td><%=product.getQuantity() %> </td>
											<td><%=product.getCategory().getName() %> </td>
											<%
												StringBuilder newStr = new StringBuilder();
												String[] s = product.getDes().split(" ");	
												for(int i = 0; i < s.length; i++){
													newStr.append(s[i]);
													newStr.append(" ");
													if(i==15) break; 	
												}
												String proName = s.length < 15 ? newStr.toString() : newStr.append(".....").toString();
											%>
											 <td> <%=proName %></td>
											<td><a href="<%=Common.url %>/admin/edit-product?id=<%=product.getId() %>" class="btn btn-warning">
												 Sửa</a> 
												<a
												href="<%=Common.url %>/admin/delete-product?id=<%=product.getId() %>" class="btn btn-danger"
												onclick="return confirm('Bạn có chắc chắn muốn xóa?')">
												Xóa </a>
											<a href="<%=Common.url %>/admin/product-detail?id=<%=product.getId() %>"> Xem chi tiết</a>
											<p><a href="<%=Common.url %>/product/detail?id=<%=product.getId() %>">View Client</a></p>
											</td>
										</tr>
										<%} %>
									<%} %>
									</tbody>
								</table>
							</div>
						</div>
						<div class="clearfix"></div>
						<%
							int totalPages = (int) request.getAttribute("totalPages");
							int currentPage = (int) request.getAttribute("currentPage");
							int totalRecords = (int) request.getAttribute("totalRecords");
						%>
						
						<%if(key!=null || cate!=null){ %>
							<span>
							Tổng số: <%=totalRecords %> sản phẩm.
							</span>
							<div aria-label="Page navigation">
								<ul class="pagination">
									<%if(currentPage != 1){ %>
										<li><a aria-label="Previous" href="search-product?page=<%=currentPage-1 %>
										<%=key!=null ? "&&key="+key : ""%>
										<%=cate!=null ? "&&cate="+cate.getId() : "&&cate=0"%>"> 
											<span aria-hidden="true">&laquo;</span>
										</a></li>
									<%} %>
									
									<%for(int i = 1; i <= totalPages; i++){ %>
										<li class="<%=i==currentPage ? "active" : ""%>"><a 
											href="search-product?page=<%=i%>
											<%=key!=null ? "&&key="+key : ""%>
											<%=cate!=null ? "&&cate="+cate.getId() : "&&cate=0"%>"
										><%=i %></a></li>
									<%} %>
									
									<%if(currentPage != totalPages){ %>
										<li><a aria-label="Next" href="search-product?page=<%=currentPage+1 %>
											<%=key!=null ? "&&key="+key : ""%>
											<%=cate!=null ? "&&cate="+cate.getId() : "&&cate=0"%>"> 
											<span aria-hidden="true">&raquo;</span>
										</a></li>
									<%} %>
								</ul>
							</div>
						<%} else {%>
							<span>
							Tổng số: <%=totalRecords %> sản phẩm.
							</span>
							<div aria-label="Page navigation">
								<ul class="pagination">
									<%if(currentPage != 1){ %>
										<li><a aria-label="Previous" href="product-list?page=<%=currentPage-1 %>"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<%} %>
									
									<%for(int i = 1; i <= totalPages; i++){ %>
										<li class="<%=i==currentPage ? "active" : ""%>">
											<a href="product-list?page=<%=i%>"><%=i %></a>
										</li>
									<%} %>
									
									<%if(currentPage != totalPages){ %>
										<li><a aria-label="Next" href="product-list?page=<%=currentPage+1 %>"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
									<%} %>
								</ul>
							</div>
						<%} %>
					</div>
				</div>
			</div>

		</div>
		<!--/.row-->
	</div>
</body>
<script src="<%=Common.url%>/admin/static/js/lumino.glyphs.js"></script>
<script src="<%=Common.url%>/admin/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/bootstrap.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/index.js"></script>
</html>