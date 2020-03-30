<%@page import="com.yuu.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Category</title>
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
				<li class="active">Danh mục</li>
			</ol>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Danh mục sản phẩm</h2>
			</div>
		</div>
		<!--/.row-->
		<% 
			String errMess = (String) request.getAttribute("errMess"); 
			String notDelete = (String) request.getAttribute("notDelete");	
		%>
		<%if(notDelete!=null){ %>
			<div class="alert alert-danger"> <%=notDelete %></div>
		<%} %>
		<div class="row">
			<div class="col-xs-12 col-md-5 col-lg-5">
				<div class="panel panel-primary">
					<div class="panel-heading">Thêm danh mục</div>
					<div class="panel-body">
						<form action="<%=Common.url %>/admin/add-category" class="form-group">
							<label>Tên danh mục:</label> 
							<p class="text-danger"><%=errMess!=null ? errMess : "" %></p>
							<input type="text" name="name"
								class="form-control" placeholder="Tên danh mục...">
							<button class="btn btn-primary m-3" style="margin-top: 10px;">Thêm</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-md-7 col-lg-7">
				<div class="panel panel-primary">
					<div class="panel-heading">Danh sách danh mục</div>
					<div class="panel-body">
						<div class="bootstrap-table">
							<table class="table table-bordered">
								<thead>
									<tr class="bg-primary">
										<th>Tên danh mục</th>
										<th style="width: 30%">Tùy chọn</th>
									</tr>
								</thead>
								<%	
									List<Category> cateList = new ArrayList<Category>();
									cateList = (List<Category>) request.getAttribute("cateList");
								%>
								<tbody> 
									<%if(cateList!=null){ %>
										<%for(Category cate:cateList){ %>
											<tr>
												<td><%=cate.getName() %></td>
												<td><a href="<%=Common.url %>/admin/edit-category?id=<%=cate.getId() %>" class="btn btn-warning"><span
														class="glyphicon glyphicon-edit"></span> Sửa</a> 
													<a href="<%=Common.url %>/admin/delete-category?id=<%=cate.getId() %>"
													onclick="return confirm('Bạn có chắc chắn muốn xóa?')"
													class="btn btn-danger"><span
														class="glyphicon glyphicon-trash"></span> Xóa</a></td>
											</tr>
										<%} %>
									<%} %>
									
								</tbody>
							</table>
						</div>
						<div class="clearfix"></div>
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