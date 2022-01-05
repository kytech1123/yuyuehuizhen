<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>个人详细信息</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link rel="stylesheet" type="text/css" href="css/thickbox.css" />

<link href="css/index.css" type="text/css" rel="stylesheet">

<link href="${ctx}/css/bottom_navig.css" type="text/css" rel="stylesheet">

<!-- 2021.12.27 选择科室 -->
<link href="${ctx}/css/major/major.css" type="text/css" rel="stylesheet">

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
select,option{
	font-size: 18px;
}
.a-btn-01{
	background-color: #6b6;
	color: #fff;
	margin: 5px;
	padding: 3px;
	display: block;
	text-align: center;
	width: 100px;
	font-size: 18px;
}
.a-btn-02{
	background-color: #6b6;
	color: #fff;
	margin: 5px;
	padding: 3px;
	display: block;
	text-align: center;
	width: 100px;
	font-size: 18px;
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

<form action="reg_update.do" method="get">
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
					<tr style="display:none" >
						<td class="bfont">密&nbsp;&nbsp;码：</td>
						<td>
						<input type="hidden"  name="sysuser.password" value=${item_data.password}			>
						</td>
					</tr>
					 
					
					<tr>
		<td><span class="uilable"></span></td>
		<td>
		<input type="text"  name="sysuser.id" value=${item_data.id}			></td> </tr>
		
		
		<tr><td><span class="uilable"></span></td><td>
			<input type="text"  name="sysuser.name" value=${item_data.name}  ></tr>
		
<tr><td><span class="uilable"></span></td><td>
	
	<input type="hidden" id='usertypeTmp' name="usertypeTmp" value=${item_data.usertype} >
	
<!-- 	2021.12.27 -->
			<select id='usertype' name="sysuser.usertype" >
			<option value="doctor">医生</option>
			<option value="patient">患者</option>
			<option value="assistant">互联网医疗专员</option>
			</select>
	</td></tr>
			
<tr><td><span class="uilable"></span></td><td>
	<input type="text"  name="sysuser.companyId"  value=${item_data.companyId} ></tr>
	
<tr><td><span class="uilable"></span></td><td>
	<input type="text" id="officeId" name="sysuser.officeId"  value=${item_data.officeId}>
	
	
	<!-- 		弹框view组件 -->
	<div class="wrapper" style="display:none">
    </div>
    <div class="layouts" style="display:none">
        <div class="layoutsMain">
            <div class="title"></div>
            <div class="main-wrapper">
                <div class="checkboxwrapper">
                </div>
                	<br>
                	未列出出的科室，可直接输入。
            </div>
            <div class="btn-wrapper">
                <a href="javascript:;" class="a-btn-01" onclick="sureBtn()">确定</a>
                <a href="javascript:;" class="a-btn-02">取消</a>
            </div>
        </div>
    </div>
	<script src="${ctx}/js/major/majorSet.js"></script>
	
	 <br><a href="javascript:;" class="a-btn-01" onclick="choose(this,0)">选择科室</a>
	</td></tr>
	
<tr><td><span class="uilable"></span></td><td>
	<input type="hidden"  id="levelTmp" value="${item_data.level}">
		<select id='level' name="sysuser.level" >
			<option value="主任医师">主任医师</option>
			<option value="副主任医师">副主任医师</option>
			<option value="主治医师">主治医师</option>
			<option value="住院医生">住院医生</option>
			</select>
			
			<select id='level_assistant' style="display:none"  >
			<option value="市场总监">市场总监</option>
			<option value="金牌医助">金牌医助</option>
			<option value="医助">医助</option>
			</select>
			
			</td></tr>
			
<tr><td><span class="uilable"></span></td><td><input type="text"  name="sysuser.major"
	 value="${item_data.major}" >
	
	 </td></tr>
	 
<tr><td><span class="uilable"></span></td><td>
	<textarea name="sysuser.resume" cols="30" rows="10"   >${item_data.resume}</textarea>
	</td></tr>

<tr><td><span class="uilable"></span></td><td>
	<input type="text"  name="sysuser.email"   value="${item_data.email}" ></tr>
<tr><td><span class="uilable"></span></td><td>
	<input type="text"  name="sysuser.phone"     value="${item_data.phone}"  ></tr>
<tr><td><span class="uilable"></span></td><td>
		<input type="text"  name="sysuser.mobile"    value="${item_data.mobile}" ></tr>
<tr><td><span class="uilable"></span></td><td>
		<input type="text"  name="sysuser.wechat"    value="${item_data.wechat}" ></tr>
<tr><td><span class="uilable"></span></td><td>
		<input type="text"  name="sysuser.photo"   value="${item_data.photo}"  ></tr>

<tr><td><span class="uilable"></span></td><td><input type="text"  name="sysuser.qrcode"
value="qrcode"></tr>
					
					<tr>
					<td></td>
					<td>
			&nbsp;<div id="bottom" onclick="checkSubmitTest()" style="cursor:hand">提&nbsp;交</div>
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
	 
	 
	 var usertype= $('#usertypeTmp').val();
	 console.log( ' -- usertype '+ usertype);
	 console.log( ' -- usertype '+ $('#usertypeTmp').val());
	 if( usertype == 'assistant' )
	 {
		 item_label="用户编号,真实姓名,用户类型,单位名称,部门名称,职位,专业特长,简历,"
	 			+"email,电话,手机,微信,照片,二维码";
		 
		 $('#level').empty();
		 $('#level').append( $('#level_assistant').html() );
		 $('#level').val( $('#levelTmp').val() );
		 
		 $('.a-btn-01').hide();
		 }
	 
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
	 
	 //value
	 $('#usertype').val( $('#usertypeTmp').val() );
 });
</script>

</body>
</html>
