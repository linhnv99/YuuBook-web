<%@page import="com.yuu.model.Category"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit category</title>
</head>
<link href="<%=Common.url%>/admin/static/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=Common.url%>/admin/static/css/styles.css" rel="stylesheet">
<body>

<%@include file="nav-sidebar.jsp" %>
	<!-- navbar-sidebar -->
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Danh mục</li>
				<li class="active">Sửa danh mục</li>
			</ol>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Sửa danh mục sản phẩm</h1>
			</div>
		</div><!--/.row-->
		<%
			Category cate = (Category) request.getAttribute("cate");
			String errMess = (String) request.getAttribute("errMess");
		%>		
		<div class="row">
			<div class="col-xs-12 col-md-5 col-lg-5">
					<div class="panel panel-primary">
						<div class="panel-heading">
							Sửa danh mục
						</div>
						<div class="panel-body">
							<div class="form-group">
								<label>Tên danh mục:</label>
								<p class="text-danger"><%=errMess!=null ? errMess : "" %></p>
							<form action="<%=Common.url %>/admin/edit-category" method="post">
								<input type="text" value="<%=cate!=null ? cate.getId() : "" %>" name="id" class="hidden"/>
								<input type="text" name="name" class="form-control" value="<%=cate!=null ? cate.getName() : "" %>"
									placeholder="Tên danh mục...">
								<div class="form-group" style="margin-top: 10px;">
									<button class="btn btn-primary" >Xác
									nhận</button>
									<a class="btn btn-danger" href="<%=Common.url%>/admin/category">Hủy bỏ</a>
								</div>
							</form>
						</div>
						</div>
					</div>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
</body>
<script src="<%=Common.url%>/admin/static/js/lumino.glyphs.js"></script>
<script src="<%=Common.url%>/admin/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/bootstrap.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/index.js"></script>
</html>