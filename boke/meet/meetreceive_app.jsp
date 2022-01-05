<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>会诊列表</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">


<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

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
.meet_item_receive{
    margin：10px;
    padding：10px;
   	border: 2px solid green;
   	border-radius: 10px;
    height:160px
   }
   
   .meet_item_p1{
    padding：5px;
   	float:left;
   }
   .meet_item_p2{
   	float:right;
   }
/* 	CSS BUTTON  详情 同意 拒绝 */
.item_edit_a{
	padding：10px;
	background-color: #6b6;
	color: #fff;
	text-decoration: none;
}
.view_item_deal{
	margin-left:150px;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("meet list_app");
	}
</script>


</head>

<BODY onload="selectChannel();">
<!--  导航 -->
<%@ include file="../nag.jsp" %>

<br>
<br>
<br>
<div>
	<br>
	 &nbsp;&nbsp;<a href="${ctx}/meet_findall.do?reqfrom=app&handle=mystart" >我汇报的</a> 
	 &nbsp;&nbsp;<a href="${ctx}/meet_findall.do?reqfrom=app&handle=myreceive" >我收到的</a>
	 <br><br>
	 
<!-- 	 判断当前是发起，还是接收 -->
	 <input type="hidden" id="handle" value="${handle}" />
	 位置：<span id="menuname"></span>
	 	 
	 <br>&nbsp;
	</div>

<!-- 	local css -->
		<s:iterator value="#meetlist" var="item_data" status="st">
			<div class='meet_item_receive'>
				<div class='meet_item_p1'>

					<span id="view_item">${item_data.doctorName  }</span>
					&nbsp; <span
						id="view_item">${item_data.doctorPhone  }</span> 
						
						<br> 会诊时间：&nbsp;<span
						class="view_item_applyTime">${item_data.applyTime  }</span>
						&nbsp;${item_data.applyBeginTime  }-${item_data.applyEndTime  }
						<br> 会诊标题：&nbsp;
						 <span	id="view_item">${item_data.title  } </span>
						 	<br> 会诊内容：&nbsp;
					<span id="view_item">${item_data.content}</span>
					<br>
					汇报数：<span id="view_item">${item_data.reportNum  } </span> 
					&nbsp;专家数：<span	id="view_item">${item_data.expertNum  } </span>
					<br>
<%-- 					&nbsp;群爱会诊期次：<span	id="view_item">${item_data.qaMeetNum  } </span>  --%>
<span class="view_item_deal"
					 id="<s:property value='#st.index'/>">处理状态:&nbsp;${item_data.reserve1 }</span>
				</div>
				
				<div class='meet_item_p2'>
					 
		&nbsp;&nbsp;<a class="item_edit_a"
		 	 id="${ctx}/meet_findoneManageMyMeet.do?reqfrom=app&id=${item_data.id}"
		 	 onclick="opendetail(this)" >&nbsp;详情&nbsp;</a>
					&nbsp;&nbsp;&nbsp;
					
					<a	href="${ctx}/meet_findoneManage.do?reqfrom=app&id=${item_data.id}">&nbsp;管理&nbsp;</a>
					&nbsp;&nbsp;&nbsp;
					
		<span class="agree_refuse_span">					
		<a class="item_edit_a" 	id="btn1"
			href="${ctx}/meet_updaterole.do?reqfrom=app&id=${item_data.id}&handle=agreemeet">&nbsp;同意&nbsp;</a>
					&nbsp;&nbsp;&nbsp;
		<a class="item_edit_a" 	id="btn_no_<s:property value='#st.index'/>"
			href="${ctx}/meet/meetrefuse_app.jsp?reqfrom=app&id=${item_data.id}&handle=refuse">&nbsp;拒绝&nbsp;</a>
					&nbsp;&nbsp;&nbsp;
		</span>
				</div>
			</div>
		</s:iterator>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<script>
		// 数据修订
		$('.view_item_applyTime').text(function(i,t){
				return t.slice(0,10);	
			});
	
		/////////////////////// 菜单类型
	 	var str;
	 	str = $('#handle').val() == 'mystart' ? '我汇报的': '我收到的';
	 	var is_Start = $('#handle').val() == 'mystart' ? 1: 0;
	 	
	 	$('#menuname').html(str );
	 	
	 	function opendetail(obj)
	 	{
	 		console.log( 'detial '+ $('#handle').val());
	 		console.log( obj.id ); //id临时存放目的网址
 	 		window.location.href= obj.id +'&handle='+ $('#handle').val();
	 	}	 
	 	
	 	
	 	
 		//如果是我发起的，关闭菜单：同意、拒绝
	 	if(is_Start== 1 )
	 	{
	 		
	 		$('.agree_refuse_span').hide();
	 		
	 		//如果是我发起的，关闭处理状态
	 		$('.view_item_deal').hide();
	 	}
	 	else
	 	{
	 		//如果是我接收的
	 		console.log(  $('.view_item_deal').text() );
	 		 $('.view_item_deal').text(function(i, text_origin){
	 			if(text_origin == '处理状态:已同意')
	 	 		{
	 				var btn_id='#btn_no_'+ this.id;
	 	 			$(btn_id).text('再次取消');
	 	 		}
	 		 } );
	 		
	 		
	 	}
	 </script>
			 
</BODY>
</HTML>
