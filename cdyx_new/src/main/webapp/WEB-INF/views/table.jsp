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
    <link href="<%=root%>/web/css/styletable.css" rel="stylesheet" />
    <link href="<%=root%>/web/css/order.css" rel="stylesheet" />  
    <script src="<%=root%>/web/js/talk.js" type="text/javascript"></script>
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
            <div class="row-fluid header-magement clearfix" style="background-color: rgb(246, 244, 236);">
                    <button class="pull-left" id="buttonright">
                        <i class="glyphicon glyphicon-align-justify fontsize20" style="background-color: rgb(246, 244, 236);"></i>
                    </button>
                    <ul class="breadcrumb" style="background-color: rgb(246, 244, 236);">
                        <li class="breadname">
                            点餐ORDER <span>|</span>
                        </li>
                        <i class="icon-home"></i>
                        <li class="mr_10">
                            <a href="#">首页</a>
                        </li>
                        <li>
                            <span class="divider">&gt;</span>
                            <a href="#">菜单管理</a>
                        </li>
                        <li class="active">
                            <span class="divider">&gt;</span> 午餐
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
                            <c:out value="${request.getContextPath()}"></c:out>
                            	<c:forEach items="${tables}" var="table" >
	                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
	                                    <div class="orderboxline">
	                                        <div class="orderbox">
	                                            <h3>Table number</h3>
	                                            <i></i>
	                                            <p>${table.code}</p>
	                                            <input type="hidden" id="orderId" name="orderId" value="${table.order.id}"/>
	                                            <span>桌号</span>
	                                        </div>
	                                    </div>
	                                </div>
	                           </c:forEach>
                            </div>
                            <div role="tabpanel" class="tab-pane clearfix" id="profile">
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>01</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>02</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>03</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>04</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>05</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>06</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>07</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>08</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane clearfix" id="balcony">
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>01</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>02</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>03</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div role="tabpanel" class="tab-pane clearfix" id="takeout">
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>01</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>02</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>03</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>04</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>05</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>06</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>07</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 col-xs-6 col-lg-2dot4">
                                    <div class="orderboxline">
                                        <div class="orderbox">
                                            <h3>Table number</h3>
                                            <i></i>
                                            <p>08</p>
                                            <span>桌号</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </div>   
</body>
</html>