<%@ page language="java" contentType="text/html; charset=utf-8"      %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>群爱医疗管理信息系统</title>
<link href="css/banner.css" type="text/css" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">

<!-- 2021.9.2 app 医生列表 -->
<link href="css/listview_app.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<style>
body{
	margin:0px;
	padding:0px;
}
</style>
</head>
<body>

<!-- 11 -->
<!-- work2021.8.25 -->
    <div class="wrapper">
        <img class="left" width="50" src="images/banner/left.png"/>
        <img class="right" width="50" src="images/banner/right.png"/>
        <ul class="slider">
            <li><img src="images/banner/b_img1.png"></li>
          
        </ul>
        <ul class="pagination-wrap">
            <li class="active">1</li><li>2</li><li>3</li><li>4</li>
        </ul>
    </div>


<script src="js/banner_index.js"></script>

<div></div>
<!-- <div class="qa_msginfo"> -->
<!-- 	<a href="#">您有新的消息，请及时处理</a> -->
<!-- </div> -->
<!-- <div class="qa_msginfo"> -->
<!-- 	系统公告：第66期会诊正在进行中，欢迎点击观看 -->
<!-- </div> -->
<br>

<div class="menu1">
	<a href="/boke/user_findallApp.do">
	专家库</a>
</div>
<div class="menu2">
	病例库
</div>
<div class="menu_robot">
	小群机器人
</div>

<div class="row_br"></div>
<br>

<div class="menu_meet">
	<div class="menu3">
		<a class="menu_meet_a" href="meetadd_app.jsp?reqfrom=app"
		style="text-decoration: none;color:#fff;font-size:18px;" >预约会诊
		</a>
	</div>
	<div class="menu4">
		<a class="menu_meet_a" href="meet_findall.do?reqfrom=app"
		style="text-decoration: none;color:#fff;font-size:18px;" >会诊大厅
		</a>
	</div>

	<div class="menu6" style="text-decoration: none;color:#fff;font-size:18px;">
		<a class="menu_meet_a" href="meet_findall.do?reqfrom=app&handle=myreceive"
		style="text-decoration: none;color:#fff;font-size:18px;" >我的会诊
		</a>
	</div>
	
	<div class="menu5" style="text-decoration: none;color:#fff;font-size:18px;">
		<a class="menu_meet_a" href="msg/chatfriend.jsp"
		style="text-decoration: none;color:#fff;font-size:18px;" >医助客服
		</a>
	</div>
</div>

<div class="row_br"></div>
<br>

<div class="menu_qa">
	<div class="menu6">
	<a class="menu_meet_a" href="cms2/cmshelp.jsp"
		style="text-decoration: none;color:#fff;font-size:18px;" >群爱资讯新闻
		</a>
		
	</div>
	<div class="menu7">
		<a class="menu_meet_a" href="meet_findall_db.do"
		style="text-decoration: none;color:#fff;font-size:18px;" >群爱大数据
		</a>
	</div>
</div>

<div class="row_br"></div>

<div class="dui-container">
	<div class="main_user">
	
	</div>
</div>



<div class="bottom_nag">
<ul class="navig_menu">
	<li>
		<a href="#">首页
	</a>
	</li>
	<li><a href="meet_findall.do?reqfrom=app">会诊
	</a>
	</li>
	<li><a href="msg/chatfriend.jsp">消息
	</a>
	</li>
	<li><a href="me.jsp">我的
	</a>
	</li>
	
</ul></div>
<br>
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
				
				
				</div>	
			</div>					 
			</s:iterator>
			</DIV>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<script>
			console.log('index data');
			</script>
</body>
</html>
 
