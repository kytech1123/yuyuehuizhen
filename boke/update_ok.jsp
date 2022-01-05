<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>操作结果</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link rel="stylesheet" type="text/css" href="css/thickbox.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />

<!-- jquery 2021.9.2 -->
<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<script type="text/javascript">
</script>

<style type="text/css">
body {
	font: 68px "宋体";
}
table tr td {
	height:60px;
	font-size: 30px;
}
.bfont,input {
	margin-top: 11px;
	font-size: 30px;
}
.uilabel {
	margin-top: 11px;
	font-size: 18px;
}



.txtbox {
	border: 1px solid #E79F50;
	height: 20px;
	line-height: 22px;
	width: 120px;
}

#login {
/* 	width: 400px; */
 	height: 280px; 
	overflow: hidden;
	margin: 0px auto;
	border: solid 1px;
}

#title {
	width: 400px;
	height: 25px;
	line-height: 25px;
	color: #F60;
	font-weight: 700;
	background-color: #FDEBD9;
	text-align: center;
	margin: 0px auto;
}

#bottom {
	width: 101px;
	height: 34px;
	background: url(images/register.png);
	clear:both;
	line-height: 25px;
	margin-right: 20px;
}

.warning {
	color: #FF0000;
	font: 12px "宋体";
}

#loginbox {
	width: 330px;
	height: 130px;
	margin: 10px 20px;
	float: left;
	display: inline;
}

.face {
	margin: 6px;
	height: 50px;
	width: 50px;
	cursor: pointer;
	border: 1px solid;
}
</style>

</head>
<body>
<%@ include file="nagback.jsp" %>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<div id="login">
			<div id="title">
<!-- 				请填写注册信息，若已有账号请<a href="login_init.do"> 点击登录 </a>。 -->
			</div>

		
			<div class="bfont" style="width:98%;margin:0px auto;text-align:center;">
				操作成功
			</div>
			&nbsp;
			&nbsp;
			<h2>修改个人信息后，请点击<a href="login.jsp">重新登录</a></h2>
			<br>

		</div>
</body>
</html>
