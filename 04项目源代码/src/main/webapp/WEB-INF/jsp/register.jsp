<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Checkout</title>
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
         <!-- FlexSlider -->
            <script src="/themes/js/imagezoom.js"></script>
              <script defer src="/themes/js/jquery.flexslider.js"></script>
            <link rel="stylesheet" href="/themes/css/flexslider.css" type="text/css" media="screen" />

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
        <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
		<c:import url="header.jsp" charEncoding="utf-8" />
		
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index">主页</a></li>
                    <li><a href="signup">登录</a></li>
                    <li class="active">注册</li>
                </ol>
            </div>
        </div>
        <!-- reg-form -->
	<div class="reg-form">
		<div class="container">
			<div class="reg">
				<h3>立即注册</h3>
				<p>欢迎, 请跟着下面的操作注册.</p>
				<p>如果你以前在这个网站注册过, <a href="signup">点击这里</a></p>
				<%
					String regtips=(String)session.getAttribute("regtips");
				    if(regtips==null){
				    	regtips="";
				    }
				%>
				<font style="color:red"><h4><%=regtips %></h4></font>
				 <form action="doReg" method="post">
					<ul>
						<li class="text-info">姓名: </li>
						<li><input type="text" value="" name="name"></li>
					</ul>
					<ul>
						<li class="text-info">密码: </li>
						<li><input type="password" value="" name="password"></li>
					</ul>
					<ul>
						<li class="text-info">确认密码:</li>
						<li><input type="password" value="" name="checkpwd"></li>
					</ul>
					<ul>
						<li class="text-info">手机号码:</li>
						<li><input type="text" value="" name="phone"></li>
					</ul>						
					<input type="submit" value="马上注册">
					<p class="click">点击按钮,你同意我们的  <a href="#">政策条款和条件.</a></p> 
				</form>
			</div>
		</div>
	</div>
	<a href="admin/index">点此进入后台管理系统</a>
	<a href="index">点此进入运动鞋商城</a>
        <%session.removeAttribute("regtips"); %>
        <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
		<c:import url="footer.jsp" charEncoding="utf-8" />
    </body>
</html>