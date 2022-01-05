<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>反馈和建议</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link    href="${ctx}/css/footer.css" rel="stylesheet" type="text/css">

<link href="${ctx}/css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/bottom_navig.css" type="text/css" rel="stylesheet">

<!-- 竖状折叠菜单 -->
<link href="${ctx}/css/friend_list.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 2021.10.14 时间处理 -->
<script src="${ctx}/js/jstime.js"></script>
<script src="${ctx}/js/jsconfig.js"></script>
<script src="${ctx}/js/jsdata.js"></script>


<STYLE>
.topBar {
	border-bottom: #d2d2d2 1px dashed;
	margin-bottom: 10px;
	padding: 5px;
	height: 20px
}

.loginBar {
	float: right;
}
/* 会前准备 参会者 2021.9.7 */
#role_table,#data_table_files
{
	border-collapse:collapse;
	width: 98%;
}
#role_table td,#data_table_files td
{
	border:1px solid #6b6;
	padding:3px;
}
/* 	CSS BUTTON 添加汇报人、专家 */
.item_edit_a{
	padding：10px;
	background-color: #6b6;
	color: #fff;
	text-decoration: none;
}
.msgtip
{
	float:left;
	border-radius:13px;
	background-color: #f00;
	color: #fff;
	font-size:16px;
	width: 30px;
	height: 30px;
}
#friend{
	clear:both;
	border-top:2px solid #6b6;
}
.index_icon{
	width: 50px;
	height: 50px;
}
form{
	font-size:20px;
	padding: 10px;
}
input{
	font-size:20px;
	margin: 8px;
}
select{
	font-size:18px;
}
button{
	font-size:18px;
}
option{
   		font-size: 16px;
   }
#meetAddrOther{
	display:none;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("meet set ----  app");
	}
	function back() {
		 console.log("meet set ----  back");
		 window.location.href=  $('#backmenu').attr('href');
	}
</script>


</head>

<BODY onload="selectChannel();">
<!--  导航 -->
<%@ include file="../nag.jsp" %>

<br>
<br>
<br>
<%
	// 添加会诊专家
	// 读取当前登录用户信息 
	SysUser ssUser=SessionUtils.getUserFormSession(request);
	String utype="err";
	String uname="errname";
	String uid="errid";
	if(ssUser!=null )
	{
		utype=ssUser.getUsertype();
		uname = ssUser.getName();
		uid= ssUser.getId();
	}
			
					
		
%>
	<div>
	<br>
	 &nbsp;&nbsp; 
<a id='backmenu'  
href='${ctx}/me.jsp'>返回个人中心</a>
	 &nbsp;&nbsp;
	 <br>
	</div>
<!-- 	 msg_friendlist.do -->
<div style="padding:10px;color:#252;">
&nbsp;&nbsp;感谢您于2022年1月参与"群爱医疗软件模拟测试"，我们将根据您的建议修改软件功能，请联系客服徐芳菲18234498304
，领取礼物或红包。(微信sy18234498304)
</div>
<form id='sendreportForm' action='${ctx}/user_report.do'>

<input  type=hidden id="id"
	name="id" value="${param.id}" >
	
	<% 
out.print("<input type='hidden' name='utype' id='ssusertype' value='"+ utype +"'>");						
	out.print("<input type='hidden' name='uname' id='ssusername' value='"+ uname +"'>");		
	out.print("<input type='hidden' name='uid' id='uid' value='"+ uid +"'>");		
	%>
	
<input  type=hidden id="dbfield"
	name="dbfield" value="setLive" >
问题分类&nbsp;<select id='question' name='questionType'>
			<option value="首页">首页</option>
			<option value="预约会诊">预约会诊</option>
			<option value="发起人功能" >发起人功能</option>
			<option value="患者和病例功能">患者和病例功能</option>
			<option value="接单专家功能">接单专家功能</option>
			<option value="医助功能">医助功能</option>
			<option value="消息聊天">消息聊天</option>
			<option value="个人中心">个人中心</option>
			<option value="登录注册">登录注册</option>
			<option value="软件界面">软件界面</option>
			<option value="其他问题">其他问题</option>
</select>
	<br>
	<br>
问题描述&nbsp;
<br>&nbsp;<textarea rows="10" cols="40" name="reportctx"></textarea>

</form>
<br>
&nbsp;
&nbsp;

<button id="subbtn" onclick="sendreport('#sendreportForm')">提交</button>
&nbsp;
&nbsp;
<button id="cancelbtn" onclick="back()" >取消</button>


<script>
function sendreport(){
// 	var qtype= $("#question").find("option:selected").text();
// 	console.log(qtype);
	
// 	$("#question").val(qtype);
	
// 	console.log( $("#question").val());

// 	//批量把每个option的文本设置为它的value
// 	$("#question").find("option").text(function(i, t){
// 			$(this).val(t);
// 	});
	
	// 提交表单
// 	$("#sendreportForm").submit();
	
}
</script>
 
 <script>
///////////////////////// function
	function sendreportAjax(ctx, form_data){
		
		var serverURL=ctx+"/user_report.do?"+ form_data;
     
     console.log(serverURL );
     //
     $.ajax({
         //请求方式
         type : "GET",
         //请求的媒体类型
         contentType: "application/json;charset=UTF-8",
         //请求地址
         url : serverURL,
         //数据，json字符串
         //data : JSON.stringify(list),
         //请求成功
         success : function(result) {
             console.log('-=-=-=   server back:'+result);
             alert('提交成功'+result);
         },
         //请求失败，包含具体的错误信息
         error : function(e){
             console.log(e.status);
             console.log(e.responseText);
         }
     });
	}
	
	/////////////////////////////////// 发送消息
	function sendreport(formid){
	  console.log('sendreport');
	  /////////// 发出消息 server
	  console.log( getTime() );
	  $('#chattime').val( getTime() );
	  
	  var params = $(formid).serialize();
	  console.log( formid+":"+params );
	  
	  sendreportAjax( ctx, params );
	  
	 }
	
	
	
 
 ////////////////////////////////////////////
 $(function () {
	  console.log("set tool");
	  
	 
});
  
 	
 </script>

			 
</BODY>
</HTML>
