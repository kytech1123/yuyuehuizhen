<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>添加专家</title>

<base href="http://localhost:8080/boke/"></base>


<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link rel="stylesheet" type="text/css" href="css/footer.css">

<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">

<link href="css/detailview_app.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
<script src="js/My97DatePicker/WdatePicker.js"></script>

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
/* 2021.9.7 form css */
input{
	font-size: 18px;
	width:200px;
	padding: 5px;
	margin: 5px;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("meet add app");
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
	 &nbsp;&nbsp;会诊详情：
	 <br>
	</div>
	<%
		String ss_info= (String)session.getAttribute("act_ss_info");
		if(  ss_info !=null && ss_info.equals("nologin"))
		{
			session.setAttribute("act_ok_info", "请您先登录");
			session.setAttribute("act_ok_text", "点击返回");
			session.setAttribute("act_ok_href", "index.jsp");
			response.sendRedirect("act_ok_app.jsp");
		}
	%>
	
	<script type="text/javascript">
function sel_role()
{
	var id=$('#view_item_id').text();
	//给当前这一单，添加专家
	 var url= 'user_roleselcet.do?meetid='+ id+'&menutype=addexpert&reqfrom=app' ;

	 console.log(url);
	 window.location.href = url;
}

function meet_finish()
{
	// 跳转到会诊大厅
	window.location.href = 'meet_findall.do?reqfrom=app';
}
</script>

<br>&nbsp;下一步：	<br>
			&nbsp;&nbsp;&nbsp;<input  id="sub_btn" type="button"
			 onclick="meet_finish()" value="群爱客服联系专家"/>
		<br>
		&nbsp;&nbsp;&nbsp;<input  id="nextrole" type="button" 
		onclick="sel_role()" value="自己选择会诊专家"/>
		
<!-- 		/////////////////////////////////// 新增会诊详情 ///////////// -->
		<table id="data_table_one">
		</table>
		
		
	
	
		
		 
				 		
				 
			 
</BODY>
</HTML>
