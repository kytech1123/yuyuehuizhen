<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>医生详情</title>


<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link href="${ctx}/css/footer.css"  rel="stylesheet" type="text/css" >

<link href="${ctx}/css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/bottom_navig.css" type="text/css" rel="stylesheet">


<link rel="stylesheet" type="text/css" href="css/video.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link href="${ctx}/css/data_detail.css" type="text/css" rel="stylesheet" />


<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 2021.10.14 时间处理 -->
<script src="${ctx}/js/jstime.js"></script>
<script src="${ctx}/js/jsconfig.js"></script>
<script src="${ctx}/js/jsdata.js"></script>

<!-- 2021.10.22 对话框 -->
<script src="${ctx}/js/js_dialog_schedule1116.js"></script>
<!-- 2021.11.16 日程表 -->
<script src="${ctx}/js/js_schedule/js_schedule_edit_send15.js"></script>
<script src="${ctx}/js/js_schedule/js_date1115.js"></script>
<script src="${ctx}/js/js_schedule/js_schedule_read_view.js"></script>

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
#topmenu
{
	font-size:20px;
}
.index_icon
{
	width: 80px;
}
.detail_item div
{
	float:left;
	font-size:20px;
	margin-left:3px;
}
.info_ui
{
	clear: both;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("userdetail");
	}
</script>

</head>

<BODY onload="selectChannel();">

<!--  导航 -->
<%@ include file="../nag.jsp" %>

<%
	// 添加会诊专家
	// 读取当前登录用户信息 
	SysUser ssUser=SessionUtils.getUserFormSession(request);
	String utype="err";
	String uname="errname";
	String uid="err_id";
	if(ssUser!=null )
	{
		utype=ssUser.getUsertype();
		uname = ssUser.getName();
		uid= ssUser.getId();
	}
	out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
// 	out.print("<input type='hidden' id='ssuserid' value='"+ uid +"'>");						
					
		
%>
	<div>
	<br> <br> <br>
	<br> <br> <br>
	<span id="topmenu">&nbsp;医生详情：</span>
	<br> <br> <br>
	</div>
		<DIV >

				<div class="detail_item">
	
				<div >
					<span id="user_item"><img class="index_icon" src="images/user_icon.png">
					</span>
			</div>					 
				<div>
				姓名：<span id="user_item">${item_data.name}</span>
				<br>编号:
				<span id="user_item">${item_data.id}</span>
				<input type='hidden' id='ssuserid' value='${item_data.id}'>
				</div>					 
<!-- 				<div> -->
<%-- 				用户类型：<span id="user_item">${item_data.usertype}</span></div>					  --%>
				<div>
				医院：<span id="user_item">${item_data.companyId}</span></div>					 
				<div>
				科室：<span id="user_item">${item_data.officeId}</span></div>					 
				<div>
				职称：<span id="user_item">${item_data.level}</span></div>					 
				
				<div class='info_ui'>
				擅长疾病：<span id="user_item">${item_data.major}</span></div>					 
				
				<div class='info_ui'>
				个人简介：<span id="user_item">${item_data.resume}</span></div>					 

				
				<div class='info_ui'>
				E-mail:<span id="user_item">${item_data.email}</span></div>					 
				<div class='info_ui'>
				电话：<span id="user_item">****</span></div>					 
				<div class='info_ui'>
				微信：<span id="user_item">****</span></div>	
<!-- 				<div class='info_ui'> -->
<%-- 				电话：<span id="user_item">${item_data.phone}</span></div>					  --%>
<!-- 				<div class='info_ui'> -->
<%-- 				微信：<span id="user_item">${item_data.wechat}</span></div>	 --%>
								 
<!-- 			<div>&nbsp;<a href="javascript:void(0);">&nbsp;编辑&nbsp;</a></div>	 -->
			</div>					 


		</DIV>

		<div style='clear:both;font-size:20px;'>
		<br>
		日程安排表（点击格子可以编辑日程）：
<table id='schedule'>
	<tr>
	<td id='time' width='40px'></td>
			<td  id='datecol0' class='daterow'>11/08</td>
			<td  id='datecol1' class='daterow'>11/09</td>
			<td  id='datecol2' class='daterow'>11/10</td>
			<td  id='datecol3' class='daterow'>11/11</td>
			<td  id='datecol4' class='daterow'>11/12</td>
			<td  id='datecol5' class='daterow'>11/13</td>
	</tr>
	<tr>
	<td id='time'></td>
		<td  class='dayrow' >周一</td>
		<td  class='dayrow'  id='col2'>周二</td>
		<td  class='dayrow' id='col3'>周三</td>
		<td  class='dayrow' id='col4'>周四</td>
		<td  class='dayrow' id='col5'>周五</td>
		<td  class='dayrow'  id='col6'>周六</td>
	</tr>
	<tr>
		<td id='time'>08:00-09:00</td>	<td class='itema1'>-</td>	
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>
	</tr>
	<tr>
		<td id='time'>09:00-10:00</td>	<td class='itema1'>-</td>	
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>
	</tr>
	<tr>
		<td id='time'>10:00-11:00</td>	<td class='itema1'>-</td>	
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>
	</tr>
	<tr>
		<td id='time'>11:00-12:00</td>	<td class='itema1'>-</td>	
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>
	</tr>
	<tr>
		<td id='time'>14:00-15:00</td>	<td class='itema1'>-</td>	
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>
	</tr>
	<tr>
		<td id='time'>15:00-16:00</td>	<td class='itema1'>-</td>	
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>
	</tr>
	<tr>
		<td id='time'>16:00-17:00</td>	<td class='itema1'>-</td>	
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>
	</tr>
	<tr>
		<td id='time'>17:00-18:00</td>	<td class='itema1'>-</td>	
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>
	</tr>
	<tr>
		<td id='time'>18:00-19:00</td>	<td class='itema1'>-</td>	
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>
	</tr>
	<tr>
		<td id='time'>20:00-21:00</td>	<td class='itema1'>-</td>	
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>	<td class='itema1'>-</td>
		<td class='itema1'>-</td>
	</tr>
</table>
		</div>

<div style='clear:both;font-size:20px;'>
<br><br>
<br><br>
<br><br>
<br><br>
</div>
<script type="text/javascript">
	//////////////////////////
 $(function () {
	 
	 SetGridId();
	 SetDateView();
	 
	 freshCss();
	 ///////////////////////////////////////////////////// 读取日程表
	readall();
	 
	 ///////////////////////////////////////////////////// 编辑功能
	 function edit_data(id, val)
	 {
		 var index_date = parseInt( id.slice(-1) );	//y_x 第几行 第几列
		 
		 str='';
		 str += 'userid='+ $('#ssuserid').val();
		 str += '&username='+ $('#ssusername').val() ;
		 str += '&gridvalue='+ val;	
		 str += '&rowid='+ id.slice(0,1);	// 第几行
		 str += '&scheduledate=2021-'+ $('#datecol'+index_date ).html();
		 return str;
	 }
	 // 点击弹出框按钮的事件处理程序
	 function test() {
			console.log( 'ret_val:'+ $.MsgBox.ret_val );
			console.log( 'grid click:'+ $.MsgBox.param  );	// 格子id
			if( $.MsgBox.ret_val == 'ok')
			{
				sendschedule(ctx,  edit_data($.MsgBox.param, '1') );// work 1
			 	//$(this).html('出诊');
			 	console.log('////////////-- set data 1');
			}
		 	else if(  $.MsgBox.ret_val  == 'cancel' )
			 {
		 		sendschedule(ctx,  edit_data($.MsgBox.param, '2') ); //nodisturb 2
			 	console.log('////////////-- set data 2');
			 }
		 	else if(  $.MsgBox.ret_val  == 'mb_btn_no3btn' )
			 {
		 		sendschedule(ctx,  edit_data($.MsgBox.param, '0') ); //clear 0
			 	console.log('////////////-- set data clear');
			 }
			//
			setTimeout("updatechedule()", 200);
		}
	 
	 /////////////// 单击格子
	 var r;
	 $('.itema1').click(function(){
		 
		 r='err';
		 
		 console.log( this.id); 
		 $.MsgBox.param = this.id;  	//哪个格子被点击
		 $.MsgBox.ret_val='err_ret';
		 r= $.MsgBox.ConfirmBtn3("设置时间段", "1.出诊;2.免打扰。点击右上角关闭", '1-出诊','2-免打扰','3-清除', test );
		
	 });
           
});
</script>			
				 
			 
</BODY>
</HTML>
