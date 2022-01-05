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

<link href="css/index.css" type="text/css" rel="stylesheet">

<link href="${ctx}/css/bottom_navig.css" type="text/css" rel="stylesheet">

<!-- jquery 2021.9.2 -->
<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 2021.11.24 导航-->
<script src="${ctx}/js/jsconfig.js"></script>
<script src="${ctx}/js/nag/back.js"></script>
<script src="${ctx}/js/nag/session_his.js"></script>

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

// 		if (u.value.length <= 0) {
// 			u.focus();
// 			m1.style.display = "block";
// 			return false;
// 		}

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

// 		if (v.value.length <= 0) {
// 			v.focus();
// 			m4.style.display = "inline-block";
// 			return false;
// 		}
		document.forms[0].submit();
	}
	
	function checkSubmitTest()
	{
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
	font: 18px "宋体";
/* 	margin-top: 80px; */
}
table tr td {
	height:60px;
	font-size: 30px;
}
.bfont,input {
	margin-top: 11px;
	font-size: 18px;
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
 	height: 1580px; 
	overflow: hidden;
	margin: 0px auto;
	border: solid 1px;
}

#title {
	width: 100%;
	height: 20px;
	line-height: 25px;
	color: #F60;
	font-weight: 700;
	background-color: #6b6;
	text-align: center;
	margin: 0px auto;
}

/* 注册按钮，按钮图片 */
#bottom {
	width: 101px;
	height: 34px;
	background: #6b6;
	color: #fff;
	clear:both;
	line-height: 25px;
	margin-right: 20px;
	font-size: 18px;
	text-align: center;
}

.warning {
	color: #FF0000;
	font: 16px "宋体";
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

<%@ include file="../nag.jsp" %>
<script type="text/javascript">
	var backurl= findHisAjax(ctx,setBack);
	console.log(' --- '+ backurl);
</script>
<br> <br> <br>

<form action="reg_updatepwOK.do" method="get">
<div id="login">
			<div id="title">
<!-- 				请填写注册信息，若已有账号请<a href="login_init.do"> 点击登录 </a>。 -->
			</div>

		
			<div style="width:98%;margin:0px auto;">
				<table id="loginbox"  >
				
					<tr >
						<td class="bfont">登录账号：</td>
						<td >
						
						<input type="text"	name="sysuser.loginName" id="sysuser.loginName"
						value=${item_data.loginName}  />
						<br>
						<span class="warning" id="userNameEmpty"
							style="display: none">用户名为空！</span>
							<label id="userNameExist"
							class="warning" style="display: inline-block;">
							</label>
						</td>
					</tr>
					
					 
					
					<tr>
		<td><span class="uilable"></span></td>
		<td>
		<input type="text"  name="sysuser.id" value=${item_data.id}			></td> </tr>
		
		
		<tr><td><span class="uilable"></span></td><td>
			<input type="text"  name="sysuser.name" value=${item_data.name}  ></tr>
		
		<tr  >
						<td class="bfont">新密码：</td>
						<td>
						<input type="password" id='password'  name="sysuser.password" value=${item_data.password}			>
						</td>
					</tr>

		<tr  >
						<td class="bfont">再次输入密码：</td>
						<td>
						<input type="password" id='password2' name="pw2" value=${item_data.password}			>
							<span class="warning" id="passwordEmpty"
							style="display: none">密码为空</span>
							<span class="warning" id="password2Error"
							style="display: none">两次密码输入不一致</span>
							<span class="warning" id="codeEmpty"
							style="display: none"></span>
							<span class="warning" id="codeError"
							style="display: none"></span>
						</td>
					</tr>
					
					
					<tr>
					<td></td>
					<td>
			&nbsp;<div id="bottom" onclick="checkSubmit()" style="cursor:hand">提&nbsp;交</div>
					</td>
					</tr>
				</table>
			</div>
			<br>
			<br>
			<br>
			

		</div>
</form>
<script type="text/javascript">
 $(function () {
	 var item_label="用户编号,真实姓名,用户类型,医院名称,科室名称,职称,擅长领域,简历,"
	 			+"email,电话,手机,微信,照片,二维码";
		
	 var item_ar=$('.datalist_item div');
	 
	 console.log(item_ar);
	 
	 
	 var usertype=$('#usertype').val();
	 if( usertype == 'assistant' )
		 item_label="用户编号,真实姓名,用户类型,单位名称,部门名称,职位,专业特长,简历,"
	 			+"email,电话,手机,微信,照片,二维码";
	 
	 var i=0;
	 var item_label_ar = item_label.split(",");
	 // 修改UI文字
	 i=0;
	 $(".uilable").text(function(i,origText){
		 	console.log("text"+i);
	        return  item_label_ar[i]+":" ; 
	        i++;
	    });
	 $('.uilable').each(function(){
	        //$(this).css("width",item_css_w_ar[i]+"px");
	        $(this).css("font-size", "18px");
	    });
	 
	 // css output
	 console.log( $('body').css('padding') );
	 console.log( $('body').css('margin') );
	 $('body').css('margin','0px');
 });
</script>
</body>
</html>
