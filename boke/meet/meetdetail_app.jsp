<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>会议详情</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link rel="stylesheet" type="text/css" href="css/footer.css">

<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">

<link href="css/detailview_app.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

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
		 console.log("meet detail app");
	}
</script>


</head>

<BODY onload="selectChannel();">

<BODY onload="selectChannel();">
<!--  导航 -->
<%@ include file="../nag.jsp" %>

<br>
<br>
<br>

	<div>
	<br>
	 &nbsp;&nbsp;<a href="${ctx}/meet_findall.do?reqfrom=app" >会诊大厅</a> &gt;会诊详情：
	 <br><br>
	</div>
		<table id="data_table_one">
		</table>
		
		<DIV >

				<div class="datalist_item">
		<div><span id="view_item">${item_data.id  }</span></div>					 
		<div><span id="view_item">${item_data.doctorName  }</span></div>					 
		<div><span id="view_item">${item_data.doctorPhone  }</span></div>					 
		<div><span id="view_item" class="applyTime" >${item_data.applyTime  }</span></div>					 
		<div><span id="view_item">${item_data.dispatchTime  }</span></div>					 
		
		<div><span id="view_item">${item_data.applyBeginTime  }</span></div>
		<div><span id="view_item">${item_data.applyEndTime  }</span></div>					 
		<div><span id="view_item">${item_data.title  }</span></div>					 
		<div><span id="view_item">${item_data.content  }</span></div>					 

		<div><span id="view_item">${item_data.files  }</span></div>	
		<div><span id="view_item">${item_data.reportNum  }</span></div>					 
		<div><span id="view_item">${item_data.expertNum  }</span></div>					 
		<div><span id="view_item">${item_data.qaMeetNum  }</span></div>					 

		<div><span id="view_item">${item_data.status  }</span></div>					 
<!-- 			<div>&nbsp;<a href="javascript:void(0);">&nbsp;编辑&nbsp;</a></div>	 -->
			</div>					 

		</DIV>
		<br>
		<br>
		<br>
		<br>

 		<br>
		<br>
		<br>
		<br>
		
		<script>
$(function(){
	console.log('aa');
	
	$('.applyTime').text( function (i, t){
		console.log(t);
		return t.slice(0,10);
	});
});
</script>	

	<script type="text/javascript">
 $(function () {
	 var item_css_w="50,100,150,200,200,200,"
	 			+"200,50,50,50,50,"
	 			+"80,80,80,80";
	 var item_label="会诊编号,发起人姓名,发起人电话,预约时间,填表时间,实际开始时间,结束时间,"
	 			+"标题,主诉内容,病例文件,汇报人数量,会诊专家数量,群爱期次,状态";
		
	 var item_ar=$('.datalist_item div');
	 
	 console.log(item_ar);
	 
	 var i=0;
	 var item_css_w_ar = item_css_w.split(",");
	 var item_label_ar = item_label.split(",");
	 
	 // 修改UI文字
	 i=0;
	 $(".datalist_item div").text(function(i,origText){
			// 表格添加内容
		 $("#data_table_one").append("<tr><td>"+ item_label_ar[i] +"</td><td>"+origText +"</td></tr>");
		 	
			
			console.log("text"+i);
	        return  item_label_ar[i]+":"+origText ; 
	        i++;
	    });
	 // CSS设置
	 // 隐藏
	 $(".datalist_item").hide();
	 $("#data_table_one tr td:first-child").css("text-align", "right");
	 $("#data_table_one tr td:first-child").css("padding", "5px");
	 
	 i=0;
	 $('.datalist_item div').each(function(){
	        //$(this).css("width",item_css_w_ar[i]+"px");
// 	        $(this).css("float", "none");
	        i++;
	        if(i>= item_css_w_ar.length)
	        	i=0;
	    });
	 //////////////// css
	 //$('.main_ul').css("list-style","none");
	 //$('.datalist_item div').css("width","50px");
	 
	 
// 	 alert("2021.8.27 软件会议");
});
</script>			
		
	 
			 
</BODY>
</HTML>
