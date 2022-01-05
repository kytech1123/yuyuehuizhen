<%@ page language="java" contentType="text/html; charset=utf-8"      %>
<%@ page import="edu.ahpu.boke.domain.SysUser" %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>会诊管理</title>
<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="css/meet.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">


<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
<script src="js/jsconfig.js"></script>
<script src="js/nag/session_his.js"></script>

<style>
.me_button{
	text-decoration: none;
}

.meet_item_User{
    margin：10px;
    padding：10px;
   	border: 2px solid green;
   	border-radius: 10px;
   	height:110px;
   }
   
#exitdiv{
background-color:#6b6;
width:98%;
text-align:center;
}
#exitdiv a{
	text-decoration: none;
}
</style>

<script>
function bodyScale() {
    var devicewidth = document.documentElement.clientWidth;
    var scale = devicewidth / 1440;  
    // 分母——设计稿的尺寸
    document.body.style.zoom = scale;
}
window.onload = window.onresize = function () {
    bodyScale();
};
</script>
</head>
<body>

<!-- 11 -->
<!-- work2021.8.25 -->
     
<!-- top导航 -->
<div>
&nbsp;&nbsp;&nbsp;
<a href='${ctx}/pc/index.jsp'>首页</a>

&nbsp;&nbsp;&nbsp;
<a href='${ctx}/pc/index.jsp'>会诊大厅</a>
</div>
<br>
<br>
<br>


<%
	// 添加会诊专家
	// 读取当前登录用户信息 
	SysUser ssUser=SessionUtils.getUserFormSession(request);
	String utype="err";
	String uname="errname";
	String id="errid";
	if(ssUser!=null )
	{
		utype=ssUser.getUsertype();
		uname = ssUser.getName();
		id= ssUser.getId();
		out.print("<input type='hidden' id='usercom_v' value='"+ ssUser.getCompanyId() +"'>");						
		out.print("<input type='hidden' id='useroffice_v' value='"+ ssUser.getOfficeId() +"'>");						
		out.print("<input type='hidden' id='userlevel_v' value='"+ ssUser.getLevel() +"'>");						
	}
	out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
					
		
%>
<div class="main_user">
	
			
			<div class='meet_item'>
				<div class='meet_item_p1' style="font-size:20px;">
					<button id='loginbtn' class="button"  >登录/注册</button>
					<br>&nbsp;<span id='username'></span>
				<br>&nbsp;<span id='usercom'></span>
					<br>  &nbsp;<span id='useroffice'></span>
					<br> &nbsp;<span id='userlevel'></span>
					
	
				</div>
				<div class='meet_item_p2'>
					<br>
					<br>
					<br>
				</div>
			</div>
			
			<div class='meet_item_User' id='userinfo_div' >
			&nbsp;个人信息 <br>
				<div class='meet_item_p1'>
					&nbsp;&nbsp;	
					 <a href='${ctx}/user_updateone.do?id=<%=id %>'>编辑个人信息
						 </a>
						 &nbsp;&nbsp;	
					 <a href='${ctx}/user_updatepw.do?id=<%=id %>'>修改密码
						 </a><br><br>
					&nbsp;&nbsp;	
					 <a class='doctorMenu' href='${ctx}/user_findone.do?id=<%=id %>'>查看个人信息
						 </a>
						 
					&nbsp;&nbsp;	
					 <a class='doctorMenu'  href='${ctx}/user_editschedule.do?id=<%=id%>'>编辑日程表
						 </a>
					</div>
				
				<div class='meet_item_p2'>
					
				</div>
			</div>			
			<div class='meet_item_User' id='usermeet_div'>
				<div class='meet_item_p1'>
					 &nbsp;我的会诊
					 <br>
					 &nbsp;&nbsp;<a class='doctorMenu' 
					 href="${ctx}/meet_findall.do?reqfrom=app&handle=mystart" >我汇报的</a> 
	 &nbsp;&nbsp;<a class='doctorMenu' 
	 href="${ctx}/meet_findall.do?reqfrom=app&handle=myreceive" >我收到的</a>

	 &nbsp;&nbsp;<a class='assistantMenu' 
	 href="${ctx}/msg/chatfriend.jsp" >我协助的</a>
	 
	<br><br> &nbsp;软件试运营
					 <br>
					&nbsp;&nbsp; &nbsp;&nbsp;<a  
					 href="${ctx}/user/user_report.jsp" >反馈和建议</a> 
					  &nbsp;&nbsp;<a  id="admin_reportall"
					 href="${ctx}/user/user_reportall.jsp" >查看反馈</a> 
				</div>
				<div class='meet_item_p2'>
 				</div>
			</div>	
					
					<br>
				<div id='exitdiv'>
					<a class="exit_button" href="login_exit.jsp" 
					style="font-size:25px;background-color:#6b6;color:#fff;"
					>&nbsp;&nbsp;退&nbsp;&nbsp;出&nbsp;&nbsp;</a>
					</div>
					
					<br>
					&nbsp;服务大众健康 &nbsp;&nbsp;&nbsp;&nbsp;
放大优质医疗资源&nbsp;&nbsp;&nbsp;&nbsp;
					<br>
					&nbsp;服务热线：400-610-9777<br>
					&nbsp;群爱客服：徐芳菲 18234498304
			
	</div>		
<br>
<br>

<br>
<br>


<script>
function test() {
	window.location.href="login.jsp";
	}
	
$(document).ready(function(){
	
	  var loginFlag = 0;
	  $("#loginbtn").bind("click",test );
	  
	  utype= $('#ssusertype').val();
	  console.log (utype );
	  if( utype == null || utype== undefined || utype == '' || utype == 'err' )
	 {
		  $("#loginbtn").show();
		  $(".exit_button").hide();
		  $("#userinfo_div").hide();
		  $("#usermeet_div").hide();
	 }
	  else
	  {
		  loginFlag = 1;
		  
		  $("#loginbtn").hide();
		  $(".exit_button").show();
		  $("#userinfo_div").show();
		  $("#usermeet_div").show();
		  
		  $("#username").html( $('#ssusername').val() );
		  $("#usercom").html( $('#usercom_v').val());
		  $("#useroffice").html( $('#useroffice_v').val());
		  $("#userlevel").html( $('#userlevel_v').val() );
	 }
	  /////////////////////
	  if( loginFlag == 1   )
	 {
		  if( utype == 'admin')
			{
			  $('#admin_reportall').show();
			}
		  else {
			  $('#admin_reportall').hide();
		  }
			 
			  ///////////////
			  if( utype == 'doctor')
			{
				 $(".doctorMenu").show();
				 $(".assistantMenu").hide();
			}
			else if( utype == 'assistant')
			{
				 $(".doctorMenu").hide();
				 $(".assistantMenu").show();
			}
			else
			{
				$(".doctorMenu").hide();
				 $(".assistantMenu").hide();
				
			}

		}
});
	
	
</script>
</body>
</html>
 
