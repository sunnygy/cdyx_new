<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>餐厅管理系统</title>
    <meta name="description" content="">
    <meta name="author" content="Administrator">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no">   
    <link rel="stylesheet" type="text/css" href="<%=root%>/web/css/bootstrap-datetimepicker.min.css">    
	<script type="text/javascript" src="<%=root%>/web/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="<%=root%>/web/js/sort.js"></script>
    <script type="text/javascript" src="<%=root%>/web/js/jquery.tablesort.js"></script>
    <script type="text/javascript">
    $(function() {
        $(".table-responsive").height($(window).height() - 256);
        $("#starttime").datetimepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,
            minView: 2
        });
        $("#endtime").datetimepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,
            minView: 2
        });
        $('.table').tablesort().data('tablesort');

        $('thead th.number').data('sortBy', function(th, td, sorter) {
            return parseInt(td.text(), 10);
        });

    });
    </script>
</head>

<body>
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
                <div class="allmenu">
                    历史餐单All menus
                    <i></i>
                </div>
                <div class="mrl_30">
                    <!-- Nav tabs -->
                    <div class="menu_time">
                        <div class="menu_timefl">
                            <i class="iconall icontime"></i>
                            <div class="input-append input-sm">
                                <span>开始日期:</span>
                                <input size="16" type="text" value="2016-09-20" class="form-control " id="starttime" />
                                <i class="icon ion-arrow-down-b"></i>
                            </div>
                        </div>
                        <span class="line"></span>
                        <div class="menu_timefl">
                            <i class="iconall icontime"></i>
                            <div class="input-append input-sm">
                                <span>结束日期:</span>
                                <input size="16" type="text" value="2016-09-20" class="form-control " id="endtime" />
                                <i class="icon ion-arrow-down-b"></i>
                            </div>
                        </div>
                    </div>  
                    <ul class="nav nav-tabs">
                       <!--  <li role="presentation"><a href="#profile" role="tab" data-toggle="tab">已结账Checked</a></li>
                        <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab">未结账Unchecked</a></li> -->
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
                                            <th class="no-sort">备注</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${orders}" var="order" varStatus="status">                                    	
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
	                                            <td>${order.description}</td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                               
                            </div>
                            <nav class="tac">
                                <ul class="pagination">
                                    <li><a href="">第一页</a></li>
                                    <li><a href="">上一页</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="">2</a></li>
                                    <li><a href="">3</a></li>
                                    <li><a href="">下一页</a></li>
                                    <li><a href="">最后一页</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 
</body>
</html>