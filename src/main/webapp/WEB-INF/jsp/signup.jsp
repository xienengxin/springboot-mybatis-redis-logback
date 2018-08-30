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
		<%
			String logintips=(String)session.getAttribute("logintips");
			if(logintips == null){
				logintips="";
			}
		%>
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index">主页</a></li>
                    <li class="active">登录</li>
                </ol>
            </div>
        </div>
        <!--signup-->
        <!-- login-page -->
        <div class="login">
            <div class="container">
                <div class="login-grids">
                    <div class="col-md-6 log">
                             <h3>登录</h3>
                             <div class="strip"></div>
                             <p>欢迎, 请跟着下面的提示登录.</p>
                             <p><font style="color:red"><h4><%=logintips %></h4></font></p>
                             <form action="doLogin" method="post">
                                 <h5>姓名:</h5>	
                                 <input type="text" value="" name="username">
                                 <h5>密码:</h5>
                                 <input type="password" value="" name="password"><br>					
                                 <input type="submit" value="登录">

                             </form>
                            <!-- <a href="#">忘记密码 ?</a> -->
                    </div>
                    <div class="col-md-6 login-right">
                            <h3>新用户</h3>
                            <div class="strip"></div>
                            <p>在我们商城创建用户, 你可以更快的支付购买你的物品, 保存多个运输地址,在你的用户界面上可以查看和追踪你的订单以及更多的操作.</p>
                            <a href="register" class="button">创建用户</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
<!-- //login-page -->
		<%session.removeAttribute("logintips"); %>
        <!--signup-->
        <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
		<c:import url="footer.jsp" charEncoding="utf-8" />
    </body>
</html>