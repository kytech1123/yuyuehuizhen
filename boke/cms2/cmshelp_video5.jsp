<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>群爱资讯</title>
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
<script src="${ctx}/js/js_meetreceive.js"></script>
<script src="${ctx}/js/js_meetstart.js"></script>
<script src="${ctx}/js/js_meethelp.js"></script>

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

#div_video{
	/* padding-left:20px; */
	align:center;
	text-align: center;
}
.video_title{
	color: #6b6;
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
<%@ include file="../nagtop1217.jsp" %>

<br>
<br>
<br>
<%
	// 添加会诊专家
	// 读取当前登录用户信息 
	SysUser ssUser=SessionUtils.getUserFormSession(request);
	String utype="err";
	String uname="errname";
	if(ssUser!=null )
	{
		utype=ssUser.getUsertype();
		uname = ssUser.getName();
	}
	out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
					
		
%>

<script type="text/javascript">
function copyUrl2()
{
var Url2=document.getElementById("serverurl");
Url2.select(); // 选择对象
document.execCommand("Copy"); // 执行浏览器复制命令
alert("已复制好，可贴粘。");
}
</script>


	<div>
	<br>
	 &nbsp;&nbsp;<a href='cmshelp.jsp'>群爱资讯</a> &gt;视频演示:
	 <br>
	 <br>
	</div>

<div style= "clear:both" ></div>


<div id="div_video">
	<h3 class='video_title'>功能5：医生设置出诊时间、免打扰时间</h3>
	<video class="video" width="300"  controls>
      <source src="userhelp05.mp4" type="video/mp4">
    </video>
    <h3 class='video_title'>功能5：医生设置出诊时间、免打扰时间</h3>
</div>

<br>
&nbsp;<a href='cmshelp.jsp'>返回群爱资讯</a> 
<br>
<br>
<br>
<br>

 <script>
 ////////////////////////////////////////////
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
