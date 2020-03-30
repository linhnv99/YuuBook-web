<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit User</title>
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
				<li class="active">Người dùng</li>
				<li class="active">Sửa thông tin người dùng</li>
			</ol>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Sửa thông tin người dùng</h2>
			</div>
		</div>
		<!--/.row-->
		<div class="row">
			<div class="col-sm-10">
				<%if(request.getAttribute("errMess")!=null){ %>
					<div class="alert alert-danger"><%=request.getAttribute("errMess") %></div>
				<%} %>
				<%User user = (User) request.getAttribute("user"); %>

				<form method="POST" enctype="multipart/form-data" 
					action="<%=Common.url %>/admin/edit-user" style="background: #fff; padding: 20px;">
					<input type="text" class="form-control hidden"
						value="<%=user!=null ? user.getId(): ""%>" name="id">
					<div class="form-group">
						<label class="ml-10">Fullname</label> <input type="text"
							name="name" class="form-control" placeholder="name"
							value="<%=user!=null ? user.getName() : "" %>" required />
					</div>
					<div class="form-group">
						<label class="ml-10">Username</label> <input type="text"
							name="username" class="form-control" placeholder="Username"
							value="<%=user!=null ? user.getUsername() : "" %>" required />
					</div>
					<div class="form-group">
						<label class="ml-10">Password</label> <input type="text"
							name="password" class="form-control" placeholder="Password"
							value="<%=user!=null ? user.getPassword() : "" %>" required />
					</div>
					<div class="form-group">
						<%if(user!=null) {%>
							<div><img src="<%=Common.url%>/uploads/avatar/<%=user.getImage() %>" height="250" alt="old image"/></div>
							<input class="hidden" type="text" value="<%=user.getImage()%>" name="old-image" />
						<%} %>
						<label class="ml-10">Avatar</label> <input type="file"
							name="avatar" class="form-control" placeholder="Avatar" />
					</div>
					<div class="form-group">
						<label class="ml-10">Phone</label> <input type="text" name="phone"
							class="form-control" placeholder="Phone"
							value="<%=user!=null ? user.getPhone() : "" %>" />
					</div>
					<div class="form-group">
						<label class="ml-10">Email</label> <input type="text" name="email"
							class="form-control" placeholder="Email"
							value="<%=user!=null ? user.getEmail() : "" %>" required />
					</div>
					<div class="form-group">
						<label class="ml-10">Location</label> <input type="text" name="location"
							class="form-control" placeholder="Location"
							value="<%=user!=null ? user.getLocation() : "" %>" />
					</div>
					<div class="form-group">
						
					</div>
					<div class="form-group">
						<label class="ml-10">Level</label>
					 	<select name="level" class="form-control">
							<option value="1" >Admin</option>
							<option value="2" >User</option>
						</select>
					</div>
					<div class="form-group" style="margin-top: 10px;">
						<button class="btn btn-primary">Xác nhận</button>
						<a class="btn btn-danger" href="<%=Common.url%>/admin/user-list">Hủy bỏ</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--/.main-->

</body>
<script src="<%=Common.url%>/admin/static/js/lumino.glyphs.js"></script>
<script src="<%=Common.url%>/admin/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/bootstrap.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/index.js"></script>
</html>