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
    <link rel="stylesheet" href="<%=root%>/web/css/bootstrap-datetimepicker.min.css">    
	<link rel="stylesheet" href="<%=root%>/web/css/pagination.css" />
	<script type="text/javascript" src="<%=root%>/web/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="<%=root%>/web/js/sort.js"></script> 
    <script type="text/javascript" src="<%=root%>/web/js/dateFormat.js"></script>   
    <script type="text/javascript" src="<%=root%>/web/js/jquery.pagination.js"></script>
    <script type="text/javascript">
    $(function() {
        $(".table-responsive").height($(window).height() - 350);        
        $("#starttime").val(GetDateStr(-1));        
        $("#starttime").datetimepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,         
            minView: 2
        });        
        $("#endtime").val(GetDateStr(0));        
        $("#endtime").datetimepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            todayBtn: true,           
            minView: 2
        }).on("changeDate",function(ev){
        
        	var beginDate=$("#starttime").val();
        	var endDate=$("#endtime").val();        	
        	getOrderDataAndShow(1,beginDate,endDate,true);      	
        	
        });
        $('.table').tablesort().data('tablesort');

        $('thead th.number').data('sortBy', function(th, td, sorter) {
            return parseInt(td.text(), 10);
        });
        
        //==============================分页==============================================================================        
        $("#Pagination").pagination($("#allpage").text(),{
	        	items_per_page:$("#pageSize").val(),
	            callback:pageselectCallback       	
        	}        
        );
        
        
        function getOrderDataAndShow(currentPage,beginDate,endDate,isdate){
        	
        	var data={"cuurentPage":currentPage,"beginDate":beginDate,"endDate":endDate};
            $.ajax({ 
                type: "post", 
                dataType: "json", 
                contentType:"application/json",
                url: root+"/order/getOrderPage.json", //请求的url                
                data: JSON.stringify(data), 
                success: function (data) { 
                	//处理正确结果         	
                	$("tbody tr").remove();
                	var orders=data.results;                	
                	var tableIndex=0; 
                	var appendStr='';
                	for(var i=0;i<orders.length;i++){                	
                		 tableIndex=i+1;   
                		 appendStr+='<tr>'+
				                    '<td><i class="tabl_colume">'+tableIndex+'</i></td>'+
				                    '<td>'+orders[i].code+'</td>'+
				                    '<td>'+orders[i].table.code+'</td>'+
				                    '<td>'+getSmpFormatDateByLong(orders[i].createTimer,true)+'</td>'+
				                    '<td>'+orders[i].peopleNum+'</td>'+
				                    '<td>'+orders[i].peopleType+'</td>'+
				                    '<td>'+orders[i].orderType.typeName+'</td>'+
				                    '<td>'+orders[i].totalPrice+'</td>'+        		                  
				                    '<td>'+orders[i].discount+'%</td>'+
				                    '<td>'+orders[i].description+'</td>'+
								'</tr>'                 		       		
                		
                	} 
               		$("tbody").append(appendStr);
               		if(isdate){
	               		 $("#Pagination").pagination(data.totalCount,{
		         	        	items_per_page:data.pageSize,
		         	        	current_page:0,
		         	            callback:pageselectCallback       	
		                 	}        
	                 	);
	               		$("#allpage").text(data.totalCount);
	               		$("#totalpage").text(data.pageCount);
               			
               		}
               		       		
               		
                	 
                } 
            });
        	
        	
        	
        }        
        
        function pageselectCallback(page) {         	
        	var currentPage=parseInt(page)+1;
        	var beginDate=$("#starttime").val();
        	var endDate=$("#endtime").val();        	
        	getOrderDataAndShow(currentPage,beginDate,endDate,false);
        	
        }
        
        

        function GetDateStr(AddDayCount) { 
        	var dd = new Date(); 
        	dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期 
        	var y = dd.getFullYear(); 
        	var m = dd.getMonth()+1;//获取当前月份的日期 
        	if (m >= 1 && m <= 9) {
                m = "0" + m;
            }
        	var d = dd.getDate();
        	 if (d >= 0 && d <= 9) {
                 d = "0" + d;
             }
        	return y+"-"+m+"-"+d; 
        }       

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
                    所有餐单All menus
                    <i></i>
                </div>
                <div class="mrl_30">
                    <!-- Nav tabs -->
                    <div class="menu_time">
                        <div class="menu_timefl">
                            <i class="iconall icontime"></i>
                            <div class="input-append input-sm">
                                <span>开始日期:</span>
                                <input size="12" type="text"  class="form-control " style="width:90%;" id="starttime" />                               
                            </div>
                        </div>
                        <span class="line"></span>
                        <div class="menu_timefl">
                            <i class="iconall icontime"></i>
                            <div class="input-append input-sm">
                                <span>结束日期:</span>
                                <input size="16" type="text"  class="form-control " style="width:90%;" id="endtime" />                                
                            </div>
                        </div>
                    </div>
                    <ul class="nav nav-tabs" role="tablist">
                     <!--    <li role="presentation"><a href="#profile" role="tab" data-toggle="tab">已结账Checked</a></li>
                        <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab">未结账Unchecked</a></li> -->
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <div class="table-responsive scroelisttable">
                                <table class="table table-striped table-hover" id="table">
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
                                       <c:forEach items="${result.results}" var="order" varStatus="status">                                    	
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
							<div class="pages">
								<div id="Pagination"></div>
								<div class="searchPage" style="margin-top: 12px;">
									<span class="page-sum">共<strong class="allPage" id="totalpage">${result.pageCount}</strong>页</span> 
									<span class="page-go">total:<strong class="allPage" id="allpage">${result.totalCount}</strong></span>
									<input type="hidden" id="pageSize" value="${result.pageSize}"/>
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