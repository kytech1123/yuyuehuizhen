<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>找不到页面</title>
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
			location.href = "admin/top.jsp";
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

<body >
	<h3>
		点击返回<a href='index.jsp'> 首页</a>
	</h3>
	群爱软件开发部 
	
<!-- 	D:\jspwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\boke\ -->



	
	<% //request.getRealPath("/") %>
</body>
</html>

