<%@page import="com.yuu.daoimpl.CategoryDaoImpl"%>
<%@page import="com.yuu.dao.CategoryDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.yuu.model.Product"%>
<%@page import="com.yuu.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product List</title>
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
                    <h2>Product List</h2>
                    <ul>
                        <li><a href="#">home</a></li>
                        <li> product list</li>
                    </ul>
                </div>
            </div>
        </div>
			<%
        		ArrayList<Product> productList = (ArrayList<Product>) request.getAttribute("productList");
				int totalPages = (int) request.getAttribute("totalPages");
				int currentPage = (int) request.getAttribute("currentPage");
				int totalRecords = (int) request.getAttribute("totalRecords");
        		DecimalFormat df = new DecimalFormat("###,###,###");
				
        		
        		//pagni
                Category catePag = (Category) request.getAttribute("cate");
        		String key = (String) request.getAttribute("key");
                        		
	       %>
		<div class="shop-page-wrapper shop-page-padding ptb-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="shop-sidebar mr-50">
                            <div class="sidebar-widget mb-50">
                                <h3 class="sidebar-title">Search Products</h3>
                                <div class="sidebar-search">
                                    <form action="<%=Common.url %>/product/search-name" method="GET">
                                        <input placeholder="Search Products..." type="text" name="key">
                                        <button><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="sidebar-widget mb-40">
                                <h3 class="sidebar-title">Filter by Price</h3>
                                <div class="price_filter">
                                    <div id="slider-range"></div>
                                    <div class="price_slider_amount">
                                        <div class="label-input">
                                            <label>price : </label>
                                            <input type="text" id="amount" name="price"  placeholder="Add Your Price" />
                                        </div>
                                        <button type="button">Filter</button> 
                                    </div>
                                </div>
                            </div>
                            <div class="sidebar-widget mb-45">
                                <h3 class="sidebar-title">Categories</h3>
                                <div class="sidebar-categories">
                                    <%
                            		Map<Category, Integer> cateList = new LinkedHashMap<Category, Integer>();
                            		CategoryDao cateDao = new CategoryDaoImpl();
                            		// get total product by category
                            		cateList = cateDao.getTotalProductByCate();
                                   	Set<Category> keySet = cateList.keySet();
                                    %>
                                    <ul>
                                    	<li><a href="<%=Common.url%>/product/list">Tất cả sản phẩm</a></li>
	                                    <%if(cateList!=null)
	                                   		for(Category cate : keySet){
	                                   	%>
		                                        <li><a href="<%=Common.url%>/product/search-cate?id=<%=cate.getId()%>"><%=cate.getName() %> <span>(<%=cateList.get(cate) %>)</span></a></li>
                                    	<%} %>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="sidebar-widget mb-50">
                                <h3 class="sidebar-title">Top sale products</h3>
                                <div class="sidebar-top-rated-all">
                                    
                                    <%if(productList!=null) 
                                    	for(Product product : productList)
                                    		if(product.getDiscount()!= 0){
                                    %>
										<div class="sidebar-top-rated mb-30">
											<div class="single-top-rated">
												<div class="top-rated-img" >
													<a href="<%=Common.url%>/product/detail?id=<%=product.getId() %>"><img style="max-height: 150px"
														src="<%=Common.url %>/uploads/product/<%=product.getImage() %>" alt=""></a>
												</div>
												<div class="top-rated-text">
													<h4>
														<a href="<%=Common.url%>/product/detail?id=<%=product.getId() %>"><%=product.getName() %></a>
													</h4>
													<div class="top-rated-rating">
														<ul>
															<li><i class="pe-7s-star"></i></li>
															<li><i class="pe-7s-star"></i></li>
															<li><i class="pe-7s-star"></i></li>
															<li><i class="pe-7s-star"></i></li>
															<li><i class="pe-7s-star"></i></li>
														</ul>
													</div>
													<div><span class="text-danger">-<%=product.getDiscount() %>%</span></div>
													<%if(product.getDiscount()!=0) {%>
	                                        			<span class="text-danger"><%=df.format(product.getPrice() - product.getPrice()*product.getDiscount()/100) %>
														<small style="text-decoration:line-through; color: #686868"><%=df.format(product.getPrice()) %></small>
														</span>
	                                       			<%} else {%>
	                                       				<span class="text-danger"><%=df.format(product.getPrice()) %></span>
	                                       			<%} %>
												</div>
											</div>
										</div>
									<%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="shop-product-wrapper">
                            <div class="shop-bar-area">
                                <div class="shop-bar pb-60">
                                    <div class="shop-found-selector">
                                        <div class="shop-found">
                                            <p><span><%=productList.size()%></span> Product Found of <span><%=totalRecords%></span></p>
                                        </div>
                                        <div class="shop-selector">
                                            <label>Sort By : </label>
                                            <select name="select">
                                                <option value="">Default</option>
                                                <option value="">A to Z</option>
                                                <option value=""> Z to A</option>
                                                <option value="">In stock</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="shop-filter-tab">
                                        <div class="shop-tab nav" role=tablist>
                                            <a class="active" href="#grid-sidebar7" data-toggle="tab" role="tab" aria-selected="false">
                                                <i class="ti-layout-grid4-alt"></i>
                                            </a>
                                            <a href="#grid-sidebar8" data-toggle="tab" role="tab" aria-selected="true">
                                                <i class="ti-menu"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="shop-product-content tab-content">
                                    <div id="grid-sidebar7" class="tab-pane fade active show">
                                        <div class="row">
                                        	
											<%if(productList!=null)
												for(Product product:productList){	
											%>                        
												<div class="col-lg-4 col-md-6">
	                                                <div class="product-wrapper product-box-style mb-30 home-hover">
	                                                    <div class="product-img " title="">
	                                                        <a href="<%=Common.url %>/product/detail?id=<%=product.getId()%>">
	                                                            <img src="<%=Common.url %>/uploads/product/<%=product.getImage() %>" style="min-height: 250px; height: 300px;">
	                                                        </a>
	                                                    </div>
	                                                    <div class="product-content">
	                                                        <h4><a class="home-hover-a" href="<%=Common.url %>/product/detail?id=<%=product.getId()%>"><%=product.getName() %></a></h4>
		                                        			<%if(product.getDiscount()!=0) {%>
			                                        			<h5 class="text-danger"  style="font-size: 18px"><%=df.format(product.getPrice() - product.getPrice()*product.getDiscount()/100) %>
																<small style="text-decoration:line-through; color: #686868"><%=df.format(product.getPrice()) %></small>
																</h5>
		                                        			<%} else {%>
		                                        				<h5 class="text-danger"><%=df.format(product.getPrice()) %></h5>
		                                        			<%} %>
	                                                    </div>
	                                                </div>
                                           		</div>
											<%} %>                    
                                        </div>
                                    </div>
                                    <div id="grid-sidebar8" class="tab-pane fade">
                                        <div class="row">
                                            
                                            <%if(productList!=null) 
                                            	for(Product product : productList){
                                            %>
                                            	<div class="col-lg-12">
                                                <div class="product-wrapper mb-30 single-product-list product-list-right-pr mb-60 home-hover">
                                                    <div class="product-img list-img-width">
                                                        <a href="<%=Common.url %>/product/detail?id=<%=product.getId()%>">
                                                            <img src="<%=Common.url %>/uploads/product/<%=product.getImage() %>" alt="">
                                                        </a>
                                                        
                                                    </div>
                                                    <div class="product-content-list ">
                                                        <div class="product-list-info ">
                                                            <h4 class="home-hover-a mb-3"><a href="<%=Common.url %>/product/detail?id=<%=product.getId()%>"><%=product.getName() %></a></h4>
                                                            <%if(product.getDiscount()!=0) {%>
			                                        			<h5 class="text-danger"  style="font-size: 18px"><%=df.format(product.getPrice() - product.getPrice()*product.getDiscount()/100) %>
																<small style="text-decoration:line-through; color: #686868"><%=df.format(product.getPrice()) %></small>
																</h5>
		                                        			<%} else {%>
		                                        				<h5 class="text-danger"><%=df.format(product.getPrice()) %></h5>
		                                        			<%} %>
                                                            <%
                                                            	StringBuilder newStr = new StringBuilder();
                                                            	String []s = product.getDes().split(" ");
                                                            	for(int i = 0;i < s.length; i++){
                                                            		newStr.append(s[i]);
                                                            		newStr.append(" ");
                                                            		if(i==45)break;
                                                            	}
                                                            	String proName = s.length < 45 ? newStr.toString() : newStr.append("...").toString();
                                                            %>
                                                            <p class="home-hover-a"><%=proName %> </p>
                                                        </div>
                                                        <div class="product-list-cart-wishlist">
                                                            <div class="product-list-cart">
                                                                <a class="btn-hover list-btn-style" href="#">add to cart</a>
                                                            </div>
                                                            <div class="product-list-wishlist">
                                                                <a class="btn-hover list-btn-wishlist" href="#">
                                                                    <i class="pe-7s-like"></i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <%} %>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pagination-style mt-10 text-center">
                        	
                            <ul>
                            	<%if(catePag!=null){ //pagnig for search cate%>
                            		<%if(currentPage!=1){ %>
		                                <li><a href="search-cate?id=<%=catePag.getId() %>&& page=<%=currentPage-1 %>>"><i class="ti-angle-left"></i></a></li>
	                            	<%} %>
	                            	
	                            	<%for(int i = 1; i <= totalPages; i++){ %>
		                                <li class="<%=i==currentPage ? "active" : ""%>">
		                                <a href="search-cate?id=<%=catePag.getId() %>&&page=<%=i%>"><%=i %></a></li>
	                            	<%} %>
	                                
	                                <%if(currentPage!=totalPages){ %>
	                                	<li><a href="search-cate?id=<%=catePag.getId() %>&&page=<%=currentPage+1 %>"><i class="ti-angle-right"></i></a></li>
	                                <%} %>
                            	<%}else if(key!=null){%>
                           			<%if(currentPage!=1){ //pagni for search product name%>
		                                <li><a href="search-name?key=<%=key %>&&page=<%=currentPage-1 %>>"><i class="ti-angle-left"></i></a></li>
	                            	<%} %>
	                            	
	                            	<%for(int i = 1; i <= totalPages; i++){ %>
		                                <li class="<%=i==currentPage ? "active" : ""%>">
		                                <a href="search-name?key=<%=key %>&&page=<%=i%>"><%=i %></a></li>
	                            	<%} %>
	                                
	                                <%if(currentPage!=totalPages){ %>
	                                	<li><a href="search-name?key=<%=key %>&&page=<%=currentPage+1 %>"><i class="ti-angle-right"></i></a></li>
	                                <%} %>
                            	<%} else{%>
                            		<%if(currentPage!=1){ //pagni for product List%>
		                                <li><a href="list/page=<%=currentPage-1 %>>"><i class="ti-angle-left"></i></a></li>
	                            	<%} %>
	                            	
	                            	<%for(int i = 1; i <= totalPages; i++){ %>
		                                <li class="<%=i==currentPage ? "active" : ""%>">
		                                <a href="list?page=<%=i%>"><%=i %></a></li>
	                            	<%} %>
	                                
	                                <%if(currentPage!=totalPages){ %>
	                                	<li><a href="list?page=<%=currentPage+1 %>"><i class="ti-angle-right"></i></a></li>
	                                <%} %>
                            	<%} %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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