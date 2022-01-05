<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>发起预约</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link rel="stylesheet" type="text/css" href="css/footer.css">

<link href="${ctx}/css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/bottom_navig.css" type="text/css" rel="stylesheet">

<link href="${ctx}/css/detailview_app.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
<script src="js/My97DatePicker/WdatePicker.js"></script>

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
	
var ctx='/boke';
function sel_role()
{
	var id=$('#view_item_id').text();
	//给当前这一单，添加专家
	 var url= ctx+'/user_roleselcet.do?meetid='+ id+'&menutype=addexpert&reqfrom=app' ;

	 console.log(url);
	 window.location.href = url;	//跳转到自己选择专家
}

function meet_finish()
{
	alert('请等待群爱客服联系专家。点击确定，回到会诊大厅列表。');
	// 跳转到会诊大厅
	window.location.href =ctx +'/meet_findall.do?reqfrom=app';
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
		
		
	
	
		
		<DIV >

				<div class="datalist_item">
		<div><span id="view_item_id">${item_data.id  }</span></div>					 
		<div><span id="view_item">${item_data.doctorName  }</span></div>					 
		<div><span id="view_item">${item_data.doctorPhone  }</span></div>					 
		<div><span id="view_item_applyTime">${item_data.applyTime  }</span></div>					 
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
	<script type="text/javascript">
 $(function () {
	 
	 //数据修改
	 var time = $("#view_item_applyTime").text();
	 time= time.substr(0,10);	//只保留日期
	 console.log("info meet: "+time);
	 $("#view_item_applyTime").text( time);
	 
	 //
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

	 
 });
</script>				
				 
			 
</BODY>
</HTML>
