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

/* 我接收的会诊  2021.9.14 */
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
/* 	CSS BUTTON 同意 拒绝 */
.item_edit_a{
	padding：10px;
	background-color: #6b6;
	color: #fff;
	text-decoration: none;
}
/* 	CSS BUTTON 发起人取消专家 2021.10.8 */
.item_edit_cancel{
	padding：10px;
	margin：10px;
	background-color: #6b6;
	color: #fff;
	text-decoration: none;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("meet detail app");
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
	 &nbsp;&nbsp;<a href="${ctx}/meet_findall.do?reqfrom=app&handle=myreceive" >我接收的</a>
	 <br><br>
	 <!-- 	 判断当前是发起，还是接收 -->
	 <input type="hidden" id="handle" value="${handle}" />
	 位置：<span id="menuname"></span> &nbsp;&gt;会诊详情
	
	 
	 
	</div>	


		<table id="data_table_one">
		</table>
		
		<DIV >

				<div class="datalist_item">
		<div><span id="view_item">${item_data.id  }</span></div>					 
		<div><span id="view_item">${item_data.doctorName  }</span></div>					 
		<div><span id="view_item">${item_data.doctorPhone  }</span></div>					 
		<div><span id="view_item">${item_data.applyTime  }</span></div>					 
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
		if( item_label_ar[i] == '预约时间')
		{
			origText= origText.slice(0,10);
		}
		else if( item_label_ar[i] == '状态')
		{
			origText= '';
		}
		 
			// 表格添加内容
		 $("#data_table_one").append("<tr><td>"+ item_label_ar[i] +"</td><td>"+origText +"</td></tr>");
			
			console.log("text"+i);
	        return  item_label_ar[i]+":"+origText ; 
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
});
</script>			
	
	&nbsp;会诊人员：			 
		<table  id="role_table">
<s:iterator value="#meet_rolelist" var="role_data"
				status="st">
		<tr id="row<s:property value='#st.index'/>">
		
<%-- 		<td><span id="view_item">${role_data.appointmentId  }</span></td> --%>
		<td><span id="view_item"><s:property value="#st.index + 1" /> </span>		</td>	 
		<td>
		<span class="view_item_role"  
		id="role_<s:property value='#st.index'/>">${role_data.userRole  }</span>		
		:
		<span id="view_item">${role_data.userName  }</span>
		[<span id="view_item">${role_data.userId  }</span>]
		<br>
		<!-- 		取消TA -->
		<span id="pass_<s:property value='#st.index'/>">
		<a class="item_edit_cancel" 	
		 href="${ctx}/meet/meetrefuse_app.jsp?reqfrom=app&id=${item_data.id}&handle=refuse&userId=${role_data.userId}&userName=${role_data.userName }"
		 >取消TA</a>
		</span>
				</td>		 
		<td><span class="view_item_remark"
		 id="<s:property value='#st.index' />">${role_data.remarks  }</span>		</td>		 
		<td><span id="view_item">&nbsp;医助:</span><br>	
		<span id="view_item">${role_data.assistantName  }</span>	</td> 
			</tr>
	</s:iterator>
</table >

	 <br>
	 	&nbsp;&nbsp;&nbsp;
	 	<a class="item_edit_a" 		href="${ctx}/meet_updaterole.do?reqfrom=app&id=${item_data.id}&handle=agreemeet">
	 	&nbsp;&nbsp;同意&nbsp;&nbsp;</a>
					&nbsp;&nbsp;&nbsp;
<!-- 		<a	class="item_edit_a" 	 -->
<%-- 				href="${ctx}/meet_updaterole.do?reqfrom=app&id=${item_data.id}&handle=refuse"> --%>
<!-- 				&nbsp;&nbsp;拒绝&nbsp;&nbsp;</a> 
 	id=会诊编号
-->
 <a	class="item_edit_a" 	
				href="${ctx}/meet/meetrefuse_app.jsp?reqfrom=app&id=${item_data.id}&handle=refuse">
				&nbsp;&nbsp;拒绝&nbsp;&nbsp;</a>
					&nbsp;&nbsp;&nbsp;
	 <br>
	 <br>
	 <br>
 	<script>
	 	var str;
	 	var is_Start = $('#handle').val() == 'mystart' ? 1: 0;
	 	str =	(is_Start== 1) ? '我汇报的': '我接收的';
	 	
	 	$('#menuname').html(str );
	 	
	 	//如果是我发起的,关闭菜单：同意、拒绝
	 	if(is_Start== 1 )
	 	{
	 		$('.item_edit_a').hide();
	 	}
	 	
	 	 //2021.9.25 隐藏已拒绝
		$('.view_item_remark').text(function(i,origText){
			if( origText =='已拒绝' )
				{
					var rowid= this.id;
					$('#row'+rowid).hide();
				}
		});	
	 	 
		 //2021.10.8 取消专家
		$('.view_item_role').text(function(i,origText){
			console.log(origText );
					
			if( origText =='汇报人' )
				{
					var txt= this.id;	// role_xx
					var rowid= txt.replace(/role_/,"");
					console.log( txt +","+rowid);
					$('#pass_'+rowid).hide();
				}
		});
	 </script>
	 <br>
	 <br>
	 <br>
	 <br>
	 &nbsp;
</BODY>
</HTML>
