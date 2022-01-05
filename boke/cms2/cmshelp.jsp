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
	 &nbsp;&nbsp;群爱资讯
	 <br>
	 <br>
	</div>



<div style= "clear:both" >
	 <ul class="con_ul">
	
     
  <li>
  <div class="title">
应用情景
  </div>
  <div class="con">
典型案例：<br>
发起人1人，不指定专家。<br>
新增汇报人1人。<br>
医助登录，添加会诊专家2人，其中1人同意、1人拒绝。<br>
</div>  
  </li>
 <li>
	  <div class="title">
		使用教程
	  </div>
	  <div class="con">
			<div>
				<table>
				<tr >
					<td style='width:30%;'>	
					<a href='cmshelp_video.jsp?vid=1'>
						<img  style='width:90%;' src='../images/ui/player_btn.png'>
					</a>
					</td><td  >功能1：医生发起预约</td></tr>
				<tr>
					<td >	
					<a href='cmshelp_video2.jsp?vid=1'>
						<img  style='width:90%;' src='../images/ui/player_btn.png'>
					</a>
					</td><td>功能2：会诊专家同意预约</td></tr>
				<tr>
					<td>	
					<a href='cmshelp_video3.jsp?vid=1'>
						<img  style='width:90%;' src='../images/ui/player_btn.png'>
					</a>
					</td><td>功能3：医助协助，邀约多名新专家</td></tr>
				<tr>
					<td>
					<a href='cmshelp_video4.jsp?vid=1'>
						<img  style='width:90%;' src='../images/ui/player_btn.png'>
					</a>
					</td><td>功能4：添加新汇报人</td></tr>
				<tr>
					<td>
					<a href='cmshelp_video5.jsp?vid=1'>
						<img  style='width:90%;' src='../images/ui/player_btn.png'>
					</a>
					</td><td>功能5：医生设置出诊时间、免打扰时间</td></tr>
				<tr>
					<td>
					<a href='cmshelp_video6.jsp?vid=1'>
						<img  style='width:90%;' src='../images/ui/player_btn.png'>
					</a>
					</td><td>功能6：被邀专家拒绝预约</td></tr>
				<tr>
					<td>
					<a href='cmshelp_video7.jsp?vid=1'>
						<img  style='width:90%;' src='../images/ui/player_btn.png'>
					</a>
					</td><td>功能7：参会者群聊讨论</td></tr>
				<tr>
					<td>
					<a href='cmshelp_video8.jsp?vid=1'>
						<img  style='width:90%;' src='../images/ui/player_btn.png'>
					</a>
					</td><td>功能8：设置会议软件、参会方式</td></tr>
				<tr>
					<td>
					<a href='cmshelp_video9.jsp?vid=1'>
						<img  style='width:90%;' src='../images/ui/player_btn.png'>
					</a>
					</td><td>功能9：群爱工作人员，配置网络直播，上传海报、议程、直播二维码等</td></tr>
				</table>
			</div>
	</div> 
   </li>
   
  <li>
  <div class="title">
亿联会议软件
  </div>
  <div class="con">
服务器网址：
<span id='serverurlshow'>yms.belovedlive.com</span>

<input type="button" 
	style='font-size:18px'
	onClick="copyUrl2()" value="点击复制" />
</div> 
 
  </li>
  
  
 </ul>
 </div>
 <br>
  

		<br>		<br>		<br>		<br>
		 		<br>		<br>		<br>		<br>
		<br>		<br>		<br>		<br>
		 		<br>		<br>		<br>		<br>
		<br>		<br>		<br>		<br>
		 		<br>		<br>		<br>		<br>
<textarea id='serverurl'>yms.belovedlive.com</textarea>
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
