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

<STYLE>
.joynav UL LI {
	PADDING-BOTTOM: 0px;
	PADDING-LEFT: 6px;
	PADDING-RIGHT: 14px;
	PADDING-TOP: 2px
}

.joynav UL LI.channel {
	PADDING-BOTTOM: 0px;
	PADDING-LEFT: 15px;
	PADDING-RIGHT: 8px;
	PADDING-TOP: 2px
}

.joynav UL LI.end {
	PADDING-RIGHT: 14px !important
}

.joynav UL LI.startjoy {
	Z-INDEX: 1;
	POSITION: relative;
	PADDING-LEFT: 38px;
	MARGIN-LEFT: 0px
}

.joynav UL LI.hotjoy {
	Z-INDEX: 1;
	POSITION: relative;
	PADDING-RIGHT: 38px;
	MARGIN-RIGHT: 0px
}

.joynav UL LI.spech1.channel {
	BACKGROUND: none transparent scroll repeat 0% 0%;
	MARGIN-LEFT: 0px
}

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
#inputbox
{ font-size:20px;
	width:80%;
}
/* 2021.10.14 我的消息 css */
.content_me{
float: right;
		   font-size : 18px ;
		   padding : 5px ;	   
		   border-radius:  5px  ;
		   color: : #111  ;
		   background-color : #1d3 ;
		   margin-top:10px;
}
 
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("/boke/WebRoot/msg/chatmsgTeam.jsp");
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
		uid =  ssUser.getId();
	}
	//out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	//out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
		
%>
	<div>
	<br>
	 &nbsp;&nbsp;群聊
	 &nbsp;
	 <a href ='chatfriend.jsp?appointmentId=${param.appointmentId}'>返回好友列表</a>
	 &nbsp;
	 <a href ='chatfriend.jsp?appointmentId=${param.appointmentId}'>群成员</a>
	 &nbsp;
	 <a href='${ctx}/meet_findoneManage.do?reqfrom=app&id=${param.appointmentId}'>会诊管理</a>
	 
	 <br>
	 <br>
	</div>
	

  <div id="msg_list">
  </div>  
  <br>
  
  <script>
	///////////////////////// function
 	function sendmsgAjax(ctx, form_data){
		
		var serverURL=ctx+"/msg_addmsg.do?"+ form_data;
        
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
                console.log('server back:'+result);
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}
	
	/////////////////////////////////// 发送消息
  	function sendmsg(){
	  console.log('sendmsg');
	  var chat=$('#inputbox').val();
	  
	  if (chat == null || chat=='' || chat == undefined)
		  {
		  alert('消息不能为空');
		  return;
		  }
		  
	
	  /////////// 发出消息 server
	  console.log( getTime() );
	  $('#chattime').val( getTime() );
	  
	  var params = $('#msgSendForm').serialize();
	  console.log( params );
	  
	  sendmsgAjax( ctx, params );
	  // 发出消息后，延时获取最新的消息列表
	  setTimeout("receiveMsg(ctx, $('#chatroom').val() )", 200 );
	// 清空消息框
	  $('#inputbox').val('');
	  //css
	 freshCSS();
  }
	
  </script>
<div>
		
	<div class="form_div">
	<br>
	<br>
	<br>
	<br>
	
		<form id='msgSendForm' action="chatmsg.jsp">
		<!--   数据 -->
  		<input type=hidden id="chatroom" 
  			name="chatroom" value="${param.chatroom}" />
  		<input type=hidden id="msgtoid"
  			name="msgtoid" value="${param.chatroom}" />
  		
  		<input type=hidden  id="msgtoname"
  			name="msgtoname" value="${param.chatroom}" />
  		
  		<input type=hidden id="msgfromname"
  			name="msgfromname" value="<%=uname %>" />
  		
  		<input type=hidden id="msgfromid"
  			name="msgfromid" value="<%=uid %>" />
  		
  		<input type=hidden name="chattime"  id="chattime" />
		
			<input type="text" id="inputbox" name="content"	>
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
		 
		<br>
		<br>
		<br>
		<br>

 		<br>
		<br>
		<br>
		<br>
	<script type="text/javascript">
	// 设置消息内容CSS
	function freshCSS(){
		$('.msg_list_p2').css({
			  "float":"left",
			  "font-size":"18px",
			  "padding":"5px",
			  "border":"2px solid green", 
			  "border-radius" :"5px" 		  
			  });
		  
		  $('.msg_list_p2').each(function(){
			  var t=$(this).css('width');
			  var w= parseInt( t.replace(/px/, '')); 
			  console.log(  t+',' + w);
			  if( w >240)
				  $(this).css('width', '240px');
		  });
		  
		  // 设置当前用户的绿色消息CSS
		  $('.p1_name').text(function(n,origintext){
				console.log(n+","+ origintext);
				
				if( origintext == $('#msgfromname').val() )
				{
					$(this).prev().removeClass("p1");
					$(this).prev().addClass("p1_me");
					$(this).next().removeClass("msg_list_p2");
					$(this).next().addClass("content_me");
					$(this).removeClass("p1_name");
					$(this).addClass("p1_name_me");
				}
			});
			
			//////////////////
			var _width = document.documentElement.clientWidth;  //屏幕宽
			var w= _width - $('.index_icon').width()-30;
			console.log(' //////'+ $('.index_icon').width()+'///// fresh '+w);
			$('.p1_name_me').css({"width": w+"px" });//用宽度占位
			$('.p1_name_me').css({"text-align": "right" });
			$('.p1_name_me').css({"float": "right" });
			$('.p1_me').css({"float": "right" });
			$('.content_me').css({"float": "right" });
			
	}
	
 $(function () {
	  console.log("chat friend");
	  freshCSS();
	
	  console.log("chat friend -- msg_list_p2_me");
	  
	  $('.p1_me').css({
		  "float":"right"
		  });
	  /////////////////////////////////////////////
	  
});
</script>			

 <script>
 	// 折叠菜单
  $('.con_ul li .title').click(function(){    
  		console.log("click");
	  	$(this).toggleClass('act');//获取当前点击对象，切换act类，达到切换背景箭头的效果
  		$(this).next().slideToggle();//获取当前点击对象的下一个兄弟级，实现折叠效果切换  
  });
 	console.log("menu");
 	
 	
/////////////////////////////////// 接收消息
	function view_msgItem( fromid, fromname,content, chattime)
	{
		var msgdiv="<div class='msg_list_item' >" 
			+"<div class='p1'><img class='index_icon' src='${ctx}/images/msg/"
			+ find_face(fromid) +"'></div>"
			+"<div class='p1_name'>"+ fromname
			+"</div><div class='msg_list_p2' >"
			+ content
			+"</div></div>";
	  $('#msg_list').append(msgdiv);
	}
	function view_msglist(arr)
	{
		if(arr == null || arr== '' || arr== undefined)
		{
			console.log('no view_msglist data');
			return;
		}
		arr= $.parseJSON( arr );
		console.log(arr.length );
		
		//初始化消息列表VIEW
		$('#msg_list').empty();
		//
		for(var i=0,l=arr.length;i<l;i++){
			view_msgItem( arr[i]['msgfromid'], arr[i]['msgfromname'],
					arr[i]['content'] ,arr[i]['chattime'] );
		}
		// 刷新CSS
		freshCSS();
	}
	function receiveMsg(ctx,chatroom)
	{
		var serverURL=ctx+"/msg_findmsg.do?chatroom="+ chatroom;
        
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
                console.log('receiveMsg back:'+result);
                view_msglist ( result );
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}
	
 	$(function(){
 		receiveMsg(ctx, $('#chatroom').val() );
 		
 		//启动定时刷新
 		 setInterval(function(){ 
 			receiveMsg(ctx, $('#chatroom').val() );
 			}, 6000);
 	});
 </script>

			 
</BODY>
</HTML>
