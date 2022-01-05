<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<title>会议详情</title>
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
		 console.log("user_list");
	}
</script>

<link href="${ctx}/css/data_detail.css" type="text/css" rel="stylesheet" />

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

</head>

<BODY onload="selectChannel();">
	<div>
	<br>
	</div>
		<DIV >

				<div class="datalist_item">
				
				<div><span id="user_item">${item_data.usertype}</span></div>					 
				<div><span id="user_item">${item_data.companyId}</span></div>					 
				<div><span id="user_item">${item_data.officeId}</span></div>					 
				<div><span id="user_item">${item_data.level}</span></div>					 
				<div><span id="user_item">${item_data.major}</span></div>					 
				
				<div><span id="user_item">${item_data.resume}</span></div>					 
				<div><span id="user_item">${item_data.loginName}</span></div>					 
				<div><span id="user_item">${item_data.password}</span></div>					 
				<div><span id="user_item">${item_data.no}</span></div>					 
				<div><span id="user_item">${item_data.name}</span></div>					 
				
				<div><span id="user_item">${item_data.email}</span></div>					 
				<div><span id="user_item">${item_data.phone}</span></div>					 
				<div><span id="user_item">${item_data.mobile}</span></div>					 
				<div><span id="user_item">${item_data.wechat}</span></div>	
								 
<!-- 			<div>&nbsp;<a href="javascript:void(0);">&nbsp;编辑&nbsp;</a></div>	 -->
			</div>					 

		</DIV>
	<script type="text/javascript">
 $(function () {
	 var item_css_w="100,150,200,200,200,"
	 			+"200,50,50,50,50,"
	 			+"80,80,80,80";
	 var item_label="发起人姓名,发起人电话,预约时间,填表时间,实际开始时间,结束时间,"
	 			+"标题,主诉内容,病例文件,汇报人数量,会诊专家数量,群爱期次,状态";
		
	 var item_ar=$('.datalist_item div');
	 
	 console.log(item_ar);
	 
	 var i=0;
	 var item_css_w_ar = item_css_w.split(",");
	 var item_label_ar = item_label.split(",");
	 
	 i=0;
	 $(".datalist_item div").text(function(i,origText){
		 	console.log("text"+i);
	        return  item_label_ar[i]+":"+origText ; 
	        i++;
	    });
	 
	 i=0;
	 $('.datalist_item div').each(function(){
	        //$(this).css("width",item_css_w_ar[i]+"px");
	        $(this).css("float", "none");
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
