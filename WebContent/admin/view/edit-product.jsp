<%@page import="java.text.DecimalFormat"%>
<%@page import="com.yuu.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yuu.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Product</title>
</head>
<link href="<%=Common.url%>/admin/static/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=Common.url%>/admin/static/css/styles.css" rel="stylesheet">
<body>
	<%@include file="nav-sidebar.jsp"%>
	<!-- navbar-sidebar -->
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Sản phẩm</li>
				<li class="active">Sửa sản phẩm</li>
			</ol>
		</div>

		<div class="row">
			<div class="col-xs-12 col-md-12 col-lg-12">
				<div class="panel panel-primary " style="margin-top: 15px;">
					<div class="panel-heading">Sửa sản phẩm</div>
					<div class="panel-body">
					<!--form  -->
					<%
						Product product =  (Product) request.getAttribute("product");
					%>
						<form method="post" action="<%=Common.url%>/admin/edit-product"
							enctype="multipart/form-data">
							<div class="row" style="margin-bottom: 40px">
								<div class="col-xs-8">
									<input type="text" name="id" value="<%=product!=null ? product.getId() : "" %>" class="hidden"/>
									<div class="form-group">
										<label>Tên sản phẩm</label> <input required type="text"
											name="name" class="form-control"
											value="<%=product!=null ? product.getName() : ""%>">
									</div>
									<div class="form-group">
										<label>Giá sản phẩm</label> <input required type="number"
											name="price" class="form-control"
											value="<%=product!=null ? product.getPrice() : ""%>">
									</div>
									<div class="form-group">
										<label>Giảm giá</label> <input type="number"
											min="0" max="100" name="discount" class="form-control"
											value="<%=product!=null ? product.getDiscount() : ""%>">
									</div>
									<div class="form-group">
										<%if(product!=null){ %>
										<div><img src="<%=Common.url %>/uploads/product/<%=product.getImage() %>" alt="product image" style="height: 300px;"/></div>
										<%} %>
										<label class="ml-10">Ảnh sản phẩm</label> <input type="file"
											name="image" value="" class="form-control"
											placeholder="Ảnh sản phẩm"/>
									</div>
									
									<div class="form-group">
										<label>Số lượng sản phẩm</label> <input required type="number"
											name="quantity" class="form-control"
											value="<%=product!=null ? product.getQuantity() : ""%>">
									</div>
									<% 
										List<Category> cateList = new ArrayList<Category>();
										cateList = (List<Category>) request.getAttribute("cateList");
									%>
									<div class="form-group">
										<label>Danh mục</label> 
										<select required name="cate"
											class="form-control">
											<%if(cateList!=null){ %>
												<%for(Category cate : cateList){ %>										
													<option value="<%=cate.getId()%>"
														<%=product.getCategory().getId() == cate.getId() ? "selected" : ""%>
													> <%=cate.getName() %></option>
												<%} %>
											<%} %>
										</select>
									</div>
									<div class="form-group">
										<label>Mô tả</label>
										<div>
											<textarea required name="des"rows="3" id="editor"><%=product!=null ? product.getDes() :  ""%></textarea>
										</div>
									</div>
									
									<input type="submit" name="submit" value="Xác nhận"
										class="btn btn-primary"> <a href="<%=Common.url %>/admin/product-list"
										class="btn btn-danger">Hủy bỏ</a>
								</div>
							</div>
						</form>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		<!--/.row-->
	</div>
</body>
<script src="<%=Common.url%>/ckeditor/ckeditor.js"></script>
<script src="<%=Common.url%>/admin/static/js/lumino.glyphs.js"></script>
<script src="<%=Common.url%>/admin/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/bootstrap.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/index.js"></script>
<script type="text/javascript">
	CKEDITOR.replace('editor');
</script>
</html>