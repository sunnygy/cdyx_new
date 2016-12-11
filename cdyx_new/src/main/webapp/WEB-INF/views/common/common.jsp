<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%
	String root = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>

<lnk href="<%=root%>/web/css/ionicons.min.css" rel="stylesheet" />
<link href="<%=root%>/web/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=root%>/web/css/base.css"  rel="stylesheet" >
<link href="<%=root%>/web/css/styletable.css" rel="stylesheet" />

<script src="<%=root%>/web/js/lib/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="<%=root%>/web/js/lib/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=root%>/web/js/talk.js" type="text/javascript"></script>
<script type="text/javascript">
	<!--定义js引用的root-->
	var root = "<%=root%>"
</script>	 