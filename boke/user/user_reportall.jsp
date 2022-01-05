<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>反馈和建议</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />

<link    href="${ctx}/css/footer.css" rel="stylesheet" type="text/css">

<link href="${ctx}/css/index.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/meet.css" type="text/css" rel="stylesheet">
<link href="${ctx}/css/bottom_navig.css" type="text/css" rel="stylesheet">

<!-- 竖状折叠菜单 -->
<link href="${ctx}/css/friend_list.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 2021.10.14 时间处理 -->
<script src="${ctx}/js/jstime.js"></script>
<script src="${ctx}/js/jsconfig.js"></script>
<script src="${ctx}/js/jsdata.js"></script>


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
.msgtip
{
	float:left;
	border-radius:13px;
	background-color: #f00;
	color: #fff;
	font-size:16px;
	width: 30px;
	height: 30px;
}
#friend{
	clear:both;
	border-top:2px solid #6b6;
}
.index_icon{
	width: 50px;
	height: 50px;
}
form{
	font-size:20px;
	padding: 10px;
}
input{
	font-size:20px;
	margin: 8px;
}
select{
	font-size:18px;
}
button{
	font-size:18px;
}
option{
   		font-size: 16px;
   }
#meetAddrOther{
	display:none;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("meet set ----  app");
	}
	function back() {
		 console.log("meet set ----  back");
		 window.location.href=  $('#backmenu').attr('href');
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
	String uid="errid";
	if(ssUser!=null )
	{
		utype=ssUser.getUsertype();
		uname = ssUser.getName();
		uid= ssUser.getId();
	}
			
	
%>


	<div>
	<br>
	 &nbsp;&nbsp; 
<a id='backmenu'  
href='${ctx}/me.jsp'>返回个人中心</a>
	 &nbsp;&nbsp;
	 </div>
	 <br>
	 <div id='report_div'>
	 </div>
	 <br>
	 <br>
	 <br>
 <script>
 webDBtool={
		 view_div_id: '',
		 view_reportlist: function (arr){
			 	console.log('view_div_id:' + webDBtool.view_div_id);
			 	
				if(arr == null || arr== '' || arr== undefined)
				{
					console.log('no   data');
					return;
				}
				arr= $.parseJSON( arr );
				console.log(' -- data length: '+arr.length );
				
				//初始化消息列表VIEW
				$(webDBtool.view_div_id).empty();
				
				var rowdata='';
				for(var i=0,l=arr.length;i<l;i++){
					
					rowdata='';
					for( var k=0;k< arr[i].length; k++)
					{
						if( arr[i][k] ==null)
							continue;
						else
							rowdata+= arr[i][k]+',';
					}						
					$(webDBtool.view_div_id).append( rowdata);
					$(webDBtool.view_div_id).append( '<br>');
				}
				
				// 刷新CSS
			},
			
 		findreportAjax:	function (ctx, form_data){
				
				var serverURL=ctx+"/user_findreport.do?"+ form_data;
		  
		  console.log(serverURL );
		  //
		  $.ajax({
		      //请求方式
		      type : "GET",
		      //请求的媒体类型
		      contentType: "application/json;charset=UTF-8",
		      //请求地址
		      url : serverURL,
		      //数据，json字符串
		      //data : JSON.stringify(list),
		      //请求成功
		      success : function(result) {
		          console.log('-=-=-=   server back:'+result);
		          webDBtool.view_reportlist(result);
//		           alert('提交成功'+result);
		      },
		      //请求失败，包含具体的错误信息
		      error : function(e){
		          console.log(e.status);
		          console.log(e.responseText);
		      }
		  });
			}
 }

 
 ////////////////////////////////////////////
 $(function () {
	  console.log("set tool");
	  
// 	  var  report_tool=new webDBtool();
	  webDBtool.view_div_id = '#report_div';
	  webDBtool.findreportAjax(ctx, '');
	 
});
  
 	
 </script>

			 
</BODY>
</HTML>
