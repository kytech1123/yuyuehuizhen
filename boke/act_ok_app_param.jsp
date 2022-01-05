<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="edu.ahpu.boke.domain.SysUser" %>
<%@ page import="edu.ahpu.boke.util.*" %>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>操作成功</title>

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>


<script language="javascript" type="text/javascript">
	var second;

	function go() {
		if (navigator.appName.indexOf("Explorer") > -1) {
			second = document.getElementById("totalSecond").innerText;
		} else {
			second = document.getElementById("totalSecond").textContent;
		}
		setInterval("redirect()", 1000);
	}

	function redirect() {
		if (second <= 0) {
			location.href = "404info.jsp";
		} else {
			if (navigator.appName.indexOf("Explorer") > -1) {
				document.getElementById("totalSecond").innerText = --second;
			} else {
				document.getElementById("totalSecond").textContent = --second;
			}
		}
	}
</script>
<style>
/*  top */
.top_nag{
	width:100%;
	height:60px;
	background-color: #71bd71;
	position: fixed;
	}
.top_p1{
	float:left;
}
.top_p2{
	float:right;
}
.top_p1 a img, .top_p2 a img{
		height:60px;

	}
</style>
</head>

<!-- <body onload="go();"> -->
<body>
<!-- top导航 -->
<div class="top_nag">
	<div class="top_p1">
		<a href="index.jsp">
		<img src="images/top/back.png">
		</a>
	</div>
	<div class="top_p2">
	<a href="index.jsp">
	<img src="images/top/set.png">
	</a>
	</div>
</div>
<!-- top导航 fixed, 加换行 -->
<br>
<br>
<br>
<br>
<br>
<input type=hidden id='passhref' value="${ param.act_ok_href}" />


	&nbsp;<h4>系统信息：</h4>
	<h3>&nbsp;${ param.act_ok_info}&nbsp; 
	<a id='backhref' href="${ctx}" >${ param.act_ok_text}</a>
	</h3>
<%-- 	<a href="${ctx}/meet_findoneManage.do?id=${id}">返回会诊</a> --%>
<script>
	//  <a id="backhref" href="/boke/meet_findoneManage.do?reqfrom=app&id=f7360">返回会诊管理</a>
	/*
	server-meet_findoneManage.do reqfrom-app id-f7360
	meet_findoneManage.do?reqfrom=app&id=f7360
			/boke/meet_findoneManage.do?reqfrom=app&id=f7360
			*/
	var back=$('#passhref').val();
	console.log(  back);
	var ar= back.split(' ');
	var str='';
	for(i=0; i<ar.length; i++)
		{
			token= ar[i].split('-');
			if( token [0]== 'server')
				str+= token[1]+"?";
			else
			{
				str+= token[0]+"="+ token[1];
				if(i< ar.length-1)
					str+="&" ;
			}
			
		}
	console.log(str);
	target= $('#backhref').attr('href')+'/'+str;
	console.log(target);
	 $('#backhref').attr('href', target);
</script>
</body>
</html>

