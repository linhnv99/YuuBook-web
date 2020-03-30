<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>User</title>
</head>
<link href="<%=Common.url%>/admin/static/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=Common.url%>/admin/static/css/styles.css" rel="stylesheet">
<style>
	
</style>
<body>
	<%
		List<User> userList = new ArrayList<User>();
		userList = (ArrayList<User>) request.getAttribute("userList");
		User acc = (User)session.getAttribute("account");
		
		String key = (String)request.getAttribute("key");
	%>

	<%@include file="nav-sidebar.jsp"%>
	<!-- navbar-sidebar -->
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">Người dùng</li>
			</ol>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Danh sách người dùng</h2>
			</div>
		</div>
		<!--/.row-->
		<div class="row">
			<div class="col-sm-12">
				<!-- <div class="alert alert-success">Added user success!</div>
				<div class="alert alert-danger">Add user false!</div> -->
				<div
					style="display: flex; justify-content: space-between; margin-top: 15px;">
					<a href="<%=Common.url%>/admin/add-user" class="btn btn-primary">Thêm</a>
					<form action="<%=Common.url%>/admin/search-user" method="GET">
						<input class="search" type="text" placeholder="Tìm kiếm theo tên" name="key" 
						value="<%=key!=null ? key : ""%>">
						<button class="btn btn-primary">Tìm kiếm</button>
					</form>
				</div>
				<table class="table table-striped mt-10">
					<tr id="tbl-first-row">
						<th width="5%">ID</th>
						<th width="15%">Name</th>
						<th width="12%">Username</th>
						<th width="12%">Password</th>
						<th width="15%">Email</th>
						<th width="10%">Image</th>
						<th width="8%">Level</th>
						<th width="20%">Location</th>
						<th width="8%">Edit</th>
						<th width="8%">Delete</th>
					</tr>
					<%if(userList!=null){ %>
						<%for(User u: userList){ %>
							 <tr>
                              <td><%=u.getId() %></td>
                              <td><%=u.getName() %></td>
                              <td><%=u.getUsername() %></td>
                              <td><%=u.getPassword() %></td>
                              <td><%=u.getEmail() %></td>
                              <td>
                              	<%if(!"".equals(u.getImage())){%>
                              		<img src="<%=Common.url%>/uploads/avatar/<%=u.getImage() %>"  width="70" height="70" alt="image"/>
                              	<%}else{ %>
                              		<p>Không có ảnh</p> <%} %>
                              </td>
                              <td><%=u.getLevel()==1 ? "Admin" : "User" %></td>
                              <td><%=u.getLocation() %></td>
                              <td><a class="btn btn-primary" href="<%=Common.url%>/admin/edit-user?id=<%=u.getId()%>">Sửa</a></td>
								<td><a class="btn btn-danger"
									href="<%=Common.url%>/admin/delete-user?id=<%=u.getId()%>"
									onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a></td>
							</tr>
						<%
							}
						%>
					<%
						}
					%>
				</table>
				
				<%
					int totalPages = (int) request.getAttribute("totalPages");
					int currentPage = (int) request.getAttribute("currentPage");
					int totalRecords = (int) request.getAttribute("totalRecords");
				%>
				
				<%if(key!=null){ %><!-- Pagnigation for result search  -->
					<span>
					Tổng số: <%=totalRecords %> người dùng.
					</span>
					<div aria-label="Page navigation">
						<ul class="pagination">
							<%if(currentPage != 1){ %>
								<li><a aria-label="Previous" href="search-user?page=<%=currentPage-1 %>&&key=<%=key %> "> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<%} %>
							
							<%for(int i = 1; i <= totalPages; i++){ %>
								<li class="<%=i==currentPage ? "active" : ""%>"><a href="search-user?page=<%=i%>&&key=<%=key %>"><%=i %></a></li>
							<%} %>
							
							<%if(currentPage != totalPages){ %>
								<li><a aria-label="Next" href="search-user?page=<%=currentPage+1 %>&&key=<%=key %>"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
							<%} %>
						</ul>
					</div>
				<%} else {%><!-- Pagnigation for user list -->
					<span>
						Tổng số: <%=totalRecords %> người dùng.
					</span>
					<div aria-label="Page navigation">
						<ul class="pagination">
							<%if(currentPage != 1){ %>
								<li><a aria-label="Previous" href="user-list?page=<%=currentPage-1 %> "> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<%} %>
							
							<%for(int i = 1; i <= totalPages; i++){ %>
								<li class="<%=i==currentPage ? "active" : ""%>"><a href="user-list?page=<%=i%>"><%=i %></a></li>
							<%} %>
							
							<%if(currentPage != totalPages){ %>
								<li><a aria-label="Next" href="user-list?page=<%=currentPage+1 %>"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
							<%} %>
						</ul>
					</div>
				<%} %>
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