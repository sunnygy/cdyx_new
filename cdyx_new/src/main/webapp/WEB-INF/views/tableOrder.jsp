<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>餐厅管理-菜单</title>
        <meta name="description" content="">
        <meta name="author" content="Administrator">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
        <meta name="format-detection" content="telephone=no">

        <link href="<%=root%>/web/css/bootstrap-select.css" rel="stylesheet"/>
        <link href="<%=root%>/web/css/menuselect.css" rel="stylesheet" />

        <script src="<%=root%>/web/js/bootstrap-select.js" type="text/javascript"></script>
        <script src="<%=root%>/web/js/function.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function(){



                $("#menuSelected").change(function(){

                    var selectedValue=$(this).find("option:selected").val();

                    $(".momule_list").each(function(i,n){

                        if(selectedValue==$(n).attr("value")){


                            $(n).css("display","block");

                        }else{

                            $(n).css("display","none");
                        }

                    });

                });







            })

        </script>

    </head>
<body>
    <div class="wrapper">
        <jsp:include page="/WEB-INF/views/common/navigate.jsp"/>
        <div class="page-wrapper">
            <div class="boxcon">
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
                            <i class="icon-circle"></i> 欢迎回来圆宝的爱
                        </div>
                    </div>
                <div class="webg clearfix">
                    <div class="momule_box">
                            <div class="momule_search">
                                <i>分类：</i>
                                <select id="menuSelected" class="form-control selectpicker">
                                    <c:forEach items="${menuParents}" var="parents" varStatus="status">
                                        <option value="${parents.id}" <c:if test="${status.index==0}">selected="selected"</c:if>>${parents.enName}/${parents.cnName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <c:forEach items="${menuParents}" var="parents" varStatus="statusParent">

                               <ul value="${parents.id}" class="momule_list" <c:if test="${statusParent.index!=0}">style="display:none" </c:if>>

                                   <c:forEach items="${menus}" var="menu" >

                                        <c:if test="${parents.id==menu.parentType.id}">

                                           <li>
                                               <strong>
                                                   <i>${menu.cnName}(${menu.enName})</i>
                                               </strong>
                                               <span>${menu.code}</span>
                                               <input type="hidden" class="menuId" value="${menu.id}">
                                               <input type="hidden" class="menuPrice" value="${menu.price}">
                                           </li>

                                        </c:if>

                                   </c:forEach>


                               </ul>

                            </c:forEach>
                    </div>

                    <div class="momule_content">
                        <div class="allemncontent">
                            <div class="allmenu">
                                餐单MENU
                                <i></i>
                            </div>
                            <div class="momule_now pull-left">
                                当前桌号<span>${tableId}</span>
                            </div>
                            <div class="momule_sele pull-left mat12">
                                <div class="momule_selesingle">
                                    <i>人数:</i>
                                    <input type="" name="" class="form-control controlA" value="2" id="mnum">
                                </div>
                                <div class="momule_selesingle">
                                    <i>客人:</i>
                                    <select class="form-control form-controlA selectpicker">
                                        <option>E</option>
                                        <option>C</option>
                                    </select>
                                    <!-- <span class="trangle"></span> -->
                                </div>
                                <div class="momule_selesingle" id="mselectf">
                                    <i>种类:</i>
                                    <select id="orderTypeSelected" class="form-control form-controlA selectpicker">
                                        <c:forEach items="${orderTypes}" var="orderType">
                                            <option value="${orderType.id}">${orderType.typeName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="momule_selesingle" style="margin-right: 0">
                                    <i>辣度:</i>
                                    <select class="form-control form-controlA selectpicker">
                                        <option>微辣</option>
                                        <option>中辣</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="momule_sele clearfix">
                                <div class="momule_selesingle" id="ttnum">
                                    <i>菜号:</i>
                                    <input id="menuCode" class="form-control form-controlB controlA" value="">
                                </div>
                                <div class="momule_selesingle">
                                    <i>份数:</i>
                                    <input id="menuNum" type="" name="" class="form-control form-controlB controlA" value="1">
                                </div>
                                <div id="choosed" class="hselect pull-left">
                                    <span class="pull-left">已选菜</span>
                                </div>
                            </div>

                            <div class="line"></div>
                            <div class="motbn clearfix">
                                <button class="btn btn-danger btn-cance" type="button">取消</button>
                                <button class="btn btn-danger btn-sure" type="button">确定</button>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div id="allmenu" class="allmenu allmenusd" style="cursor:pointer">
                            成都印象 ChengDuYinXiang
                            <i></i>
                        </div>
                        <div class="toptable">
                            <%--<c:set var="now" value="<%=new java.util.Date()%>" />--%>
                            <span>桌号/Table:<i>${tableId}</i></span>
                           <%-- <span>时间/Time: <i><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${now}" /></i></span>--%>
                            <span>人数/People:<i id="billPeopleNum">2</i></span>
                            <span>类型/Type:<i></i></span>
                        </div>
                        <table class="table tablescrol">
                            <thead>
                            <tr>
                                <th>Menu</th>
                                <th>Name</th>
                                <th>Quantity</th>
                                <th>Charge</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <tbody id="tshowtmenu" style="overflow: scroll;">

                            </tbody>
                        </table>
                        <div class="momutotal clearfix">
                            <span class="pull-left">共计Total：</span>
                            <span class="pull-right">$6.50</span>
                        </div>
                        <div class="munolsbtn clearfix">
                            <button class="btn" id="checkout">CHECK OUT</button>
                            <button class="btn">PRINT</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
