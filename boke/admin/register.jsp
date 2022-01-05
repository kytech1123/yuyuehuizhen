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
<link href="css/reg_form.css" type="text/css" rel="stylesheet">

<!-- jquery 2021.9.2 -->
<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
<script src="js/reg/regform.js"></script>


<style type="text/css">
body {
	font: 18px "宋体";
/* 	margin-top: 80px; */
}
table tr td {
	height:60px;
	font-size: 30px;
}
.bfont {
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

/* 登录区域 */
#login {
/* 	width: 400px; */
 	height: 500px; 
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
	background: url(images/register.png);
	clear:both;
	line-height: 25px;
	margin-right: 20px;
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
input {
	padding-left: 5px;
	font-size: 18px;
}

.spanUserType {
	font-size: 20px;
	position: relative;
	  top: -10px;
}
.warning {
	color: #FF0000;
	font: 18px "宋体";
}

</style>

</head>
<body>

<%-- <%@ include file="nagback.jsp" %> --%>
<br> <br> <br>
<br> <br> <br>

<form action="reg_register.do" method="get">
<div id="login">
			<div id="title">
<!-- 				请填写注册信息，若已有账号请<a href="login_init.do"> 点击登录 </a>。 -->
			</div>

		
			<div style="width:98%;margin:0px auto;">
				<table id="loginbox" >
				
					<tr >
						<td class="bfont">登录账号：</td>
						<td >
						
						<input type="text"	name="sysuser.loginName" id="sysuser.loginName" />
						<br>
						<span class="warning" id="userNameEmpty"
							style="display: none">用户名为空！</span>
							<label id="userNameExist"
							class="warning" style="display: inline-block;">
							</label>
						</td>
					</tr>
					<tr  >
						<td class="bfont">密&nbsp;&nbsp;码：</td>
						<td>
						<input type="password"	name="sysuser.password" id="sysuser.password" />

						<br><span class="warning" id="passwordEmpty"
							style="display: none">密码为空！</span>
						</td>
					</tr>
					<tr  >
						<td class="bfont">确认密码：</td>
						<td>
						<input type="password"	name="password" id="password2" />
						
					<br><span class="warning" id="password2Error"
							style="display: none">确认密码不一致！</span>
						</td>
					</tr>
					
				<tr  >
						<td class="bfont">用户类型：</td>
						<td>
						<div class="button-holder">
						
						<input type="radio" name="sysuser.usertype"  
						value="doctor"
						id="doctor" class="regular-radio big-radio" checked>
						<label for="doctor"></label><span class='spanUserType'>医生 </span><br>
						
       <input type="radio" name="sysuser.usertype" 
       value="patient"
       	id="patient" class="regular-radio big-radio" >
       <label for="patient"></label><span class='spanUserType'>患者 </span> <br>
       
       <input type="radio" name="sysuser.usertype" 
        value="assistant" 
       	id="assistant" class="regular-radio big-radio" >
       <label for="assistant"></label><span class='spanUserType'> 互联网医疗专员</span> <br>
       
       </div>
						</td>
					</tr>
					
					
					<tr  >
						<td class="bfont">推荐人编号：</td>
						<td>
						<input type="text"	name="sysuser.reserve1" id="reserve1" value="选填"/>
						</td>
					</tr>
					
					<tr>
					<td></td>
					<td>
			&nbsp;<div id="bottom" onclick="checkSubmit()" style="cursor:hand"></div>
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
	 var item_label="用户编号,用户类型,医院名称,科室名称,职称,擅长领域,简历,"
	 			+"-,真实姓名,email,电话,手机,微信,照片,二维码";
		
	 var item_ar=$('.datalist_item div');
	 
	 console.log(item_ar);
	 
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
 });
</script>
</body>
</html>
