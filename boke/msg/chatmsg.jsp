<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>聊天</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link href="${ctx}/css/footer.css"  rel="stylesheet" type="text/css" >

<link href="${ctx}/css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/bottom_navig.css" type="text/css" rel="stylesheet">

<!-- 会诊详情 -->
<link href="${ctx}/css/listview_msg_app.css" type="text/css" rel="stylesheet">

<!-- 竖状折叠菜单 -->
<link href="${ctx}/css/friend_list.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 2021.10.14 时间处理 -->
<script src="${ctx}/js/jstime.js"></script>
<script src="${ctx}/js/jsconfig.js"></script>
<script src="${ctx}/js/jsdata.js"></script>

<script src="${ctx}/js/js_msg_sendprivate.js"></script>
<script src="${ctx}/js/js_msg_getprivate.js"></script>

<!-- 2021.11.26 好友列表 -->
<script src="${ctx}/js/msg/msgfriend.js"></script>

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
/* chat css*/
.msg_list
{
	height:350px;
}
.msg_list_item
{	clear:both;
}
.form_div
{	clear:both;
	font-size:18px;
	height：160px;
}
.attach
{
	width: 50px;
	height: 50px;
	border-radius: 6px;
	background-color: #eee;
	color: #5a5;
	float:left;
	padding:10px;
	margin-left:10px;
}
input
{ font-size:20px;
}
.content_me{
float: right;
		   font-size : 18px ;
		   padding : 5px ;	   
		   border-radius:  5px  ;
		   color: : #111  ;
		   background-color : #1d3 ;
		   margin-top:10px;
}
#chat_friend_title{
	position: absolute;
	top: 10px;
	left: 40%;
	 color: #fff;
	 font-size: 26px;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("//////// chat msg private app");
	}
</script>


</head>

<BODY onload="selectChannel();">

<!--  导航 -->
<%@ include file="../nag.jsp" %>


<br><br><br>
<div id='chat_friend_title'>
${param.msgtoname }
</div>

	<div>
	<br>
	 &nbsp;&nbsp;消息聊天&nbsp;
	 <a href ='chatfriend.jsp'>返回好友列表</a>
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
		uid =  ssUser.getId();
	}
	else
		out.print("请您先登录" );
	//out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	//out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
		
%>	 <br>
	 <br>
	</div>
<!-- 	私信消息:				 -->
<%-- 		<a href="${ctx }/msg/chatmsg.jsp?msgtoid=${item_data.id}&msgtoname=${item_data.name }"> --%>


  <div id="msg_list">
  </div>  
  <br>
<div>
		
	<div class="form_div">
	<br>	<br>	<br>	<br>
		
		<form action="chatmsg.jsp" id='msgSendForm' >
				<!--   数据 -->
<%--   		<input type=hidden id="chatroom" name="chatroom" value="${param.chatroom}" /> --%>
  		<input type=hidden name="msgtoid" 
  			id="msgtoid" value="${param.msgtoid }" />
  			
  		<input type=hidden  name="msgtoname" 
  			id="msgtoname"  value="${param.msgtoname }" />
  			
  		<input type=hidden id="msgfromname"
  			name="msgfromname" value="<%=uname %>" />
  			
  		<input type=hidden id="msgfromid"
  			name="msgfromid" value="<%=uid %>" />
  		
  		<input type=hidden name="chattime"  id="chattime" />
<!--   		    name value -->
			<input type="text" id="inputbox"  name="content">
			
			<input type="button" value="发送" onclick='sendmsg()'>
			<br>
			<br>
			
			<div class="attach">表情
			</div>
			<div class="attach">图片
			</div >
			<div class="attach"> 视频
			</div>
			<div class="attach">文件
			</div>
			
		</form>
		</div>
	</div>
		 
		<br>		<br>		<br>		<br>
 		<br>		<br>		<br>		<br>
	<script type="text/javascript">
 $(function () {
	  console.log("chat msg private");
	  
	  /////////////////////////////////////////////
		receiveMsg(ctx, $('#msgtoid').val(), $('#msgtoname').val() );
		
		//启动定时刷新
		 setInterval(function(){ 
			receiveMsg(ctx, $('#msgtoid').val(),$('#msgtoname').val() );
			
		 	}, 6000);	  
});
</script>			

<script>
	// 添加两人会话
	addfriend(window.location.href+
			"&msgfromid="+$('#msgfromid').val()+ "&msgfromname="+ $('#msgfromname').val());
</script>

 <script>
 	// 折叠菜单
  $('.con_ul li .title').click(function(){    
  		console.log("click");
	  	$(this).toggleClass('act');//获取当前点击对象，切换act类，达到切换背景箭头的效果
  		$(this).next().slideToggle();//获取当前点击对象的下一个兄弟级，实现折叠效果切换  
  });
 	console.log("menu");
 </script>

			 
</BODY>
</HTML>
