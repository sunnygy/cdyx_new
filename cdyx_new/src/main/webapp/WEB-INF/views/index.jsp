<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>餐厅管理-登录</title>
    <meta name="description" content="">
    <meta name="author" content="Administrator">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no">   
    <link href="<%=root%>/web/css/login.css" rel="stylesheet" />   
   <!--  <script type="text/javascript">
        $(function(){
            function login(){
            	console.debug(aaaaaaaaaaaaa);
                var userName=$("#userName").val();
                var password=$("#password").val();
                location.href=root+"/login/userlogin.htm?name="+userName+"&password="+password;
            }
        })
    </script> -->
</head>

<body class="loginbg">
<div class="clearfix">
    <div class="loginlogo pull-left">
        <img src="<%=root%>/web/img/loginlogo.png" />
    </div>
    <div class="language pull-right">
        <i class="active">中文</i>
        <i>English</i>
    </div>
</div>
<div class="login_container">
    <img src="<%=root%>/web/img/loginname.png" />
    <div class="loginlate">
        <i></i>Restaurant Management System<i></i>
    </div>
    <form role="form" action="<%=root%>/login/userlogin.htm"  class="login_box">
        <div class="form-group">
            <input type="text" name="name" class="form-input"  placeholder="请输入用户名">
            <i class="icon ion-ios-checkmark-outline"></i>
        </div>
        <div class="form-group">
            <input type="password" name="password" class="form-input"  placeholder="请输入密码">
            <i class="icon ion-ios-close-outline"></i>
        </div>
        <div class="checkbox clearfix">
            <label class="pull-left">
                <input type="checkbox">记住密码
            </label>
            <a href="">忘记密码</a>
        </div>
        <button type="submit" class="btn btn-warning">登录</button>
    </form>
   <!-- <span class="lginbott">还没有注册？<a href="#">点击我要注册</a></span>-->
    <div class="sidefooter">
        copyright©成都印象餐饮系统2015-2016
    </div>
</div>
</body>

</html>

