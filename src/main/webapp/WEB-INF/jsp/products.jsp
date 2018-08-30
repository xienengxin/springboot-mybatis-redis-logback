<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Products</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta charset utf="8">
		<!--fonts-->
		<link href='https://fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>
		
		<!--fonts-->
        <!--form-css-->
        <link href="../themes/css/form.css" rel="stylesheet" type="text/css" media="all" />
		<!--bootstrap-->
			 <link href="../themes/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<!--coustom css-->
			<link href="../themes/css/style.css" rel="stylesheet" type="text/css"/>
        <!--shop-kart-js-->
        <script src="../themes/js/simpleCart.min.js"></script>
		<!--default-js-->
			<script src="../themes/js/jquery-2.1.4.min.js"></script>
		<!--bootstrap-js-->
			<script src="../themes/js/bootstrap.min.js"></script>
		<!--script-->
         <!-- FlexSlider -->
            <script src="../themes/js/imagezoom.js"></script>
            <script defer src="../themes/js/jquery.flexslider.js"></script>
            <link rel="stylesheet" href="../themes/css/flexslider.css" type="text/css" media="screen" />

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
        <%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
           
		<c:import url="header.jsp" charEncoding="utf-8" />
        
        <div class="head-bread">
            <div class="container">
                <ol class="breadcrumb">
                    <li><a href="index">主页</a></li>
                    <li class="active">展示页</li>
                </ol>
            </div>
        </div>
        <div class="products-gallery">
           <div class="container">
               <div class="col-md-9 grid-gallery">
               <c:forEach items="${goods }" var="item">
                    <div class="col-md-4 grid-stn simpleCart_shelfItem">
                         <!-- normal -->
                            <div class="ih-item square effect3 bottom_to_top">
                            <c:set var="pics" value="${fn:split(item.pic, ',')}"/>
                                <div class="bottom-2-top">
                        			<div class="img"><img src="../themes/images/${pics[0]}" alt="/" class="img-responsive gri-wid"></div>
                                <div class="info">
                                    <div class="pull-left styl-hdn">
                                        <h3>${item.title}</h3>
                                    </div>
                                    <div class="pull-right styl-price">
                                        <p><a  href="#" class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">￥${item.price}</span></a></p>
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
               <div class="col-md-3 grid-details">
                    <div class="grid-addon">
					 <link rel="stylesheet" type="text/css" href="../themes/css/jquery-ui.css">
					<script type='text/javascript'>//<![CDATA[ 
					$(window).load(function(){
					 $( "#slider-range" ).slider({
								range: true,
								min: 0,
								max: 400000,
								values: [ 2500, 350000 ],
								slide: function( event, ui ) {  $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
								}
					 });
					$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );

					});//]]>  

					</script>
					<section  class="sky-form">
						
				   </section>
				  	<section  class="sky-form">
						<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>品牌</h4>
						<form action="search" method="post" style="width: 930px; ">
							<div class="row row1 scroll-pane">
								<div class="col col-4">
									<input type="hidden" name="checkbox" value="false">
									<label class="checkbox"><input type="checkbox" name="checkbox" value="NIKE"><i></i>NIKE</label>
									<label class="checkbox"><input type="checkbox" name="checkbox" value="adidas"><i></i>adidas</label>
									<label class="checkbox"><input type="checkbox" name="checkbox" value="LINING"><i></i>LINING</label>
								    <label class="checkbox"><input type="checkbox" name="checkbox" value="ANTA"><i></i>ANTA</label>
								    <input type="submit" value="确认">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="清空">
								</div>
							</div>
						</form>
				    </section>		
                    </div>
               </div>
            <div class="clearfix"></div>
            </div> 
        </div>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:import url="footer.jsp" charEncoding="utf-8" />
    </body>
</html>