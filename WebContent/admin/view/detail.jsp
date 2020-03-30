<%@page import="java.text.DecimalFormat"%>
<%@page import="com.yuu.model.Product"%>
<%@page import="com.yuu.common.Common"%>
<%@ page language="java" contentType="text/html;"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Chi tiết sản phẩm</title>
</head>
<link href="<%=Common.url%>/admin/static/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=Common.url%>/admin/static/css/styles.css" rel="stylesheet">
<body>
	<%@include file="nav-sidebar.jsp"%>
	<!-- navbar-sidebar -->
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
          <div class="row">
               <ol class="breadcrumb">
                    <li><a href="#"><span class="glyphicon glyphicon-home"></a></li>
                    <li class="active">Sản phẩm</li><li class="active">Chi tiết sản phẩm</li>
               </ol>
          </div>
          <%
          	Product product = (Product) request.getAttribute("product");
          	DecimalFormat df = new DecimalFormat("###,###,###");
          %>
          <div class="row">
               <div class="col-xs-12 col-md-12 col-lg-12">
                    <div class="panel panel-primary" style="margin-top: 15px;">
                         <div class="panel-heading">
							Chi tiết sản phẩm
                         </div>
                    </div>
                    <div class="panel-body">
                         <div class="mb-20">
                              <label>Mã sản phẩm: </label>
                              <span> <%=product!=null ? product.getId() : "" %></span>
                         </div>
                         
                         <div class="mb-20">
                              <label>Tên sản phẩm: </label>
                              <span> <%=product!=null ? product.getName() : "" %></span>
                         </div>
                         
                         <div class="mb-20">
                              <label>Ảnh sản phẩm: </label>
							<div style="padding: 20px 0;">
								<img
									src="<%=Common.url%>/uploads/product/<%=product != null ? product.getImage() : ""%>"
									style="height: 250px" />
							</div>
						</div>
                         
                         <div class="mb-20">
                              <label>Giá sản phẩm: </label>
                              <span><%=product!=null ? df.format(product.getPrice()) : "" %> VND</span>
                         </div>
                         <div class="mb-20">
                              <label>Giảm giá </label>
                              <span><%=product!=null ? product.getDiscount() : "" %> %</span>
                         </div>
                         
                         <div class="mb-20">
                              <label>Số lượng:</label>
                              <span><%=product!=null ? product.getQuantity() : "" %></span>
                         </div>
                         <div class="mb-20">
                              <label>Danh mục</label>
                              <span><%=product!=null ? product.getCategory().getName() : "" %></span>
                         </div>
                         <div class="mb-20">
                              <label>Mô tả:</label>
                              <p>
                                  <%=product!=null ? product.getDes() : "" %>
                              </p>
                         </div>
                         <a class="btn btn-primary" href="<%=Common.url%>/admin/product-list">Quay lại</a>
                    </div>
               </div>
          </div>
     </div>
</body>
<script src="<%=Common.url%>/admin/static/js/lumino.glyphs.js"></script>
<script src="<%=Common.url%>/admin/static/js/jquery-1.11.1.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/bootstrap.min.js"></script>
<script src="<%=Common.url%>/admin/static/js/index.js"></script>
</html>