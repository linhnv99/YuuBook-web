<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.yuu.model.Product"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product Detail</title>
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
                    <h2>Product Detail</h2>
                    <ul>
                        <li><a href="#">home</a></li>
                        <li> product detail</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- product detail -->
        <%
        	Product product = (Product) request.getAttribute("product");
        	DecimalFormat df = new DecimalFormat("###,###,###");
        %>
        <div class="product-details pt-100 pb-80">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-7 col-12">
                        <div class="product-details-4 pr-70">
                            <div class="easyzoom easyzoom--overlay">
                                <a href="">
                                    <img style="max-height: 700px" src="<%=Common.url %>/uploads/product/<%=product!=null ? product.getImage() : "" %>" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5 col-12">
                        <div class="product-details-content">
                            <h3><%=product!=null ? product.getName() : "" %></h3>
                            <div class="rating-number">
                                <div class="quick-view-rating">
                                    <i class="pe-7s-star"></i>
                                    <i class="pe-7s-star"></i>
                                    <i class="pe-7s-star"></i>
                                    <i class="pe-7s-star"></i>
                                    <i class="pe-7s-star"></i>
                                </div>
                                <div class="quick-view-number">
                                    <span>2 Ratting (S)</span>
                                </div>
                            </div>
                            <p>Số lượng còn: <%=product!=null ? product.getQuantity() : "" %></p>
                            <div class="details-price">
                            	<%if(product!=null && product.getDiscount()!=0){%>
                                <span class="text-danger" ><%=df.format(product.getPrice() - product.getPrice()*product.getDiscount()/100) %></span>
                                <small style="text-decoration:line-through;"><%=df.format(product.getPrice()) %></small>
                            	<%}else { %>
                            		<span class="text-danger" ><%=df.format(product.getPrice()) %></span>
                            	<%} %>
                            </div>
                            	<%
                            		StringBuilder newStr = new StringBuilder();
                            		String []s = product!=null ? product.getDes().split(" ") : null;
                            		for(int i = 0; i < s.length; i++){
                            			newStr.append(s[i]);
                            			newStr.append(" ");
                            			if(i == 50) break;
                            		} 
                            		String proName = s.length < 50 ? newStr.toString() : newStr.append("...").toString();
                            	%>
                            <p><%=proName %></p>
                            
                            <div class="quickview-plus-minus">
                                <div class="quickview-btn-cart">
                                    <a class="btn-hover-black" href="<%=Common.url%>/add-to-cart?id=<%=product!=null ? product.getId() : ""%>">add to cart</a>
                                </div>
                                <div class="quickview-btn-wishlist">
                                    <a class="btn-hover" href="#"><i class="pe-7s-like"></i></a>
                                </div>
                            </div>
                            
                            <div class="bundle-area pt-50">
                                <div class="product-details5-social">
                                    <ul>
                                        <li>
                                            <a href="#" class="">
                                                <i class="icofont icofont-social-facebook"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="icofont icofont-social-twitter"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="icofont icofont-social-pinterest"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="icofont icofont-social-flikr"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-description-review-area pb-90">
            <div class="container">
                <div class="product-description-review text-center">
                    <div class="description-review-title nav" role=tablist>
                        <a class="active" href="#pro-dec" data-toggle="tab" role="tab" aria-selected="true">
                            Description
                        </a>
                        <a href="#pro-review" data-toggle="tab" role="tab" aria-selected="false">
                            Reviews (0)
                        </a>
                    </div>
                    <div class="description-review-text tab-content">
                        <div class="tab-pane active show fade" id="pro-dec" role="tabpanel">
                        	<h4 class="mb-4" style="text-decoration: underline"><%=product!=null ? product.getName() : "" %></h4>
                            <p><%=product!=null ? product.getDes() : "" %>......</p>
                            <h5>Mời bạn đón đọc.</h5>
                        </div>
                        <div class="tab-pane fade" id="pro-review" role="tabpanel">
                            <a href="#">Be the first to write your review!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- product area start -->
        <div class="product-area pb-95">
            <div class="container">
                <div class="section-title-3 text-center mb-50">
                    <h2>Related products</h2>
                </div>
                <div class="product-style">
                    <div class="related-product-active owl-carousel">
                    	<%
                    		ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
                    	%>
                    	<%if(productList!=null){
                    		for(Product prod : productList){
                    	%>
	                        <div class="product-wrapper">
	                            <div class="product-img">
	                                <a href="<%=Common.url%>/product/detail?id=<%=prod.getId() %>">
	                                    <img src="<%=Common.url %>/uploads/product/<%=prod.getImage() %>" alt="" height="400">
	                                </a>
	                                <div class="product-action">
	                                    <a class="animate-left" title="Wishlist" href="#">
	                                        <i class="pe-7s-like"></i>
	                                    </a>
	                                    <a class="animate-top" title="Add To Cart" href="#">
	                                        <i class="pe-7s-cart"></i>
	                                    </a>
	                                    <a class="animate-right" title="View"
	                                     href="<%=Common.url%>/product/detail?id=<%=prod.getId() %>">
	                                        <i class="pe-7s-look"></i>
	                                    </a>
	                                </div>
	                            </div>
	                            <div class="product-content">
	                                <h4><a href="#"><%=prod.getName() %></a></h4>
	                               	<%if(prod.getDiscount()!=0){%>
		                                <h5 class="text-danger"  style="font-size: 18px"><%=df.format(product.getPrice() - product.getPrice()*product.getDiscount()/100) %>
											<small style="text-decoration:line-through; color: #686868"><%=df.format(prod.getPrice()) %></small>
										</h5>
									<%}else { %>
										<h5 class="text-danger"  style="font-size: 18px"><%=df.format(prod.getPrice()) %></h5>
									<%} %>
	                            </div>
	                        </div>
                        <%}} %>
                    </div>
                </div>
            </div>
        </div>
        <!-- product area end -->
		
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