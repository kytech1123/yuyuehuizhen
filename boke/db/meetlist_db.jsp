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
body{
	margin:0px;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("meet list_app 1208 -2");
		 console.log("-- "+window.location.href);
	}
</script>


</head>

<BODY onload="selectChannel();">
<!--  导航 -->
<%@ include file="../nag.jsp" %>

<br>
<br>
<br>
<br>
<br>
<br>
<br>

<div class="dui-container">
<div class="search">
	<form class="meet-search-form" method="get"  >
        <!--输入框-->
            <!--autoFocus-->
            <div>
               <input type="text" autocomplete="off"
                       placeholder="输入姓名/医院/科室" />
            <input type="submit" class="enter-btn"  value="查询"/>
        </div>
    </form>
 	<form class="meet-search-form" method="get"  >
      <select>
		<option value="">地区</option>
		<option value="">陕西</option>
		<option value="">山西</option>
		<option value="">上海</option>
		</select>
		<select>
		<option value="">医院</option>
		<option value="">山西医科大学第一医院</option>
		<option value="">西京医院</option>
		<option value="">运城同德医院</option>
		</select>

		<select>
			<option value="">排序方式</option>
			<option value="">时间</option>
			<option value="">会议状态</option>
		</select>
		<select>
		<option value="">状态</option>
		<option value="">未开始</option>
		<option value="">进行中</option>
		<option value="">已结束</option>
		</select>
    </form>
    <br>&nbsp;
</div>
</div>
		<s:iterator value="#meetlist" var="item_data" status="st">
			<div class='meet_item'>
				<div class='meet_item_p1'>

					<span id="view_item">${item_data.doctorName  }</span>
					&nbsp; &nbsp;<span
						id="view_item" class="applyTime">${item_data.applyTime  }</span>
						&nbsp;${item_data.applyBeginTime  }-${item_data.applyEndTime  }
						
						
						<br> 会诊[<span class="view_item_meetid">${item_data.id  }</span>] 
						&nbsp;&nbsp;
						标题： <span	id="view_item">${item_data.title  } </span>
						<br> 科室：<span	id="view_item">${item_data.majors  } </span>
						 	<br> 内容：&nbsp;
					<span id="view_item">${item_data.content}</span>
					<br>
					汇报数：<span id="view_item">${item_data.reportNum  } </span> 
					&nbsp;,<span>汇报人医助：
					<span class='reportHelp'	id="view_item">${item_data.reportHelp  }</span> </span>
					
					<br><span>专家数：<span class='expertNum'	id="view_item">${item_data.expertNum  }</span>
					</span>
					&nbsp;,
					<span>专家医助：<span class='expertHelp'	 id="view_item">${item_data.expertHelp  }</span> 
					</span>
					&nbsp;期次：<span	id="view_item">${item_data.qaMeetNum  } </span> 

				</div>
				
				<div class='meet_item_p2'>
				<br>
					<a href="${ctx}/meet_findone.do?reqfrom=app&id=${item_data.id}">&nbsp;详情&nbsp;</a><br>
					<br>
		<a	href="${ctx}/meet_findoneManage.do?reqfrom=app&id=${item_data.id}">&nbsp;管理&nbsp;</a>
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
$(function(){
	
	$('.applyTime').text( function (i, t){
		return t.slice(0,10);
	});
	
	// 会议号 后5位
	$('.view_item_meetid').text( function (i, t){
		return t.slice(-5);
	});
	
	console.log('汇报人没有医助');
	// 汇报人没有医助
	$('.reportHelp').text ( function (i, t){
		console.log(i+','+t);
		
		if( t == '0' || t=='')
		{
			
			$(this).parent().css({  'background-color': '#393','color':'#fff'});
			return '0';
		}
		return t;
	});
	//expertNum
	$('.expertNum').text ( function (i, t){
		console.log(i+','+t);
		
		if( t == '0' || t=='')
		{
			
			$(this).parent().css({   'background-color': '#f00','color':'#fff'});
			return '0';
		}
		return t;
	});
	
	$('.expertHelp').text ( function (i, t){
		console.log(i+','+t);
		
		if( t == '0' || t=='')
		{
			
			$(this).parent().css({   'background-color': '#393','color':'#fff'});
			return '0';
		}
		return t;
	});
});

</script>
			 
</BODY>
</HTML>
