<%@page import="java.text.DecimalFormat"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Checkout</title>
</head>
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
<body>
	<%@include file="header.jsp" %>
	<div class="breadcrumb-area pt-100 pb-100"
        style="background-image: url(<%=Common.url%>/client/assets/img/bg/bg.jpg); background-size: cover;">
        <div class="container">
            <div class="breadcrumb-content text-center">
                <h2>Checkout</h2>
                <ul>
                    <li><a href="#">home</a></li>
                    <li> Checkout page</li>
                </ul>
            </div>
        </div>
    </div>
	<!-- checkout-area start -->

    <div class="checkout-area ptb-100">
        <div class="container">
            <form action="<%=Common.url %>/client/checkout" method="POST">
                <div class="row">
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="checkbox-form">
                            <h3>Billing Details</h3>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="checkout-form-list">
                                        <label>Name <span class="required">*</span></label>
                                        <input type="text" value="<%=userAcc!=null ? userAcc.getName() : "" %>" name="name" placeholder="Name" required/>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="checkout-form-list">
                                        <label>Address <span class="required">*</span></label>
                                        <input type="text" value="" name="address" placeholder="Street address" required/>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="checkout-form-list">
                                        <label>Email Address <span class="required">*</span></label>
                                        <input type="email" value="" name="email" placeholder="Email address" required/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list">
                                        <label>Phone <span class="required">*</span></label>
                                        <input type="text" value="" name="phone" placeholder="Phone number" required />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="checkout-form-list create-acc">
                                        <input id="cbox" type="checkbox" />
                                        <label>Create an account?</label>
                                    </div>
                                    <div id="cbox_info" class="checkout-form-list create-account">
                                        <p>Create an account by entering the information below. If you are a returning
                                            customer please login at the top of the page.</p>
                                        <label>Account password <span class="required">*</span></label>
                                        <input type="password" placeholder="password" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-12">
                    	<%
                    		DecimalFormat df = new DecimalFormat("###,###,###");
                    	%>
                        <div class="your-order">
                            <h3>Your order</h3>
                            <div class="your-order-table table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product-name">Product</th>
                                            <th class="product-total">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<%if(cartList!=null)
                                    		for(CartItem item : cartList){
                                    	%>
	                                        <tr class="cart_item">
	                                            <td class="product-name">
	                                                <%=item.getProduct().getName() %><strong class="product-quantity"> × <%=item.getQuantity() %></strong>
	                                            </td>
	                                            <td class="product-total">
	                                                <span class="amount"><%=df.format(item.getQuantity() * item.getUnitPrice()) %> đ</span>
	                                            </td>
	                                        </tr>
                                       	<%} %>
                                    </tbody>
                                    <tfoot>
                                        <tr class="order-total">
                                            <th>Order Total</th>
                                            <td>
                                            	<%
                                            		double total = 0;
                                            		for(CartItem item : cartList){
                                            			total += item.getQuantity() * item.getUnitPrice();
                                            		}
                                            	%>
                                            	<strong><span class="amount"><%=df.format(total) %> VND</span></strong>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="order-button-payment">
                                <input type="submit" value="Place order" />
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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