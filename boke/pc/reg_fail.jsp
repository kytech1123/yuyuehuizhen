<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width">

<title>首页</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link rel="stylesheet" type="text/css" href="css/thickbox.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />

<!-- jquery 2021.9.2 -->
<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<script src="js/nag/back.js"></script>



<style type="text/css">
body {
	font: 30px "宋体";
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

a {
	color: #000;
/* 	text-decoration: none; */
}

a:hover {
	color: #F30;
	text-decoration: underline;
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
/* 	width: 80%; */
/* 	height: 40px; */
	line-height: 25px;
	color: #F60;
	font-weight: 700;
	background-color: #6b6;
	text-align: center;
	margin: 0px auto;
	padding: 25px;
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
<script>
</script>

<br>
<div id="login">
			<div id='title'>
<!-- 				请填写注册信息，若已有账号请<a href="login_init.do"> 点击登录 </a>。 -->
					<a href="${ctx }/pc/index.jsp">回到首页</a>
			</div>

		
			<div class="bfont" style="width:98%;margin:0px auto;text-align:center;">
				<h3>&nbsp;${loginDB}&nbsp; </h3>
			</div>
			<br>
			<br>
			<br>
			

		</div>
</body>
</html>
