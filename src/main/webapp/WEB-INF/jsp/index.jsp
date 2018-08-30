<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Home</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
		<!--fonts-->
		<link href='https://fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>
		
		<!--fonts-->
		<!--bootstrap-->
			 <link href="/themes/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="/themes/css/style.css" rel="stylesheet" type="text/css"/>
        <!--shop-kart-js-->
        <script src="/themes/js/simpleCart.min.js"></script>
		<!--default-js-->
			<script src="/themes/js/jquery-2.1.4.min.js"></script>
		<!--bootstrap-js-->
			<script src="/themes/js/bootstrap.min.js"></script>
		<!--script-->
    </head>
    <body>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<c:import url="header.jsp" charEncoding="utf-8" />
 	    <c:import url="other.jsp" charEncoding="utf-8" />
        
        <div class="shop-grid">
          
            <div class="container">
          		<c:forEach items="${goods }" var="item">
                <div class="col-md-4 grid-stn simpleCart_shelfItem">
                	<c:set var="pics" value="${fn:split(item.pic, ',')}"/>
                     <!-- normal -->
                        <div class="ih-item square effect3 bottom_to_top">
                            <div class="bottom-2-top">
                         <div class="img"><img src="../themes/images/${pics[0]}" alt="/" class="img-responsive gri-wid"></div>
                            <div class="info">
                                <div class="pull-left styl-hdn">
                                    <h3>${item.title }</h3>
                                </div>
                                <div class="pull-right styl-price">
                                    <p><a  href="#" class="item_add">
                                    <span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> 
                                    <span class=" item_price">￥${item.price }</span></a></p>
                                </div>
                                <div class="clearfix"></div>
                            </div></div>
                        </div>
                    <!-- end normal -->
                    <div class="quick-view">
                        <a href="shoe/${item.id}">详情</a>
                    </div>
                </div>
                </c:forEach>
       			<div class="clearfix"></div>
            </div>
            
        </div>
       
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:import url="footer.jsp" charEncoding="utf-8" />
    </body>
</html>