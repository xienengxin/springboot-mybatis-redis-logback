<%@page import="com.example.model.Cart"%>
<%@page import="java.io.Console"%>
<%@page import="com.example.model.Shoes"%>
<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.example.model.*,java.util.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Single</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
		<!--fonts-->
		<link href='https://fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>
		
		<!--fonts-->
		<!--bootstrap-->
			 <link href="../../themes/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="../../themes/css/style.css" rel="stylesheet" type="text/css"/>
        <!--shop-kart-js-->
        <script src="../../themes/js/simpleCart.min.js"></script>
		<!--default-js-->
			<script src="../../themes/js/jquery-2.1.4.min.js"></script>
		<!--bootstrap-js-->
			<script src="../../themes/js/bootstrap.min.js"></script>
		<!--script-->
         <!-- FlexSlider -->
            <script src="../../themes/js/imagezoom.js"></script>
              <script defer src="../../themes/js/jquery.flexslider.js"></script>
            <link rel="stylesheet" href="../../themes/css/flexslider.css" type="text/css" media="screen" />
            <script>
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
      	<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           
        <%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
		<c:import url="header.jsp" charEncoding="utf-8" />
		
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="../index">主页</a></li>
                    <li><a href="javascript:history.back(-1)">上一级标签</a></li>
                    <li class="active">商品</li>
                </ol>
            </div>
        </div>
        <div class="showcase-grid" >
            <div class="container" >
                <div class="col-md-8 showcase">
                    <div class="flexslider" >
                    	
                          <ul class="slides">
                         	<%-- //<c:forEach items="${goods }" var="item"> --%>
                         	<c:set var="pics" value="${fn:split(goods.pic, ',')}"/>
                           	 	
                           	 	<li data-thumb="../../themes/images/${pics[0]}" >
                                	<div class="thumb-image"> <img src="../../themes/images/${pics[0]}" data-imagezoom="true" class="img-responsive"> </div>
                           	 	</li>
                        		<li data-thumb="../../themes/images/${pics[1]}">
                                	<div class="thumb-image"> <img src="../../themes/images/${pics[1]}" data-imagezoom="true" class="img-responsive"> </div>
                           	 	</li>
                           	 	<li data-thumb="../../themes/images/${pics[2]}">
                                	<div class="thumb-image"> <img src="../../themes/images/${pics[2]}" data-imagezoom="true" class="img-responsive"> </div>
                           	 	</li>
                           	 	<li data-thumb="../../themes/images/${pics[3]}">
                                	<div class="thumb-image"> <img src="../../themes/images/${pics[3]}" data-imagezoom="true" class="img-responsive"> </div>
                           	 	</li>
                           	
                          </ul>
                        
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-md-4 showcase">
                    <div class="showcase-rt-top">
                        <div class="pull-left shoe-name">
                        	<h3>${goods.title}</h3>
                            <p>${goods.subtitle }</p>
                            <h4>￥${goods.price }</h4>
                        </div>
                        
                        <div class="clearfix"></div>
                    </div>
                    <hr class="featurette-divider">
                    <div class="shocase-rt-bot">
                        <div class="float-qty-chart">
                        <ul>
                            <li class="qty">
                                <h3>尺寸</h3>
                                <select class="form-control siz-chrt" id="size">
                                  <option>38</option>
                                  <option>39</option>
                                  <option>40</option>
                                  <option>41</option>
                                  <option>42</option>
                                  <option>43</option>
                                </select>
                            </li>
                            <li class="qty" name="num">
                                <h4>数量</h4>
                                <select class="form-control qnty-chrt" id="num">
                                  <option value="1">1</option>
                                  <option value="2">2</option>
                                  <option value="3">3</option>
                                  <option value="4">4</option>
                                  <option value="5">5</option>
                                  <option value="6">6</option>
                                  <option value="7">7</option>
                                </select>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                        </div>
                        <ul>
                            <li class="ad-2-crt simpleCart_shelfItem">
                                <a id="chart" class="btn item_add" href="#" role="button">添加到购物车</a>
                                <a id="buynow" class="btn" href="#" role="button">立即购买</a>
                            </li>
                        </ul>
                    </div>
                    <!-- <script type="text/javascript">
                        	window.location.reload(); 
                        </script> -->
                    <div class="showcase-last">
                        <h3>制造详细信息</h3>
                        <ul>
                            ${goods.details }
                        </ul>
                        
                        
                        <ul>
                        	<%
                        		String paytips=(String)session.getAttribute("paytips");
                        	    if(paytips==null){
                        		   paytips="";
                        	    }
                        	%>
                        	<%=paytips %>
                        	<%
                        	  paytips="";
            				  session.setAttribute("paytips", paytips); 
                        	%>
                        </ul>
                    </div>
                </div>
        		<div class="clearfix"></div>
            </div>
        </div>
        
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:import url="footer.jsp" charEncoding="utf-8" />
	 <script type="text/javascript">
    	$('#chart').click(function(){
    		var id=${goods.id};
    		var price = ${goods.price};
    		var num = $('#num').val();
    		var size = $('#size').val();
    		$.get(
    				"../cart",
    				{"id":id,"price":price,"num":num,"size":size},
    				function(data){
    					if(data==''){
    						
    					}
    					window.location.reload(); 
    				}
    				)
    	   
    	});
    	
    	$('#buynow').click(function(){
    		var id=${goods.id};
    		var price = ${goods.price};
    		var num = $('#num').val();
    		var size = $('#size').val();
    		
    		$.get(
    				"../buy",
    				{"id":id,"price":price,"num":num,"size":size},
    				function(data){
    					if(data!=''){
    						
    					}
    					window.location.reload()
    				}
    				) 	
    				
    	});
    </script> 
    </body>
 
</html>
    