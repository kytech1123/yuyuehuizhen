<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
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
</head>

<!-- <body onload="go();"> -->
<body>
<br>
	<h3>&nbsp;操作成功&nbsp; <a href="${ctx}/meet_findoneManage.do?id=${AppointmentId}">返回会诊</a>
	</h3>
<%-- 	<a href="${ctx}/meet_findoneManage.do?id=${id}">返回会诊</a> --%>
</body>
</html>

