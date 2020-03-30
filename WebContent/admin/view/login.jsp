<%@page import="com.yuu.daoimpl.UserDaoImpl"%>
<%@page import="com.yuu.dao.UserDao"%>
<%@page import="com.yuu.model.User"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
</head>
<link href="<%=Common.url%>/admin/static/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=Common.url%>/admin/static/css/styles.css"
	rel="stylesheet">
<body>
	<%	
		String username = "", password = "", rememberMe = "";
		Cookie[] cookies = request.getCookies();
		UserDao userDao = new UserDaoImpl();
		User user = null;
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if("username".equals(cookie.getName())){
					username = cookie.getValue();
					user = userDao.get(username);
					password = user.getPassword();
				}
				if("rememberMe".equals(cookie.getName())){
					rememberMe = cookie.getValue();
				}
			}
		}
		
		//Logout
		if(request.getAttribute("mess")!=null){
			username = ""; password = ""; rememberMe = "";
		}
	%>
	<div class="row">
		<div
			class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default" style="margin: 20% auto">
				<div class="panel-heading" style="text-align: center;">Admin</div>
				<%
					if (request.getAttribute("errMess") != null) {
				%>
				<p class="text-danger text-center"><%=request.getAttribute("errMess")%> </p>
				<%
					}
				%>
				<%if(request.getAttribute("mess")!=null){ %>
					<p class="text-success text-center"><%=request.getAttribute("mess")%> </p>
				<%} %>
				<div class="panel-body">
					<form role="form" action="login" method="post">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="Username"
									name="username" type="text" autofocus=""
									value="<%="".equals(username) ? "" : username%>">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password"
									name="password" type="password" 
									value="<%="".equals(password) ? "" :  password %>">
							</div>
							<div class="checkbox">
								<label> <input name="remember" type="checkbox"
									value="on" <%="".equals(rememberMe) ? "" : "checked" %>>Remember Me
								</label>
							</div>
							<button class="btn btn-primary">Login</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<!-- /.col-->
	</div>
	<!-- /.row -->
</body>
<script src="<%=Common.url%>/admin/static/js/lumino.glyphs.js"></script>
<script src="<%=Common.url%>/admin/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/bootstrap.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/index.js"></script>
</html>