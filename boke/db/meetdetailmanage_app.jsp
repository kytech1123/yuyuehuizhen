<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"   %>
<%@ page  import="edu.ahpu.boke.util.*"   %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>会议数据统计</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link rel="stylesheet" type="text/css" href="css/footer.css">

<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">

<!-- 会诊详情 -->
<link href="css/detailview_app.css" type="text/css" rel="stylesheet">

<!-- 竖状折叠菜单 -->
<link href="css/manage_menu.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<script src="${ctx}/js/js_meetmanage.js"></script>


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

</STYLE>

<script type="text/javascript">

	function selectChannel() {
		 console.log("meet detail app");
	}
	
	function downfile(obj) {
		 console.log(obj.id);
		 console.log('//////////////////downfile ');
		 alert('请联系管理员');
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
	<div>
	<br>
	 &nbsp;&nbsp;<a href="${ctx}/index.jsp" >首页</a>  
	 &nbsp;&nbsp;
	 <br><br>
	</div>
	
	 <ul class="con_ul">
  <li>
  <div class="title">
  会诊实时数据
  </div>
  <div class="con">
<div id="data_table_one">

		</div>
		
			<div class='meet_item_User' id='meetinfo_div' >
			 <br>
				<div class='meet_item_p1'>
				 
				</div>
				<div class='meet_item_p2'>
					
				</div>
			</div>	
</div>  
  </li>
   </ul>
   
		<br>		<br>		<br>		<br>

 		<br>		<br>		<br>		<br>
<script type="text/javascript">
 $(function () {
	 
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
 </script>

<!-- select COUNT(user_id) from appointment_user GROUP BY appointment_id 

select `appointment_user`.`appointment_id` AS `appointment_id`,
count(`appointment_user`.`user_id`) AS `COUNT(user_id)`,
count(`appointment_user`.`assistant_id`) AS `count(``appointment_user``.``assistant_id``)`,
count(user_role =`汇报人` ) AS `report`,
count(user_role =`专家` ) AS `expert`,
 from `appointment_user` group by `appointment_user`.`appointment_id`

SELECT * from v_meetinfo LEFT JOIN v_meetinfo_role ON v_meetinfo.appointment_id = v_meetinfo_role.meet_id

SELECT * from (v_meetinfo LEFT JOIN v_meetinfo_role ON v_meetinfo.appointment_id = v_meetinfo_role.meet_id)
 LEFT JOIN v_meetinfo_expert ON  v_meetinfo.appointment_id = v_meetinfo_expert.meetid_3
-->
			 
</BODY>
</HTML>
