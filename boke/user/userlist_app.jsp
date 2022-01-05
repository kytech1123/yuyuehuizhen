<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>用户列表</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" type="text/css" href="css/video.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

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
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("user list app");
	}
</script>

<link href="css/banner.css" type="text/css" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">
<!-- 2021.9.2 app 医生列表 -->
<link href="css/listview_app.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

</head>

<BODY onload="selectChannel();">

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


<div class="row_br">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

		<DIV >
			<s:iterator value="#userlist" var="item_data"
				status="st">
				<div class="datalist_item">
				
				<div class='p1'>
					<a href='${ctx}/user_findone.do?id=${item_data.id}'>
					<img class="index_icon" src="images/user_icon.png">
					</a>
				</div>
				<div class='p2'>
<%-- 				${item_data.loginName}					  --%>
				<div><span id="user_item">${item_data.name}</span>
&nbsp;&nbsp;<span id="user_item">182********</span></div>					 

				<div><span id="user_item">${item_data.companyId}</span></div>					 
				<div><span id="user_item">${item_data.officeId}</span>&nbsp;&nbsp;
				<span id="user_item">${item_data.level}</span></div>					 
				<div><span id="user_item">${item_data.major}</span></div>					 
				
				<div><span id="user_item">${item_data.resume}</span></div>					 

				<div><span id="user_item">${item_data.no}</span></div>					 
				
<%-- 				<div><span id="user_item">${item_data.email}</span></div>					  --%>
<%-- 				<div><span id="user_item">${item_data.phone}</span></div>					  --%>
<%-- 				<div><span id="user_item">${item_data.mobile}</span></div>					  --%>
<%-- 				<div><span id="user_item">${item_data.wechat}</span></div>					  --%>
<%-- 				<div><span id="user_item">=${item_data.photo	}</span></div>					  --%>
				
<%-- 				<div><span id="user_item">-${item_data.remarks}</span></div>					  --%>
					 
<%-- 				<div><span id="user_item">=${item_data.qrcode}</span></div>					  --%>
<%-- 				<div><span id="user_item">-${item_data.extprop}</span></div>	 --%>
<!-- 				<div>&nbsp; -->
<!-- 				&nbsp;<a href="javascript:void(0);">&nbsp;详情&nbsp;</a> -->
<!-- 				</div> -->
				</div>	
			</div>					 
			</s:iterator>
		</DIV>
		
<!-- 底部加换行		 -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>				 
		
<!-- 		APP底部导航 -->
<div class="bottom_nag">
<ul class="navig_menu">
	<li>
		<a href="index.jsp">首页
	</a>
	</li>
	<li><a href="meet_findall.do?reqfrom=app">会诊
	</a>
	</li>
	<li><a href="#">消息
	</a>
	</li>
	<li><a href="me.jsp">我的
	</a>
	</li>
	
</ul></div>	 
</BODY>
</HTML>
