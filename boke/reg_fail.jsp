<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>注册</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link rel="stylesheet" type="text/css" href="css/thickbox.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />

<!-- jquery 2021.9.2 -->
<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<script src="js/nag/back.js"></script>

<script type="text/javascript">
	function changeVerificationCode() {
		var verificationCodeImage = document
				.getElementById("verificationCodeImage");
		verificationCodeImage.src = "verification_code.do?random="
				+ new Date().getTime();
	}

	function hideError() {
		document.getElementById("userNameEmpty").style.display = "none";
		document.getElementById("userNameExist").style.display = "none";
		document.getElementById("passwordEmpty").style.display = "none";
		document.getElementById("password2Error").style.display = "none";
		document.getElementById("codeEmpty").style.display = "none";
		document.getElementById("codeError").style.display = "none";
	}

	function checkSubmit() {
		hideError();

		var m1 = document.getElementById("userNameEmpty");
		var m2 = document.getElementById("passwordEmpty");
		var m3 = document.getElementById("password2Error");
		var m4 = document.getElementById("codeEmpty");

		var u = document.getElementById("userName");
		var p = document.getElementById("password");
		var p2 = document.getElementById("password2");
		var v = document.getElementById("verificationCode");

		if (u.value.length <= 0) {
			u.focus();
			m1.style.display = "block";
			return false;
		}

		if (p.value.length <= 0) {
			p.focus();
			m2.style.display = "block";
			return false;
		}

		if (p.value != p2.value) {
			p2.focus();
			m3.style.display = "block";
			return false;
		}

		if (v.value.length <= 0) {
			v.focus();
			m4.style.display = "inline-block";
			return false;
		}
		document.forms[0].submit();
	}

	function showFaceBox() {
		var box = document.getElementById("faceBox");
		var myFace = document.getElementById("myFace");
		if (box.style.display == "none") {
			box.style.display = "block";
			myFace.title = "隐藏可选头像";
		} else {
			box.style.display = "none";
			myFace.title = "显示可选头像";
		}
	}
	
	function changeFace(facePic, faceId) {
		document.getElementById("myFace").src = "images/face/"+facePic;
		document.getElementById("faceId").value=faceId;
		document.getElementById("faceBox").style.display = "none";
	}
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

a {
	color: #000;
	text-decoration: none;
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
<script>
	setBack('register.jsp');
</script>

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
				<h3>&nbsp;${loginDB}&nbsp; </h3>
			</div>
			<br>
			<br>
			<br>
			

		</div>
</body>
</html>
