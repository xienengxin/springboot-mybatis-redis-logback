<%@ page language="java" contentType="text/html; charset=utf-8"
	import="com.example.model.*,java.util.*"
    pageEncoding="utf-8"%>
<div class="header">
            <div class="container">
                <div class="header-top">
                    <div class="logo">
                        <a href="/shop/index">N-AIR</a>
                    </div>
                    <div class="login-bars">
                    <%if(session ==null||session.getAttribute("username")==null){%>
						<a class="btn btn-default log-bar" href="/shop/signup">登录</a>
						<a class="btn btn-default log-bar" href="/shop/register">注册</a>
					<%} %>
					<%if(session !=null&&session.getAttribute("username")!=null){%>
						<a class="btn btn-default log-bar" href="/shop/index">${username}</a>
						<a class="btn btn-default log-bar" href="/shop/loginout" >退出</a>
					<%} %>
					
                        <%
                        	int num=0;
                        	float money=0;
                        	List<Cart> cart=(List)session.getAttribute("data");
                        	if(cart==null){
                        		num=0;
                        		money=0;
                        	} else{
                        		for(int i=0;i<cart.size();i++){
                    				num+=cart.get(i).getNum();
                    				money+=cart.get(i).getMoney();
                    			}
                        	} 
                        %>
                        <div class="cart box_1">
                            <a href="/shop/viewcart">
                            <h3>
                                <div class="total">
									<span >￥<%=money %></span>
									(<span><%=num %></span>)
								</div>
							</h3>
                            </a>
                            <p><a href="javascript:;" class="simpleCart_empty">购物车</a></p>
                            <div class="clearfix"> </div>
                        </div>
                   </div>
                    
        <div class="clearfix"></div>
                </div>
                <!---menu-----bar--->
                <div class="header-botom">
                    <div class="content white">
                    <nav class="navbar navbar-default nav-menu" role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="clearfix"></div>
                        <!--/.navbar-header-->

                        <div class="collapse navbar-collapse collapse-pdng" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav nav-font">
                				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                				<li>               
                                    <a href="/shop/product">进入商城</a>
                               </li>
                               <li>&nbsp;&nbsp;&nbsp;</li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">男士<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-2">
                                        <div class="row">
                                            <div class="col-sm-4 menu-img-pad">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="/shop/1">篮球鞋</a></li>
                                                    <li><a href="/shop/2">足球鞋</a></li>
                                                    <li><a href="/shop/3">跑步鞋</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="/shop/4">网球鞋</a></li>
                                                    <li></li>
                                                    <li><a href="/shop/5">休闲鞋</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </ul>
                                </li>
                                <li>&nbsp;&nbsp;&nbsp;</li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">女士<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-2">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="/shop/6">网球鞋</a></li>
                                                    <li><a href="/shop/7">跑步鞋</a></li>
                                                    <li><a href="/shop/8">休闲鞋</a></li>
                                                </ul>
                                            </div>              
                                        </div>
                                    </ul>
                                </li>
                                <div class="clearfix"></div>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <!--/.navbar-collapse-->
                        <div class="clearfix"></div>
                    </nav>
                    <!--/.navbar-->   
                        <div class="clearfix"></div>
                    </div>
                    <!--/.content--->
                </div>
                    <!--header-bottom-->
            </div>
        </div>
