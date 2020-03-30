<%@page import="java.text.DecimalFormat"%>
<%@page import="com.yuu.model.Product"%>
<%@page import="com.yuu.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
</head>
<!-- all css here -->
<link rel="stylesheet" href="client/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="client/assets/css/magnific-popup.css">
<link rel="stylesheet" href="client/assets/css/animate.css">
<link rel="stylesheet" href="client/assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="client/assets/css/themify-icons.css">
<link rel="stylesheet" href="client/assets/css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="client/assets/css/icofont.css">
<link rel="stylesheet" href="client/assets/css/meanmenu.min.css">
<link rel="stylesheet" href="client/assets/css/bundle.css">
<link rel="stylesheet" href="client/assets/css/style.css">
<link rel="stylesheet" href="client/assets/css/responsive.css">
<script src="client/assets/js/vendor/modernizr-2.8.3.min.js"></script>
<body>
	<%@include file="header.jsp" %>
	<div class="pl-200 pr-200 overflow clearfix">
        <div class="categori-menu-slider-wrapper clearfix">
            <div class="categories-menu">
                <div class="category-heading">
                    <h3> All Category <i class="pe-7s-angle-down"></i></h3>
                </div>
                <div class="category-menu-list">
                    <ul>
                    	<%
                    		ArrayList<Category> cateList = (ArrayList<Category>) request.getAttribute("cateList");
                    	%>
                    	<%if(cateList!=null){ %>
                    		<%for(Category cate : cateList){ %>
		                        <li>
		                            <a href="<%=Common.url%>/product/search-cate?id=<%=cate.getId()%>"><img alt="" src="assets/img/icon-img/5.png">
		                            <i class="pe-7s-angle-right"></i>
		                            <%=cate.getName() %></a>
		                        </li>
                    		<%} %>
                    	<%} %>
                        
                    </ul>
                </div>
            </div>
            <div class="menu-slider-wrapper">
                <div class="menu-style-3 menu-hover text-center">
                    <nav>
                        <ul>
                            <li><a href="index.html">home</a>
                            </li>
                            <li><a href="#">pages<i class="pe-7s-angle-down"></i>  </a>
                                <ul class="single-dropdown">
                                    <li><a href="#">about us</a></li>
                                    <li><a href="<%=Common.url%>/login">login</a></li>
                                    <li><a href="<%=Common.url%>/register">register</a></li>
                                </ul>
                            </li>
                            <li><a href="<%=Common.url%>/product/list">shop <i class="pe-7s-angle-down"></i> <span class="sticker-new">hot</span></a>
                                <div class="category-menu-dropdown shop-menu">
                                    <div class="category-dropdown-style category-common2 mb-30">
                                        <h4 class="categories-subtitle"> shop layout</h4>
                                        <ul>
                                            <li><a href="<%=Common.url%>/cart">Cart</a></li>
                                        </ul>
                                    </div>
                                    <div class="category-dropdown-style category-common2 mb-30">
                                        <h4 class="categories-subtitle"> Category</h4>
                                        <ul>
                                        	<%if(cateList!=null){ %>
                    							<%for(Category cate : cateList){ %>
	                                            <li><a href="<%=Common.url%>/product/search-cate?id=<%=cate.getId()%>"><%=cate.getName() %></a></li>
                                            	<%} %>
                                            <%} %>
                                        </ul>
                                    </div>
                                    <div class="mega-banner-img">
                                        <a href="single-product.html">
                                            <img src="assets/img/banner/18.jpg" alt="">
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li><a href="blog.html">blog <i class="pe-7s-angle-down"></i></a>
                                <ul class="single-dropdown">
                                    <li><a href="blog-details-sidebar.html">blog details 2</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="slider-area bg-overlay-dark">
                    <div class="slider-active owl-carousel">
                        <div class="single-slider single-slider-hm3 bg-img pt-170 pb-173" style="background-image: url(client/assets/img/slider/banner1.jpg)">
                            <div class="slider-animation slider-content-style-3 fadeinup-animated">
                                <h2 class="animated">Invention of <br>design platform</h2>
                                <h4 class="animated">Best Product With warranty </h4>
                                <a class="electro-slider-btn btn-hover" href="product-details.html">buy now</a>
                            </div>
                        </div>
                        <div class="single-slider single-slider-hm3 bg-img pt-170 pb-173" style="background-image: url(client/assets/img/slider/banner2.jpg)">
                            <div class="slider-animation slider-content-style-3 fadeinup-animated">
                                <h2 class="animated">Invention of <br>design platform</h2>
                                <h4 class="animated">Best Product With warranty </h4>
                                <a class="electro-slider-btn btn-hover" href="product-details.html">buy now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <div class="electro-product-wrapper wrapper-padding pb-45">
        <div class="container-fluid">
            <div class="section-title-4 text-center mb-40">
                <h2>Top Products</h2>
            </div>
            <div class="top-product-style">
               <!-- /////////////////// -->
                <div class="tab-content">
                    <div class="tab-pane active show fade" id="electro1" role="tabpanel">
                        <div class="custom-row-2">
                            <%
                            	ArrayList<Product> productList = (ArrayList<Product>)request.getAttribute("productList");
                            	DecimalFormat df  = new DecimalFormat("###,###,###");
                            %>
                            <%if(productList!=null){
	                            for(Product product : productList){ 
	                            	if(product.getDiscount()==0){
	                          %>
	                            <div class="custom-col-style-2 custom-col-4">
	                                <div class="product-wrapper product-border mb-24 home-hover">
	                                    <div class="product-img-3">
	                                        <a href="<%=Common.url %>/product/detail?id=<%=product.getId()%>">
	                                            <img src="uploads/product/<%=product.getImage() %>" style="max-height: 200px" alt="">
	                                        </a>
	                                        <div class="product-action-right">
	                                            <a class="animate-right" href="<%=Common.url %>/product/detail?id=<%=product.getId()%>" title="View">
	                                                <i class="pe-7s-look"></i>
	                                            </a>
	                                            <a class="animate-top" title="Add To Cart" href="<%=Common.url%>/add-to-cart?id=<%=product.getId() %>">
	                                                <i class="pe-7s-cart"></i>
	                                            </a>
	                                            <a class="animate-left" title="Wishlist" href="#">
	                                                <i class="pe-7s-like"></i>
	                                            </a>
	                                        </div>
	                                    </div>
	                                    <div class="product-content-4 text-center" style="min-height: 200px;">
	                                        <div class="product-rating-4">
	                                            <i class="icofont icofont-star yellow"></i>
	                                            <i class="icofont icofont-star yellow"></i>
	                                            <i class="icofont icofont-star yellow"></i>
	                                            <i class="icofont icofont-star yellow"></i>
	                                            <i class="icofont icofont-star"></i>
	                                        </div>
	                                        <h4><a class="home-hover-a" href="<%=Common.url %>/product/detail?id=<%=product.getId()%>"><%=product.getName() %></a></h4>
	                                        <h5 class="mt-3 text-danger"><%=df.format(product.getPrice()) %> VND</h5>
	                                    </div>
	                                </div>
	                            </div>
	                            <%}}} %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-area wrapper-padding pt-30 pb-95">
        <div class="container-fluid">
            <div class="electro-fexible-banner bg-img" style="background-image: url(client/assets/img/banner/banner2.png)">
                <div class="fexible-content">
                   
                </div>
            </div>
        </div>
    </div>
    <div class="best-selling-area pb-95">
        <div class="section-title-4 text-center mb-60">
            <h2>Best Selling</h2>
        </div>
		<div class="product-area-2 wrapper-padding pb-70">
			<div class="container-fluid">
				<div class="row">
					<%if(productList!=null){
						for(Product product:productList){	
							if(product.getDiscount()!=0){
					%>
					<div class="col-lg-6 col-xl-4" >
						<div class="product-wrapper product-wrapper-border mb-30 home-hover" style="min-height: 320px">
							<div class="product-img-5">
								<a href="<%=Common.url %>/product/detail?id=<%=product.getId()%>"> <img src="uploads/product/<%=product.getImage() %>"
									alt="" style="min-height: 200px">
								</a>
							</div>
							<div class="product-content-7 ">
								<h4>
									<a href="<%=Common.url %>/product/detail?id=<%=product.getId()%>" class="home-hover-a"><%=product.getName() %></a>
								</h4>
								<div class="product-rating-4 mb-2" >
									<i class="icofont icofont-star yellow"></i> <i
										class="icofont icofont-star yellow"></i> <i
										class="icofont icofont-star yellow"></i> <i
										class="icofont icofont-star yellow"></i> <i
										class="icofont icofont-star"></i>
								</div>
								<span class="sale">-<%=product.getDiscount() %>%</span>
								<h5 class="text-danger"  style="font-size: 18px"><%=df.format(product.getPrice() - product.getPrice()*product.getDiscount()/100) %>
								<small style="text-decoration:line-through; color: #686868"><%=df.format(product.getPrice()) %></small>
								</h5>
								<div class="product-action-electro mt-3">
									<a class="animate-top" title="Add To Cart" href="#"> <i
										class="pe-7s-cart"></i>
									</a> <a class="animate-left" title="Wishlist" href="#"> <i
										class="pe-7s-like"></i>
									</a> <a class="animate-right" title="Compare" data-toggle="modal"
										data-target="#exampleCompare" href="#"> <i
										class="pe-7s-repeat"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
					<%}}} %>					
				</div>
			</div>
		</div>
	</div>

    <div class="newsletter-area pb-60">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-6">
                    <div class="section-title-5">
                        <h2>Newsletter</h2>
                        <p>Sign Up for get all update news & Get <span>15% off</span></p>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6">
                    <div class="newsletter-style-3">
                        <div id="mc_embed_signup" class="subscribe-form-3 pr-50">
                            <form action="http://devitems.us11.list-manage.com/subscribe/post?u=6bbb9b6f5827bd842d9640c82&amp;id=05d85f18ef" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
                                <div id="mc_embed_signup_scroll" class="mc-form">
                                    <input type="email" value="" name="EMAIL" class="email" placeholder="Enter Your E-mail" required>
                                    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                                    <div class="mc-news" aria-hidden="true">
                                        <input type="text" name="b_6bbb9b6f5827bd842d9640c82_05d85f18ef" tabindex="-1" value="">
                                    </div>
                                    <div class="clear">
                                        <input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<%@include file="footer.jsp" %>
	
</body>
<!-- all js here -->
<script src="client/assets/js/vendor/jquery-1.12.0.min.js"></script>
<script src="client/assets/js/popper.js"></script>
<script src="client/assets/js/bootstrap.min.js"></script>
<script src="client/assets/js/jquery.magnific-popup.min.js"></script>
<script src="client/assets/js/isotope.pkgd.min.js"></script>
<script src="client/assets/js/imagesloaded.pkgd.min.js"></script>
<script src="client/assets/js/jquery.counterup.min.js"></script>
<script src="client/assets/js/waypoints.min.js"></script>
<script src="client/assets/js/owl.carousel.min.js"></script>
<script src="client/assets/js/plugins.js"></script>
<script src="client/assets/js/main.js"></script>
</html>