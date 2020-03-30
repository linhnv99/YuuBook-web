<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register</title>
<!-- all css here -->
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/magnific-popup.css">
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/animate.css">
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/themify-icons.css">
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/icofont.css">
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/meanmenu.min.css">
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/bundle.css">
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/style.css">
<link rel="stylesheet" href="<%=Common.url%>/client/assets/css/responsive.css">
<script src="<%=Common.url%>/client/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<%@include file="header.jsp" %>
	<div class="breadcrumb-area pt-100 pb-100"
        style="background-image: url(<%=Common.url%>/client/assets/img/bg/bg.jpg); background-size: cover;">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <h2>Register</h2>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li> Register</li>
                </ul>
            </div>
        </div>
    </div>
	<!-- register-area start -->
        <div class="register-area ptb-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 col-12 col-lg-12 col-xl-6 ml-auto mr-auto">
                        <div class="login">
                            <div class="login-form-container">
                                <div class="login-form">
                                    <form action="register" method="post">
                                    	<%
                                    		if(request.getAttribute("errMess")!=null){
                                    	%>
                                    		<p class="text-danger text-center"><%=request.getAttribute("errMess") %> </p>
                                    	<%} %>
                                        <input type="text" name="name" placeholder="Name">
                                        <input type="text" name="username" placeholder="Username">
                                        <input type="password" name="password" placeholder="Password">
                                        <input name="email" placeholder="Email" type="email">
                                        <div class="button-box">
                                            <button type="submit" class="default-btn floatright">Register</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- register-area end -->
	<%@include file="footer.jsp" %>
</body>
<!-- all js here -->
<script src="<%=Common.url%>/client/assets/js/vendor/jquery-1.12.0.min.js"></script>
<script src="<%=Common.url%>/client/assets/js/popper.js"></script>
<script src="<%=Common.url%>/client/assets/js/bootstrap.min.js"></script>
<script src="<%=Common.url%>/client/assets/js/jquery.magnific-popup.min.js"></script>
<script src="<%=Common.url%>/client/assets/js/isotope.pkgd.min.js"></script>
<script src="<%=Common.url%>/client/assets/js/imagesloaded.pkgd.min.js"></script>
<script src="<%=Common.url%>/client/assets/js/jquery.counterup.min.js"></script>
<script src="<%=Common.url%>/client/assets/js/waypoints.min.js"></script>
<script src="<%=Common.url%>/client/assets/js/owl.carousel.min.js"></script>
<script src="<%=Common.url%>/client/assets/js/plugins.js"></script>
<script src="<%=Common.url%>/client/assets/js/main.js"></script>
</html>