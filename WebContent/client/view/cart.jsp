<%@page import="java.text.DecimalFormat"%>
<%@page import="com.yuu.model.CartItem"%>
<%@page import="java.util.List"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cart</title>
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
		<div class="breadcrumb-area pt-100 pb-100" style="background-image: url(<%=Common.url%>/client/assets/img/bg/bg.jpg); background-size: cover;">
            <div class="container">
                <div class="breadcrumb-content text-center">
                    <h2>cart page</h2>
                    <ul>
                        <li><a href="#">home</a></li>
                        <li> cart page</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- shopping-cart-area start -->
        <div class="cart-main-area pt-95 pb-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    		<%
	                           	String errMess = (String) request.getAttribute("errMess");
	                           	//List<CartItem> cartList = (List<CartItem>) session.getAttribute("cart"); ở header
	                           	DecimalFormat df = new DecimalFormat("###,###,###");
	                           	
                           %>
	                           <%if(errMess!=null){ %>
	                           	<p class="alert alert-danger"><%=errMess %></p>
	                           <%} %>
	                           
                            <div class="table-content table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>remove</th>
                                            <th>images</th>
                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<%if(cartList!=null)
			                           		for(int i = 0; i < cartList.size(); i++){
			                          	%>
	                                        <tr>
	                                            <td class="product-remove"><a href="<%=Common.url%>/delete-cart?idx=<%=i%>"
	                                            	onclick="return confirm('Bạn có chắc chắn muốn xóa?')"
	                                            ><i class="pe-7s-close"></i></a></td>
	                                            <td class="product-thumbnail">
	                                                <a href="<%=Common.url%>/product/detail?id=<%=cartList.get(i).getProduct().getId() %>">
	                                                <img src="<%=Common.url %>/uploads/product/<%=cartList.get(i).getProduct().getImage() %>" alt="" style="max-height: 120px"></a>
	                                            </td>
	                                            <td class="product-name"><a href="<%=Common.url%>/product/detail?id=<%=cartList.get(i).getProduct().getId() %>">
	                                            	<%=cartList.get(i).getProduct().getName() %></a>
	                                            	(<%=cartList.get(i).getProduct().getQuantity() %>)
	                                            </td>
	                                            <td class="product-price-cart"><span class="amount">
	                                            	<%=df.format(cartList.get(i).getUnitPrice()) %>
	                                            	VND
	                                            </span></td>
	                                            <td class="product-quantity">
	                                            	<a class="btn" href="<%=Common.url%>/update-cart?action=desc&&idx=<%=i%>" style="font-size: 24px;">-</a>
	                                                <input value="<%=cartList.get(i).getQuantity() %>" min = "1" type="number" disabled>
	                                                <a class="btn" href="<%=Common.url%>/update-cart?action=asc&&idx=<%=i%>"  style="font-size: 24px;">+</a>
	                                            </td>
	                                            <td class="product-subtotal"><%=df.format(cartList.get(i).getQuantity() * cartList.get(i).getUnitPrice()) %> VND</td>
	                                        </tr>
                                        <%} %>
                                        
                                    </tbody>
                                </table>
                                    <%if(cartList == null || cartList!=null && cartList.isEmpty() ){ %>
                                    		<p class="text-center">Chưa có sản phẩm nào trong giỏ hàng.</p>
                                    <%} %>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="coupon-all">
                                        <div class="coupon">
                                            <input id="coupon_code" class="input-text" name="coupon_code" value="" placeholder="Coupon code" type="text">
<input class="button" name="apply_coupon" value="Apply coupon" type="submit">
                                        </div>
                                        <div class="coupon2">
                                           <a class="btn-shop" href="<%=Common.url %>/product/list">Shop</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-5 ml-auto">
                                    <div class="cart-page-total">
                                        <h2>Cart totals</h2>
                                        <%
                                        	double total = 0;
                                        	if(cartList!=null){
                                        		for(int i = 0; i < cartList.size(); i++){
                                            		total += cartList.get(i).getQuantity() * cartList.get(i).getUnitPrice();
                                            	}
                                        	}
                                        %>
                                        <ul>
                                            <li>Total<span><%=df.format(total) %>VND</span></li>
                                        </ul>
                                        <a href="<%=Common.url%>/client/checkout">Proceed to checkout</a>
                                    </div>
                                </div>
                            </div>
                        </form>
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