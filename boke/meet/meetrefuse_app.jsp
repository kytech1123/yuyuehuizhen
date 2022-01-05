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

<link href="${ctx}/css/footer.css" rel="stylesheet" type="text/css" >

<link href="${ctx}/css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/bottom_navig.css" type="text/css" rel="stylesheet">

<link href="${ctx}/css/detailview_app.css" type="text/css" rel="stylesheet">

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
input{
	margin:5px;
	font-size:18px;
}
form{
	padding:15px;
}
input[type="checkbox"]{
    vertical-align:middle;
    margin-top:0;
    background:#fff;
    border:#999 solid 1px;
    border-radius: 3px;
    min-height: 22px;
    min-width: 22px;
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
	 位置：<span id="menuname"></span> &nbsp;&gt;

 &nbsp;&nbsp;<a 
		 	 href="${ctx}/meet_findoneManageMyMeet.do?reqfrom=app&id=${param.id}&handle=${param.handle}"
		 	   >&nbsp;会诊详情&nbsp;</a>
		 	   
		 	   &nbsp;&gt;会诊操作
	</div>	
	 <br>
 <form action="#">
 <br>
 <%	String userName=request.getParameter("userName") ;
    if(  userName != null )
    {
    	out.print( "取消专家:"+userName);
    	out.print( "<input type=hidden id='userId' value="+
    		request.getParameter("userId")+">");
    }
 %>
  填写原因:
 
  <br>
  <br>
  <input name="refuse_check" type="checkbox" value="时间冲突" />时间冲突 <br>
	<input name="refuse_check" type="checkbox" value="科室不符" />科室不符 <br>
	<input name="refuse_check" type="checkbox" value="临时有事" />临时有事 <br>
	<input name="refuse_check" type="checkbox" value="临时有事" />推荐新会诊专家 
	&nbsp;<a class="item_edit_a"
	  href="${ctx}/user_roleselcet.do?meetid=${param.id}&menutype=addexpert&reqfrom=app">
	  &nbsp;&nbsp;添加会诊专家&nbsp;&nbsp;</a>
	  <br>
	 其他原因：<input id="refuse_reason" >
	<br>
	<br>
	
		<a	class="item_edit_a" 	
				id="${ctx}/meet_updaterole.do?reqfrom=app&id=${param.id}&handle=refuse"
				onclick="sendrefuse(this)" >
				&nbsp;&nbsp;拒绝&nbsp;&nbsp;</a>
					&nbsp;&nbsp;&nbsp;
					
	&nbsp;&nbsp;<a class="item_edit_a"
		 	 href="${ctx}/meet_findoneManageMyMeet.do?reqfrom=app&id=${param.id}&handle=${param.handle}"
		 	   >&nbsp;返回&nbsp;</a>
		 	   
	<br>
 </form>
	<br>
	<br>
	<br>
 
 <form>
给发起人私信：<input>
<a	class="item_edit_a" >发送</a>
 </form>
  
 <br>
 	 <br>
	 <br>
	 <br>
 	<script>
	 	var str;
	 	var is_Start = $('#handle').val() == 'mystart' ? 1: 0;
	 	str =	(is_Start== 1) ? '我汇报的': '我接收的';
	 	
	 	$('#menuname').html(str );
	 	
	 	//关闭菜单：同意、拒绝
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
	 	 
	 	////////////////////// tool function
	 	function sendrefuse(obj)
	 	{
	 		var reason='';
	 		$("input[name='refuse_check']:checkbox").each(function () {
				console.log($(this).is(":checked") );	 			
                if ($(this).is(":checked") ) {
                	reason += $(this).attr('value') + ',';
                }
            });
	 		
	 		reason+=$('#refuse_reason').val();
	 		
	 		console.log( 'sendrefuse' ); 
	 		var target=obj.id +'&extprop=refuse_reason:'+ reason; // tomcat8 不带{}
	 		
	 		//2021.10.8 取消谁
	 		var userid= $('#userId').val();
	 		if ( userid!=""&& userid!=null && userid!= undefined)
	 		{
	 			target += '&userId='+ userid;
	 		}
	 		console.log( 'server:'+ target ); 
 	 		window.location.href=target ;
	 	}	
	 </script>
	 <br>
	 <br>
	 <br>
	 <br>
	 &nbsp;
</BODY>
</HTML>
