<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="edu.ahpu.boke.domain.SysUser" %>
<%@ page import="edu.ahpu.boke.util.*" %>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>操作成功</title>
<script language="javascript" type="text/javascript">
	var second;

	function go() {
		if (navigator.appName.indexOf("Explorer") > -1) {
			second = document.getElementById("totalSecond").innerText;
		} else {
			second = document.getElementById("totalSecond").textContent;
		}
		setInterval("redirect()", 1000);
	}

	function redirect() {
		if (second <= 0) {
			location.href = "404info.jsp";
		} else {
			if (navigator.appName.indexOf("Explorer") > -1) {
				document.getElementById("totalSecond").innerText = --second;
			} else {
				document.getElementById("totalSecond").textContent = --second;
			}
		}
	}
</script>
<style>
/*  top */
.top_nag{
	width:100%;
	height:60px;
	background-color: #71bd71;
	position: fixed;
	}
.top_p1{
	float:left;
}
.top_p2{
	float:right;
}
.top_p1 a img, .top_p2 a img{
		height:60px;

	}
</style>
</head>

<!-- <body onload="go();"> -->
<body>
<!-- top导航 -->
<div class="top_nag">
	<div class="top_p1">
		<a href="index.jsp">
		<img src="images/top/back.png">
		</a>
	</div>
	<div class="top_p2">
	<a href="index.jsp">
	<img src="images/top/set.png">
	</a>
	</div>
</div>
<!-- top导航 fixed, 加换行 -->
<br>
<br>
<br>
<br>
<br>

	&nbsp;<h4>系统信息：</h4>
	<h3>&nbsp;${act_ok_info}&nbsp; 
	<a href="${ctx}/${act_ok_href}">${act_ok_text}</a>
	</h3>
<%-- 	<a href="${ctx}/meet_findoneManage.do?id=${id}">返回会诊</a> --%>
</body>
</html>

