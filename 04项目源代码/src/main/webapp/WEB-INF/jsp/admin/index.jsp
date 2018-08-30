<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html >

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>运动鞋商城后台</title>
        <script src="../../themes/backstage/js/jquery.min.js"></script>
        <script src="../../themes/backstage/js/bootstrap.min.js"></script>
        <script>
            $(function() {
                $(".meun-item").click(function() {
                    $(".meun-item").removeClass("meun-item-active");
                    $(this).addClass("meun-item-active");
                    var itmeObj = $(".meun-item").find("img");
                    itmeObj.each(function() {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png")
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");
                    
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
                $("#topAD").click(function() {
                    $("#topA").toggleClass(" glyphicon-triangle-right");
                    $("#topA").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topBD").click(function() {
                    $("#topB").toggleClass(" glyphicon-triangle-right");
                    $("#topB").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topCD").click(function() {
                    $("#topC").toggleClass(" glyphicon-triangle-right");
                    $("#topC").toggleClass(" glyphicon-triangle-bottom");
                });
                $(".toggle-btn").click(function() {
                    $("#leftMeun").toggleClass("show");
                    $("#rightContent").toggleClass("pd0px");
                })
            })
        </script>
        <link href="../../themes/backstage/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../../themes/backstage/css/common.css" />
        <link rel="stylesheet" type="text/css" href="../../themes/backstage/css/slide.css" />
        <link rel="stylesheet" type="text/css" href="../../themes/backstage/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="../../themes/backstage/css/flat-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="../../themes/backstage/css/jquery.nouislider.css">
    </head>

    <body>
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
        <div id="wrap">
            <!-- 左侧菜单栏目块 -->
            <div class="leftMeun" id="leftMeun">
                <div id="logoDiv">
                    <p id="logoP"><img id="logo" alt="左右结构项目" src="../../themes/backstage/images/logo.png"><span>N-AIR运动鞋商城</span></p>
                </div>
                <div id="personInfor">
                <%
                	String username=(String)session.getAttribute("username");
                	if(username==null){
                		username="";
                	}
                
                %>
                    <p id="userName"><%=username%></p>
                   
                    <p>
                        <a href="/shop/admin/logout">退出登录</a>
                    </p>
                </div>
              
                		<div class="meun-item meun-item-active" href="#sour" aria-controls="sour" role="tab" data-toggle="tab"><img src="../../themes/backstage/images/icon_source.png">商品管理</div>
                        <div class="meun-item" href="#user" aria-controls="user" role="tab" data-toggle="tab"><img src="../../themes/backstage/images/icon_user_grey.png">订单管理</div>
                        <div class="meun-item" href="#chan" aria-controls="chan" role="tab" data-toggle="tab"><img src="../../themes/backstage/images/icon_change_grey.png">修改密码</div>
            </div>
            <!-- 右侧具体内容栏目 -->
            <div id="rightContent">
                <a class="toggle-btn" id="nimei">
                    <i class="glyphicon glyphicon-align-justify"></i>
                </a>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- 商品管理模块 -->
                    <div role="tabpanel" class="tab-pane active" id="sour">
                        <div class="check-div form-inline">
                            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addSource">添加商品</button>
                        </div>
                        <div class="data-div">
                            <div class="row tableHeader">
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    id
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    title
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    subtitle
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    type
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    subtype
                                </div>
								<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    price
                                </div>
								<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    brand
                                </div>
								<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    details
                                </div>
							    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    pic
                                </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                    stock
                                </div>
                            </div>
                            <div class="tablebody">
                            <%int i=1; %>
                            <c:forEach items="${goods}" var="item">
                            
                            <div class="row">
                            	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						   <%--  ${item.id } --%>
      						    <%=i %>
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.title }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.subtitle }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.type }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.subtype }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.price }
      							</div>	
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.brand }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.details }
      							</div>    							
      						    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.pic }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.stock }
      							</div>
      							 <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                        <button id="change" class="btn btn-success btn-xs" data-toggle="modal" data-id="${item.id }" data-title="${item.title }"  data-subtitle="${item.subtitle }" data-type="${item.type }" data-subtype="${item.subtype }" data-price="${item.price }" data-brand="${item.brand }" data-details="${item.details }" data-pic="${item.pic }" data-stock="${item.stock }" data-target="#changeSource" >修改</button>     
                                    </div>
                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">                                       
                                        <a href="/hello/shop/admin/deleteGoods/${item.id}" class="btn btn-danger btn-xs" data-toggle="modal" >删除</a>
                                    </div>
                                   <p><%i++; %>  </p> 
      						</div> 
      						   						
    						</c:forEach>  
                            </div>
                        </div>
              
                        <!--弹出窗口 添加商品-->
                        <div class="modal fade" id="addSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">添加商品</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal" action="/hello/shop/admin/addGoods" method="post">
                                                <input type="hidden" name="id" id="id" value="0">
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">名称</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="title" name="title" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">子标题</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="subtitle" name="subtitle" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">类型</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="type" name="type" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">子类型</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="subtype" name="subtype" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">价格</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="price" name="price" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">品牌</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="brand" name="brand" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">详情</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="details" name="details" placeholder="">
                                                    </div>
                                                </div>
                                                 <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">图片</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="pic" name="pic" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">库存数量</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="stock" name="stock" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                        			<button type="button" class="btn btn-xs btn-xs btn-white" data-dismiss="modal">取 消</button>
                                        			<button type="submit" class="btn btn-xs btn-xs btn-green">保存</button>
                                    			</div>
                                            </form>
                                        </div>
                                    </div>
                                    
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                        <!--修改商品弹出窗口-->
                        <div class="modal fade" id="changeSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">修改商品</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal" action="/hello/shop/admin/updateGoods" method="post">
                                                <input type="hidden" name="id" id="changeid">
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">名称</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="changetitle" name="title" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">子标题</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="changesubtitle" name="subtitle" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">类型</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="changetype" name="type" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">子类型</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="changesubtype" name="subtype" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">价格</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="changeprice" name="price" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">品牌</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="changebrand" name="brand" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">详情</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="changedetails" name="details" placeholder="">
                                                    </div>
                                                </div>
                                                 <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">图片地址</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="changepic" name="pic" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">库存数量</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="changestock" name="stock" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                        			<button type="button" class="btn btn-xs btn-xs btn-white" data-dismiss="modal">取 消</button>
                                        			<button type="submit" class="btn btn-xs btn-xs btn-green">保存</button>
                                    			</div>
                                    			<script>
                                    			$('#changeSource').on('shown.bs.modal', function (event) {
                                    				var btnThis = $(event.relatedTarget)
                                    				var modalid = btnThis.data('id')
                                    				var modaltitle=btnThis.data('title')
                                    				var modalsubtitle=btnThis.data('subtitle')
                                    				var modaltype=btnThis.data('type')
                                    				var modalsubtype=btnThis.data('subtype')
                                    				var modalprice=btnThis.data('price')
                                    				var modalbrand=btnThis.data('brand')
                                    				var modaldetails=btnThis.data('details')
                                    				var modalpic=btnThis.data('pic')
                                    				var modalstock=btnThis.data('stock')
                                    				$('#changeid').val(modalid)
                                    				$('#changetitle').val(modaltitle)
                                    				$('#changesubtitle').val(modalsubtitle)
                                    				$('#changetype').val(modaltype)
                                    				$('#changesubtype').val(modalsubtype)
                                    				$('#changeprice').val(modalprice)
                                    				$('#changebrand').val(modalbrand)
                                    				$('#changedetails').val(modaldetails)
                                    				$('#changepic').val(modalpic)
                                    				$('#changestock').val(modalstock)
                                    				})
                                    			
                                    			</script>
                                            </form>
                                        </div>
                                    </div> 
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                        
                    </div>
                    
            <!--商品管理模块-->
            <div role="tabpanel" class="tab-pane" id="user">
                <div class="check-div form-inline">
                </div>
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-1 ">
                           id
                        </div>
                        <div class="col-xs-1 ">
                            user_id
                        </div>
                        <div class="col-xs-1 ">
                            state
                        </div>
                        <div class="col-xs-1 ">
                            ordertime
                        </div>
                        
                        <div class="col-xs-1">
                            arrivetime
                        </div>
                        <div class="col-xs-1">
                           shoes_id
                        </div>
                        <div class="col-xs-1">
                            price
                        </div>
                        <div class="col-xs-1">
                            size
                        </div>
                        <div class="col-xs-1">
                        	num
                        </div>
                    </div>
                    <div class="tablebody">
                                <c:forEach items="${orders}" var="item">
                                <div class="row">
                            	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.id }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.user_id }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.state }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.ordertime }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.arrivetime }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.shoes_id }
      							</div>	
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.price }
      							</div>
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.size }
      							</div>    							     							
      							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 content">
      						    ${item.num }
      							</div>
      							    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                        <button id="show" class="btn btn-success btn-xs" data-toggle="modal" data-id="${item.id} "  data-user_id="${item.user_id }"  data-state="${item.state }" data-ordertime="${item.ordertime }" data-arrivetime="${item.arrivetime }" data-shoes_id="${item.shoes_id }" data-price="${item.price }" data-size="${item.size }" data-num="${item.num }"  data-target="#showSource" >显示</button>     
                                    </div>
                                <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">                                       
                                    <a href="/hello/shop/admin/deleteOrders/${item.id}" class="btn btn-danger btn-xs" data-toggle="modal" >删除</a>
                                </div> 
      						</div>      						
    						</c:forEach>  
                    </div>
                </div>
               <!--显示弹出窗口-->
                        <div class="modal fade" id="showSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="gridSystemModalLabel">显示订单详情</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <form class="form-horizontal" >                                          
                                                <div class="form-group ">
                                                    <label for="sName" class="col-xs-3 control-label">ID</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="showid" name="showid" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">用户ID</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="showuser_id" name="showuser_id" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">状态</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="showstate" name="showstate" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">下单时间</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="showordertime" name="showordertime" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">到达时间</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="showarrivetime" name="showarrivetime" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">鞋号</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="showshoes_id" name="showshoes_id" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">价格</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="showprice" name="showprice" placeholder="">
                                                    </div>
                                                </div>
                                                 <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">尺码</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="showsize" name="showsize" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sLink" class="col-xs-3 control-label">num</label>
                                                    <div class="col-xs-8 ">
                                                        <input type="text" class="form-control input-sm duiqi" id="shownum" name="shownum" placeholder="">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                        			<button type="button" class="btn btn-xs btn-xs btn-white" data-dismiss="modal">取 消</button>
                                    			</div>
                                    			<script>
                                    			$('#showSource').on('shown.bs.modal', function (event) {
                                    				var btnThis = $(event.relatedTarget)
                                    				var modalid = btnThis.data('id')
                                    				var modaluser_id=btnThis.data('user_id')
                                    				var modalstate=btnThis.data('state')
                                    				var modalordertime=btnThis.data('ordertime')
                                    				var modalarrivetime=btnThis.data('arrivetime')
                                    				var modalshoes_id=btnThis.data('shoes_id')
                                    				var modalprice=btnThis.data('price')
                                    				var modalsize=btnThis.data('size')
                                    				var modalnum=btnThis.data('num')
                                    				$('#showid').val(modalid)
                                    				$('#showuser_id').val(modaluser_id)
                                    				$('#showstate').val(modalstate)
                                    				$('#showordertime').val(modalordertime)
                                    				$('#showarrivetime').val(modalarrivetime)
                                    				$('#showshoes_id').val(modalshoes_id)
                                    				$('#showprice').val(modalprice)
                                    				$('#showsize').val(modalsize)
                                    				$('#shownum').val(modalnum)
                                    				})
                                    			
                                    			</script>
                                            </form>
                                        </div>
                                    </div> 
                                </div>
                                <!-- /.modal-content -->
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
            </div>
            <!-- 修改密码 -->
            <div role="tabpanel" class="tab-pane" id="chan">
                <div class="check-div">
                </div>
                <div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
                    <form class="form-horizontal" action="/hello/shop/admin/updatepwd" method="post">
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-4 control-label">原密码</label>
                            <div class="col-xs-5">
                                <input type="password" name="oldpwd" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-4 control-label" >新密码</label>
                            <div class="col-xs-5">
                                <input type="password" name="newpwd" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-4 control-label" >重复密码</label>
                            <div class="col-xs-5">
                                <input type="password" name="checkpwd" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                            </div>
                        </div>
                        <div class="form-group text-right">
                            <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                                <button type="reset" class="btn btn-xs btn-white">取消</button>
                                <button type="submit" class="btn btn-xs btn-green">保存</button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
            
        </div>
    </div>
</div>

<script src="../../themes/backstage/js/jquery.nouislider.js"></script>

<!-- this page specific inline scripts -->
<script>
                                                //min/max slider
                                                function huadong(my, unit, def, max) {
                                                    $(my).noUiSlider({
                                                        range: [0, max],
                                                        start: [def],
                                                        handles: 1,
                                                        connect: 'upper',
                                                        slide: function() {
                                                            var val = Math.floor($(this).val());
                                                            $(this).find(".noUi-handle").text(
                                                                    val + unit
                                                                    );
                                                            console.log($(this).find(".noUi-handle").parent().parent().html());
                                                        },
                                                        set: function() {
                                                            var val = Math.floor($(this).val());
                                                            $(this).find(".noUi-handle").text(
                                                                    val + unit
                                                                    );
                                                        }
                                                    });
                                                    $(my).val(def, true);
                                                }
                                                huadong('.slider-minmax1', "分钟", "5", 30);
                                                huadong('.slider-minmax2', "分钟", "6", 15);
                                                huadong('.slider-minmax3', "分钟", "10", 60);
                                                huadong('.slider-minmax4', "次", "2", 10);
                                                huadong('.slider-minmax5', "天", "3", 7);
                                                huadong('.slider-minmax6', "天", "8", 10);
</script>
</body>

</html>