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

<link rel="stylesheet" type="text/css" href="${ctx}/css/thickbox.css" />

<link href="${ctx}/css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/reg_form.css" type="text/css" rel="stylesheet">



<!-- jquery 2021.9.2 -->
<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<script src="${ctx}/js/reg/regformPC.js"></script>



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
/*  	height: 500px;  */
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

select,option{
	font-size: 18px;
}

/* 弹框 2021.12.28 */
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
#personinfo{
 			width: 600px;
            height: 300px;
            position: absolute;
            top: 100px;
            right: 0;
            bottom: 0;
            left: 450px;
/*             margin: auto; */
            background: #fff;
            border-radius: 5px;
}
.redstar
{
	color:red
}


</style>
<!-- 2021.12.27 选择科室 -->
<link href="${ctx}/css/major/major.css" type="text/css" rel="stylesheet">
</head>
<body>

<%-- <%@ include file="nagback.jsp" %> --%>
<br> <br>  
<form action="${ctx}/pc/reg_register.do" method="get">
<div >
			<div id="title">
<!-- 				请填写注册信息，若已有账号请<a href="login_init.do"> 点击登录 </a>。 -->
			</div>

		
			<div style="width:98%;margin:0px auto;">
				<table id="loginbox" border="0">
				
					<tr >
						<td class="bfont"><span class='redstar'>*</span>登录账号</td>
						<td >
						
						<input type="text"	name="sysuser.loginName" id="sysuser.loginName" />
						<br>
						<span class="warning" id="userNameEmpty"
							style="display: none">登录账号为空！</span>
							<label id="userNameExist"
							class="warning" style="display: inline-block;">
							</label>
						</td>
					</tr>
					<tr  >
						<td class="bfont"><span class='redstar'>*</span>密&nbsp;&nbsp;码：</td>
						<td>
						<input type="password"	name="sysuser.password" id="sysuser.password" />

						<br><span class="warning" id="passwordEmpty"
							style="display: none">密码为空！</span>
						</td>
					</tr>
					<tr  >
						<td class="bfont"><span class='redstar'>*</span>确认密码：</td>
						<td>
						<input type="password"	name="password" id="password2" />
						
					<br><span class="warning" id="password2Error"
							style="display: none">确认密码不一致！</span>
						</td>
					</tr>
					
				<tr  >
						<td class="bfont">用户类型：</td>
						<td>
						<!-- 	2021.12.27 -->
							<select id='usertype' name="sysuser.usertype" >
							<option value="doctor">医生</option>
							<option value="patient">患者</option>
							<option value="assistant">互联网医疗专员</option>
							</select>
						</td>
					</tr>
					
					
					<tr  >
						<td class="bfont">推荐人编号：</td>
						<td>
						<input type="text"	name="sysuser.reserve1" id="reserve1" value="选填"/>
						</td>
					</tr>
					
<tr><td><span class='redstar'>*</span><span class="uilable"></span></td><td>
			<input type="text" id='inputname' name="sysuser.name" value=${item_data.name}  ></tr>
			
<tr><td><span class='redstar'>*</span><span class="uilable"></span></td><td>
	<input type="text"  name="sysuser.companyId"  value=${item_data.companyId} ></tr>
	
<tr><td><span class='redstar'>*</span><span class="uilable"></span></td><td>
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
                	<br>&nbsp;&nbsp;未列出出的科室，可直接输入。
            </div>
            <div class="btn-wrapper">
                <a href="javascript:;" class="a-btn-01" onclick="sureBtn()">确定</a>
                <a href="javascript:;" class="a-btn-02">取消</a>
            </div>

        </div>
    </div>
	<script src="${ctx}/js/major/majorReg.js"></script>
	
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
					
					
				</table>
			</div>

			<br>
			<br>
			<br>
			

		</div>
		
		<div>
		<table id="personinfo">
	
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
<%-- <tr><td><span class="uilable"></span></td><td> --%>
<%-- 		<input type="text"  name="sysuser.photo"   value="${item_data.photo}"  ></tr> --%>

<%-- <tr><td><span class="uilable"></span></td><td><input type="text"  name="sysuser.qrcode" --%>
<!-- value="qrcode"></tr> -->
<tr>
					<td></td>
					<td>
<!-- 			&nbsp;<div id="bottom" onclick="checkSubmit()" style="cursor:hand"></div> -->
						<input type="button" onclick="checkSubmit()"  value="提交">
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onclick="btncancel()"  value="取消">
					</td>
					</tr>
</table>
		</div>
</form>
<script type="text/javascript">

function fresh_label(item_label)
{
	 var i=0;
	 var item_label_ar = item_label.split(",");
	 // 修改UI文字
	 i=0;
	 $(".uilable").text(function(i,origText){
		 	console.log("text"+i);
	        return  item_label_ar[i]+":" ; 
	        i++;
	    });
	 }
function btncancel()
{
	history.back();
}

 $(function () {
	 var item_label="真实姓名,医院名称,科室名称,职称,擅长领域,简历,"
	 			+"email,电话,手机,微信,照片,二维码";
		
	 var item_ar=$('.datalist_item div');
	 
	 console.log(item_ar);
	 
	 fresh_label(item_label);
	 $('.uilable').each(function(){
	        //$(this).css("width",item_css_w_ar[i]+"px");
	        $(this).css("font-size", "18px");
	    });
	 
	 //////////////// 2021.12.28
	 $('#usertype').change(function(){
	      var usertype= $(this).val();
	      
	      if( usertype == 'assistant' )
	 	 {
	 		 item_label="真实姓名,单位名称,部门名称,职位,专业特长,简历,"
	 	 			+"email,电话,手机,微信,照片,二维码";
	 		 
	 		 $('#level').empty();
	 		 $('#level').append( $('#level_assistant').html() );
	 		 $('#level').val( $('#levelTmp').val() );
	 		 
	 		 $('.a-btn-01').hide();
	 		fresh_label(item_label);
	 	 }else if( usertype == 'doctor')
	 	{
	 		 item_label="真实姓名,医院名称,科室名称,职称,擅长领域,简历,"
		 			+"email,电话,手机,微信,照片,二维码";
	 		 
	 		 $('#level').empty();
	 		 $('#level').append( $('#level_assistant').html() );
	 		 $('#level').val( $('#levelTmp').val() );
	 		 
	 		 $('.a-btn-01').show();
	 		fresh_label(item_label);
	 	 }
	    });
 });
</script>
</body>
</html>
