<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>好友列表</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link    href="${ctx}/css/footer.css" rel="stylesheet" type="text/css">

<link href="${ctx}/css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/bottom_navig.css" type="text/css" rel="stylesheet">

<!-- 竖状折叠菜单 -->
<link href="${ctx}/css/friend_list.css" type="text/css" rel="stylesheet">

<!-- 会诊详情 -->
<link href="${ctx}/css/msg/list_msgfriend_app.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 2021.10.14 时间处理 -->
<script src="${ctx}/js/jstime.js"></script>
<script src="${ctx}/js/jsconfig.js"></script>
<script src="${ctx}/js/jsdata.js"></script>
<script src="${ctx}/js/js_meetreceive.js"></script>
<script src="${ctx}/js/js_meetstart.js"></script>
<script src="${ctx}/js/js_meethelp.js"></script>

<script src="${ctx}/js/msg/meetMember.js"></script>
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
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("chat friend app");
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
		uid = ssUser.getId();
	}
	out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
	out.print("<input type='hidden' id='ssuserid' value='"+ uid +"'>");						
					
		
%>
	<div>
	<br>
<!-- 	 &nbsp;&nbsp;消息管理	 <br> -->
	 &nbsp;&nbsp; 热线电话 400-610-9777<br>&nbsp;&nbsp;有任何问题，请咨询工程师  徐芳菲 18234498304
	 <br> <br>
	</div>
<!-- 	 msg_friendlist.do -->
<input  type=hidden id="appointmentId" value="${param.appointmentId}" >
<div id='friend'>
	 <span id="chatRoomSpan"></span>&nbsp;群成员：<br>
	汇报人：
	<div id='friend_start'>	</div>
	<div style="clear:both"> 会诊专家：</div>
	<div id='friend_receive'>	</div>
</div>

<div id="teamChatdiv">
<a href='chatmsgTeam.jsp?appointmentId=${param.appointmentId}&chatroom=${param.appointmentId}'>
<img class='index_icon' 
src='${ctx}/images/msg/ui_chat_team.png'/></a>
<br>
群聊
</div>

<script>
	//2021.10.12 一次会诊群聊的聊天对象列表
	/////////////////////////////////
    $(function(){
        //请求参数
        var list = {};
        var ctx='/boke';
        var appointmentId = $('#appointmentId').val();
        
        // 2021.10.15 lyy 如果会议id为空，不取数据，隐藏结果view
       	console.log( "id:"+appointmentId );
        if ( appointmentId == null || appointmentId == '' || appointmentId == undefined )
        {
        	$('#friend').hide();
        	$('#teamChatdiv').hide();
        }
        else
        {
        	$('#chatRoomSpan').html('会诊编号 '+ appointmentId.slice(-10) );
          	$('#friend').show();
        	$('#teamChatdiv').show();
        	getFriend( ctx, appointmentId);
        }
    });
</script>

<div style= "clear:both" >
	
	 <ul class="con_ul">
  <li>
  <div class="title">
  系统客服
  </div>
		  <div class="con">
		&nbsp;&nbsp;<a href='chatmsgsys.jsp'>系统消息</a>
		</div>  
  </li>
   
  <li>
  <div class="title">
   消息聊天
  </div>
  <div id="div_friendlist" class="con">
	 	<div  class="datalist_item">
					<div class='p1'><img class="index_icon" src="${ctx}/images/user_icon.png"></div>
					<div class='p2'>梁泽南
									主任医师<br>
					山西医科大学第一医院 神经内科
					</div>
			
		</div>
		<div style= "clear:both" ></div>
		<br>
	</div> <!-- end of con -->  
	</li>
 

<li>
  <div class="title">
   会诊群聊-我汇报的
  </div>
  <div class="con" id="mystartDiv">		
	
	</div>
  <div class="con" id="mystartDivTemp">		
	<div class="datalist_item" id="mystartItem">
				<div class='p1'>
			<a href='chatmsgTeam.jsp?appointmentId=dd1&chatroom=dd2'>
			<img class='index_icon' 
				src='${ctx}/images/msg/ui_chat_team.png'/></a>
				</div>
				<div class='p2'>dd3				
				</div>
		</div>
</div>
  </li>

<li>
  <div class="title">会诊群聊-我收到的</div>
  <div class="con" id="myreceiveDiv">	
	</div>
  </li>
  
  <li>
    <div class="title" id="myhelpMenu">会诊群聊-我协助的 </div>
  <div class="con" id="myhelpDiv">	
	</div>	
	</li>
	
 </ul>
</div>

 <br>

	 
		<br>		<br>		<br>		<br>
		 		<br>		<br>		<br>		<br>

 <script>
 
 ////////////////////////////////////////////
 $(function () {
	  console.log("chat friend");
	  
	  access_check( $('#ssusertype').val() , 'chatfriend.jsp');
	  
	  $('.index_icon').click( function(){
	  	console.log("click");
	  	//window.location.href ="chatmsg.jsp";
	  });
	  /////////////////////////////////////////////
	  //获取我发出的会议
	  getMyStart(ctx );
	  
	  //获取我接收的会议
	  getMyReceive(ctx );
	  
	  //获取我协助的会议
	  getMyHelp(ctx );
	  
	  //2021.12.13 获取好友列表
	  receiveFriendList( ctx, $('#ssuserid').val(), $('#ssusername').val());
	  
	  console.log("chat friend ---- end");
});
 
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
