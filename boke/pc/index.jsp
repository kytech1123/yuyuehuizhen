<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>群爱智慧医疗</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />


<!-- jquery 2021.9.2 -->
<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<style type="text/css">
body {
/* 	font: 25px "宋体"; */
font-size:25px;
	background-color: #fff;
}
#leftoffice ul
{
	padding:0px;
}
#leftoffice li
{
 list-style-type: none;
 line-height: 20px;
 background-color: #9cf;
 display:block;
}
#leftoffice  a
{
	font-size:25px;
/* 	margin-top:20px; */
	display:block;
	background-color: rgb(130, 200, 160);
	color: #fff;
	padding: 20px 50px;
}
#leftoffice  a:hover
{
	font-size:25px;
/* 	margin-top:20px; */
	display:block;
	background-color: #3a3;
	color: #fff;
	padding: 20px 50px;
}
.nag a {
	color: #fff;
 	text-decoration: none; 
 	margin-left:50px;
}

.nag a:hover {
	color: #030;
	text-decoration: underline;
}
 

#title {
/* 	width: 80%; */
/* 	height: 40px; */
	line-height: 25px;
	color: #F60;
	background-color: #6b6;
/* 	text-align: center; */
	margin: 0px auto;
	padding: 10px;
}
#top{
 	text-align: right;
 	 
}
#top_td{
 	text-align: right; 
 	padding-right:150px;
 	font-size:25px;
}
#top_td input{
/*  	text-align: right;  */
/*  	padding-right:200px; */
 	font-size:25px;
}
#qasearch{
/*  	text-align: right;  */
/*  	padding-right:200px; */
	background-color:#6b6;
 	font-size:25px;
 	text-decoration: none;
 	color:#fff;
}
#mainTable{
text-align: left;
}
#mainpic{
background:url(${ctx}/images/pc/ad.jpg) no-repeat;
}
</style>

</head>
<body>
<table border="0" width=100% >
<tr>
<td><img src='${ctx }/images/top_logo_qa.gif' height='80px'>
</td>
<td id='top_td'>
<input type='text' value='请输入医院/医生/科室'>
<!-- <input type='button' value='搜索'> -->
<a href="http://polaris.applinzi.com/" target='s2' id='qasearch'>&nbsp;搜索&nbsp;</a>
&nbsp;
&nbsp;
&nbsp;
					<a href="${ctx }/pc/login.jsp">登录</a>&nbsp;&nbsp;
					<a href="${ctx }/pc/register.jsp">注册</a>
</td></table>			
<!-- http://gaiwo.belovedlive.com:8095/medical/f/weixin/viewdoctor -->

<!-- http://polaris.applinzi.com/ -->

<!-- 注册账号 代为接单，通知专家 -->

<div >
			<div id='title' class='nag'>
				&nbsp;&nbsp;	<a href="${ctx }/pc/index.jsp">首页</a>
				&nbsp;&nbsp; 	<a href="http://gaiwo.belovedlive.com:8095/medical/f/weixin/viewdoctor"
				target='_blank'>群爱专家</a>
				&nbsp;&nbsp; 	<a href="http://polaris.applinzi.com/" target='s2'>检索查询</a>
				&nbsp;&nbsp; 	<a href="https://wx.vzan.com/live/topicguide-1855718512?shareuid=null&sharetstamp=0&jumpitd=1"
				target='_blank'>当前直播</a>
				&nbsp;&nbsp; 	<a href="${ctx }/admin/main.jsp">预约会诊</a>
				&nbsp;&nbsp; 	<a href="${ctx }/admin/main.jsp">会诊管理</a>
				&nbsp;&nbsp; 	<a href="${ctx }/admin/main.jsp">帮助</a>
			</div>

		
<table id='mainTable' border='0' width='100%'>
<tr>
<td id='leftoffice' >
<ul>
<li><a class='leftmenu' href="http://polaris.applinzi.com/" target='s1'>神经内科</a> 
<li>				 	<a class='leftmenu' href="http://polaris.applinzi.com/" target='s1' >心内科</a>  
	<li>			 	<a class='leftmenu' href="http://polaris.applinzi.com/" target='s1'>肾内科</a>  
		<li>	  	<a class='leftmenu'  href="http://polaris.applinzi.com/" target='s1'>内分泌科</a>  
<li>				 	<a class='leftmenu'  href="http://polaris.applinzi.com/" target='s1'>消化科</a>  
	<li>		 	<a class='leftmenu'  href="http://polaris.applinzi.com/" target='s1'>精神科</a>  
		<li>		 	<a href="http://polaris.applinzi.com/" target='s1'>血液科</a>  
		<li>		 	<a href="${ctx }/pc/index.jsp"> </a>  
		<li>		 	<a href="${ctx }/pc/index.jsp"> </a>  
		<li>		 	<a href="${ctx }/pc/index.jsp"> </a>  
		<li>		 	<a href="${ctx }/pc/index.jsp"> </a>  
</ul>
</td><td id='mainpic' width='70%'>
<%-- 			<img src='${ctx }/images/pc/82meet1.jpg' height='440px'/> --%>&nbsp;
</td></table>			
<br>
			<br>
			<br>
			

		</div>
</body>
</html>
