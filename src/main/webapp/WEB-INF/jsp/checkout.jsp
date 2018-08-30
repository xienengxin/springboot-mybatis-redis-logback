<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.example.model.*,java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<meta charset utf="8">
<!--fonts-->
<link href='https://fonts.googleapis.com/css?family=Fredoka+One'
	rel='stylesheet' type='text/css'>

<!--fonts-->
<!--bootstrap-->
<link href="/themes/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<!--coustom css-->
<link href="/themes/css/style.css" rel="stylesheet"
	type="text/css" />
<!--shop-kart-js-->
<script src="/themes/js/simpleCart.min.js"></script>
<!--default-js-->
<script src="/themes/js/jquery-2.1.4.min.js"></script>
<!--bootstrap-js-->
<script src="/themes/js/bootstrap.min.js"></script>
<!--script-->
<!-- FlexSlider -->
<script src="/themes/js/imagezoom.js"></script>
<script defer src="/themes/js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="/themes/css/flexslider.css"
	type="text/css" media="screen" />

<script>
            // Can also be used with $(document).ready()
            $(window).load(function() {
              $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
              });
            });
            </script>
<!-- //FlexSlider-->
</head>
<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:import url="header.jsp" charEncoding="utf-8" />

	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<div class="head-bread">
		<div class="container">
			<ol class="breadcrumb">
				<li><a href="index">首页</a></li>
				<li><a href="product">产品</a></li>
				<li class="active">购物车</li>
			</ol>
		</div>
	</div>
	<!-- check-out -->
	
	<%
        	String tip="";
        	float totalMoney = 0;
        	int totalNum = 0;
        	int itemNum = 0;
        	int j = 0;
        	int k = 0;
        	List<Cart> list = (List<Cart>)session.getAttribute("data");
        	List<Integer> goodsNum = new ArrayList();
        	List<Integer> id = new ArrayList();
        	List<String> size=new ArrayList();
        	if(list==null){
        		tip="你还没有添加商品呢！";
        	}else{
        		k = list.size();
        		for(int i = 0;i < list.size();i++){
        			totalMoney += list.get(i).getMoney();
        			totalNum += list.get(i).getNum();
        			goodsNum.add(i, list.get(i).getNum());
        			id.add(i, list.get(i).getId());
        			size.add(i, list.get(i).getSize());
        			if(list.get(i).getId() == 0){
        				k--;
        			}
        		}
        	}if(k == 0){
        		tip = "你还没有添加商品呢！要不要再逛逛<br/><br/><p><a href='product' >点此进入商城首页</a></p>";
        	}
        %>
	<div class="check">
		
		<div class="container">
			<div class="col-md-3 cart-total">
				<%
					String paytips=(String)session.getAttribute("paytips");
					if(paytips==null){
						paytips="";
					}
				%>
				<a class="continue" href="product">继续添加商品</a>
				<font style="color:red"><h3><%=paytips%></h3></font><br/>
				<div class="price-details">
					<h3>明细</h3>
					<span>小计</span> <span class="total1">￥<%= totalMoney %></span> 
					<span>折扣</span>
					<span class="total1">10%</span> 
					<div class="clearfix"></div>
				</div>
				<hr class="featurette-divider">
				<ul class="total_price">
					<li class="last_price">
						<h4>总计</h4>
					</li>
					<li class="last_price"><span>￥<%= totalMoney %></span></li>
					<div class="clearfix"></div>
				</ul>
				<div class="clearfix"></div>
				<a id="pay" class="order" href="payorder">购买</a>
			</div>
			
			<div class="col-md-9 cart-items">
				<h1>我的购物车 (<%= k %>)</h1>
				<script>
				$(document).ready(function(c) {
                   $('.close').on('click', function(c){
                      var id = $(this).parent().attr('id');
                        $('#'+id+'').fadeOut('slow', function(c){
                           $('#'+id+'').remove(); 
                              $.get(
    							"cartdel",
    							 {"id":id},
    							  function(data){
    							   if(data==''){
    								   
    								}
    							   window.location.reload(true);
    							  }
    					      )
                      });
                   });	
                });
                </script>
                
				<ul><font style="color : red"><h4><%=tip %></h4></font></ul>
				<c:if test="${goods}!=null">
				<c:forEach items="${goods }" var="item">
					<c:set var="pics" value="${fn:split(item.pic, ',')}" />
					
					<div class="cart-header" id="${item.id}">
						<div class="close">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</div>
						<div class="cart-sec simpleCart_shelfItem">
							<div class="cart-item cyc">
								<img src="../themes/images/${pics[0] }" class="img-responsive"
									alt="" />
							</div>
							<div class="cart-item-info">
								<ul class="qty">
									<li><p>尺码 :<%=size.get(j) %></p></li>
									<li><p>数量 :<%=goodsNum.get(j)%></p></li>
									<li><p>单价 : ￥${item.price }</p></li>
								</ul>
								<div class="delivery">
									<!--  <p>手续费 : Rs.190.00</p> -->
									<span>预计将在2-3个工作日送达</span>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="clearfix"></div>
							<% j++;%>
						</div>
					</div>
					
				</c:forEach>
				</c:if>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<% 
		paytips="";
		session.setAttribute("paytips", paytips); 
	%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:import url="footer.jsp" charEncoding="utf-8" />
</body>
</html>