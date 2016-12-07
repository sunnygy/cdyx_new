<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>餐厅管理-今日餐单</title>
    <meta name="description" content="">
    <meta name="author" content="Administrator">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="<%=root %>/web/js/sort.js"></script>
    <script type="text/javascript" src="<%=root %>/web/js/jquery.tablesort.js"></script>
    <script type="text/javascript">    
    $(function(){
        $(".table-responsive").height($(window).height()-297);
        $('.table').tablesort().data('tablesort');

        $('thead th.number').data('sortBy', function(th, td, sorter) {
            return parseInt(td.text(), 10);
        });
    });
    </script>
</head>

<body>
    <div class="wrapper">
        <div class="sidebar">
            <div class="photoperson">
                <strong>FASHABLE</strong>
                <img src="img/photo.png" />
                <div class="photoperson_le"><i>园宝的爱</i><span></span></div>
            </div>
            <div class="navbar">
                <div class="accordion accordion2" id="accordion-1">
                    <div class="accordion-group accordion-groupa">
                        <div class="accordion-heading" data-toggle="collapse" data-parent="#accordion-1" href="#accordion-element-1">
                            <a class="accordion-toggle collapsed">
                                <i class="iconall iconmenu1"></i>
                                <strong>餐厅管理</strong>
                            </a>
                            <i class="icon ion-ios-arrow-right"></i>
                            <span class="badgecircle color_b"></span>
                        </div>
                        <div id="accordion-element-1" class="accordion-body collapse">
                            <div class="accordion-inner" data-toggle="tab" href="#magemakework">
                                <a href="">今日菜单</a>
                            </div>
                            <div class="accordion-inner" data-toggle="tab" href="#magemakejia">
                                <a href="">历史菜单</a>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="accordion accordion2" id="accordion-2">
                    <div class="accordion-group accordion-groupa">
                        <div class="accordion-heading" data-toggle="collapse" data-parent="#accordion-2" href="#accordion-element-2">
                            <a class="accordion-toggle collapsed">
                                <i class="iconall iconmenu2"></i>
                                <strong>菜品管理</strong>
                            </a>
                            <i class="icon ion-ios-arrow-right"></i>
                            <span class="badgecircle color_b"></span>
                        </div>
                        <div id="accordion-element-2" class="accordion-body collapse">
                            <div class="accordion-inner" data-toggle="tab" href="#magemakework">
                                <a href="">午餐 <i class="icon ion-ios-arrow-left"></i><span class="badge">20</span></a>
                            </div>
                            <div class="accordion-inner" data-toggle="tab" href="#magemakejia">
                                <a href="">晚餐<i class="icon ion-ios-arrow-left"></i></a>
                            </div>
                            <div class="accordion-inner" data-toggle="tab" href="#magemakeout">
                                <a href="">酒水<i class="icon ion-ios-arrow-left"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <h3>清单汇总</h3>
                <div class="accordion accordion2" id="accordion-3">
                    <div class="accordion-group accordion-groupa">
                        <div class="accordion-heading" data-toggle="collapse" data-parent="#accordion-3" href="#accordion-element-3">
                            <a class="accordion-toggle collapsed">
                                <i class="iconall iconmenu3"></i>
                                <strong>看单</strong>
                            </a>
                            <i class="icon ion-ios-arrow-right"></i>
                            <span class="badgecircle color_b"></span>
                        </div>
                        <div id="accordion-element-3" class="accordion-body collapse">
                            <div class="accordion-inner" data-toggle="tab" href="#magemakework">
                                <a href="">午餐 <i class="icon ion-ios-arrow-left"></i><span class="badge">20</span></a>
                            </div>
                            <div class="accordion-inner" data-toggle="tab" href="#magemakejia">
                                <a href="">晚餐<i class="icon ion-ios-arrow-left"></i></a>
                            </div>
                            <div class="accordion-inner" data-toggle="tab" href="#magemakeout">
                                <a href="">酒水<i class="icon ion-ios-arrow-left"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion accordion2" id="accordion-4">
                    <div class="accordion-group accordion-groupa">
                        <div class="accordion-heading" data-toggle="collapse" data-parent="#accordion-4" href="#accordion-element-4">
                            <a class="accordion-toggle collapsed">
                                <i class="iconall iconmenu4"></i>
                                <strong>消费</strong>
                            </a>
                            <i class="icon ion-ios-arrow-right"></i>
                            <span class="badgecircle color_b"></span>
                        </div>
                        <div id="accordion-element-4" class="accordion-body collapse">
                            <div class="accordion-inner" data-toggle="tab" href="#magemakework">
                                <a href="">午餐 <i class="icon ion-ios-arrow-left"></i><span class="badge">20</span></a>
                            </div>
                            <div class="accordion-inner" data-toggle="tab" href="#magemakejia">
                                <a href="">晚餐<i class="icon ion-ios-arrow-left"></i></a>
                            </div>
                            <div class="accordion-inner" data-toggle="tab" href="#magemakeout">
                                <a href="">酒水<i class="icon ion-ios-arrow-left"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                            <a href="#">餐单管理</a>
                        </li>
                        <li class="active">
                            <span class="divider">></span>今日餐单
                        </li>
                    </ul>
                    <span class="header-time">2016年10月28日 18:17:25</span>
                    <div class="header-login">
                        <i class="icon-circle"></i> 欢迎回来圆宝的爱 - 上次登录 2016/10/22
                    </div>
                </div>
                <div class="allmenu">
                    今日餐单Today's menu
                    <i></i>
                </div>
                <div class="mrl_30">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs magementtoday" role="tablist">
                        <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab">未结账Unchecked</a></li>
                        <li role="presentation"><a href="#profile" role="tab" data-toggle="tab">已结账Checked</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div class="table-responsive scroelisttable">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th class="no-sort">序号</th>
                                            <th class="no-sort">餐单号</th>
                                            <th class="no-sort">桌号</th>
                                            <th>时间</th>
                                            <th class="no-sort">人数</th>
                                            <th class="no-sort">国别</th>
                                            <th class="no-sort">就餐种类</th>
                                            <th class="no-sort">餐费</th>
                                            <th class="number">折扣</th>
                                            <th class="no-sort">状态</th>
                                            <th class="no-sort">备注</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                     <c:if test="${orders!=null}">
	                                    		<c:forEach items="${orders.processOrders}" var="order" varStatus="status">
			                                        <tr>
													<td><i class="tabl_colume">${status.index+1}</i></td>
													<td>${order.code}</td>
													<td>${order.table.code}</td>
													<td><fmt:formatDate value="${order.createTimer}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
													<td>${order.peopleNum}</td>
													<td>${order.peopleType}</td>
													<td>${order.orderType.typeName}</td>
													<td>$${order.totalPrice}</td>
													<td>${order.discount}%</td>
													<td>未结算</td>
													<td>${order.description}</td>
												</tr>
		                                        </c:forEach>
	                                    </c:if>                                                                                                              
                                    </tbody>
                                </table>
                            </div>                           
                            <div class="showmany">
                                <strong>未结算金额 :<span>${orders.processBill}</span></strong>
                                <strong class="showmany_2">总金额共计Total:<span>${orders.finishedBill}</span></strong>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile">
                            <div class="table-responsive scroelisttable">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th class="no-sort">序号</th>
                                            <th class="no-sort">餐单号</th>
                                            <th class="no-sort">桌号</th>
                                            <th>时间</th>
                                            <th class="no-sort">人数</th>
                                            <th class="no-sort">国别</th>
                                            <th class="no-sort">就餐种类</th>
                                            <th class="no-sort">餐费</th>
                                            <th class="number">折扣</th>
                                            <th class="no-sort">状态</th>
                                            <th class="no-sort">备注</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${orders!=null}">
	                                    		<c:forEach items="${orders.finishedOrders}" var="order" varStatus="status">
			                                        <tr>
														<td><i class="tabl_colume">${status.index+1}</i></td>
														<td>${order.code}</td>
														<td>${order.table.code}</td>
														<td><fmt:formatDate value="${order.createTimer}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
														<td>${order.peopleNum}</td>
														<td>${order.peopleType}</td>
														<td>${order.orderType.typeName}</td>
														<td>$${order.totalPrice}</td>
														<td>${order.discount}%</td>
														<td>已结算</td>
													<td>${order.description}</td>
													</tr>
		                                        </c:forEach>
	                                    </c:if>                                  
                                    </tbody>
                                </table>
                            </div>                          
                            <div class="showmany">
                                <strong>未结算金额 :<span>${orders.processBill}</span></strong>
                                <strong class="showmany_2">总金额共计Total:<span>${orders.finishedBill}</span></strong>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>   
</body>
