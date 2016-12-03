<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>餐厅管理-点餐</title>
    <meta name="description" content="">
    <meta name="author" content="Administrator">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no">    
    <link href="<%=root%>/web/css/order.css" rel="stylesheet" />    
    <script  type="text/javascript">
    	$(function(){
    		// redefine  window height
    		$(".mrl_30bg").height($(window).height());
    		$(".orderbox").click(function(){
    			var tableNum=$(this).find("p")[0].text();    				
    			
    		});
    		
    	})    
    </script>
    
</head>
<body class="mrl_30bg">
    <div class="wrapper">
    	<jsp:include page="/WEB-INF/views/common/navigate.jsp"/>
    	 <div class="page-wrapper">
            <div class="container-fluid">
                <div class="row-fluid header-magement clearfix">
                    <button class="pull-left" id="buttonright">
                        <i class="glyphicon glyphicon-align-justify fontsize20"></i>
                    </button>
                    <ul class="breadcrumb">
                        <li class="breadname">
                            点餐ORDER <span>|</span>
                        </li>
                        <i class="icon-home"></i>
                        <li class="mr_10">
                            <a href="#">首页</a>
                        </li>
                        <li>
                            <span class="divider">></span>
                            <a href="#">菜单管理</a>
                        </li>
                        <li class="active">
                            <span class="divider">></span> 午餐
                        </li>
                    </ul>
                    <span class="header-time">2016年10月28日 18:17:25</span>
                    <div class="header-login">
                        <i class="icon-circle"></i> 欢迎回来圆宝的爱 - 上次登录 2016/10/22
                    </div>
                </div>
                <ul class="nav nav-tabs ordermenu" role="tablist">
                    <li role="presentation" class="col-md-3 col-sm-6 col-xs-6"><a href="#takeout" role="tab" data-toggle="tab">外卖TAKE-OUT</a></li>
                    <li role="presentation" class="col-md-3 col-sm-6 col-xs-6"><a href="#profile" role="tab" data-toggle="tab">大厅HALL</a></li>
                    <li role="presentation" class="col-md-3 col-sm-6 col-xs-6"><a href="#balcony" role="tab" data-toggle="tab">包厢BALCONY</a></li>
                    <li role="presentation" class="active col-md-3 col-sm-6 col-xs-6"><a href="#home" role="tab" data-toggle="tab">所有ALL</a></li>
                </ul>
                <div class="mrl_30">
                    <!-- Nav tabs -->
                    <!-- Tab panes -->
                    <div class="">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active clearfix" id="home">
								<c:forEach items="${tables}" var="table">
									<div class="col-md-2 col-sm-3 col-xs-4 col-lg-2dot4">
										<div class="orderboxline">
											<div class="orderbox">
												<i></i>
												<p>${table.code}</p>
												<c:if test="${table.orderId!=null}">
														<input type="hidden" id="orderId"
															value="${table.orderId}" />
													</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>


							<div role="tabpanel" class="tab-pane clearfix" id="profile">
								<c:forEach items="${tables}" var="table">
									<c:if test="${table.type==1}">
										<div class="col-md-2 col-sm-3 col-xs-4 col-lg-2dot4">
											<div class="orderboxline">
												<div class="orderbox">
													<i></i>
													<p>${table.code}</p>
													<c:if test="${table.orderId!=null}">
														<input type="hidden" id="orderId"
															value="${table.orderId}" />
													</c:if>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>


							<div role="tabpanel" class="tab-pane clearfix" id="balcony">
								<c:forEach items="${tables}" var="table">
									<c:if test="${table.type==2}">
										<div class="col-md-2 col-sm-3 col-xs-4 col-lg-2dot4">
											<div class="orderboxline">
												<div class="orderbox">
													<i></i>
													<p>${table.code}</p>
													<c:if test="${table.orderId!=null}">
														<input type="hidden" id="orderId"
															value="${table.orderId}" />
													</c:if>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>


							<div role="tabpanel" class="tab-pane clearfix" id="takeout">
								<c:forEach items="${tables}" var="table">
									<c:if test="${table.type==3}">
										<div class="col-md-2 col-sm-3 col-xs-4 col-lg-2dot4">
											<div class="orderboxline">
												<div class="orderbox">
													<i></i>
													<p>${table.code}</p>
													<c:if test="${table.orderId!=null}">
														<input type="hidden" id="orderId"
															value="${table.orderId}" />
													</c:if>
												</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
							</div>


						</div>
					</div>
                </div>
            </div>
        </div>           
    </div>   
</body>
</html>