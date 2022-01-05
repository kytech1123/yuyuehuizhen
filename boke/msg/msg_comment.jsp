<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>我要评价</title>

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
<script src="${ctx}/js/js_meetreceive.js"></script>
<script src="${ctx}/js/js_meetstart.js"></script>
<script src="${ctx}/js/js_meethelp.js"></script>

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
	font-size:20px;
}
button{
	font-size:20px;
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
	if(ssUser!=null )
	{
		utype=ssUser.getUsertype();
		uname = ssUser.getName();
	}
	out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
					
		
%>
	<div>
	<br>
	 &nbsp;&nbsp; 
<a id='backmenu'  
href='${ctx}/meet_findoneManage.do?reqfrom=app&id=${param.appointmentId}'>返回会诊管理</a>
	 <br>
	</div>
<!-- 	 msg_friendlist.do -->

<form id='commentForm'>
<input  type=hidden id="id"
	name="id" value="${param.id}" >
<input  type=hidden id="appointmentId" 
	name="appointmentId" value="${param.appointmentId}" >

留言内容<input  type=text id="userRole"   name="tipword"     >
<br>
是否匿名
<select name="meetBefore" >
			<option value="未完成" selected>匿名</option>
			<option value="已完成">不匿名</option>
			</select>
</form>
<br>
&nbsp;
&nbsp;

<button id="subbtn" onclick="sendmsg()">提交</button>
&nbsp;
&nbsp;
<button id="cancelbtn" onclick="back()" >取消</button>


<script>
	//////////////// 2021.10.20 开会方式设置  update
	///////////////////////// function
 	function sendmsgAjax(ctx, form_data){
		
		var serverURL=ctx+"/meetbefore_updateoneJson.do?"+ form_data;
        //var backurl= $('#backmenu').attr( 'href');
        //backurl=backurl.substring( backurl.lastIndexOf('/')+1, backurl.length );
        var backurl={'server':'meet_findoneManage.do',
        		'reqfrom':'app',
        		'id': $('#appointmentId').val() };
        
        var backurl_str= JSON.stringify( backurl); 
        backurl_str= backurl_str.replace(/{/g,'');
        backurl_str= backurl_str.replace(/}/g,'');
        backurl_str= backurl_str.replace(/:/g,'-');
        backurl_str= backurl_str.replace(/,/g,'+');
        backurl_str= backurl_str.replace(/\"/g,'');
        console.log(serverURL );
        console.log(backurl_str );
        var str=ctx+'/act_ok_app_param.jsp'
    	+'?act_ok_info=操作成功&act_ok_text=返回会诊管理&act_ok_href='+backurl_str;
        
        console.log( str );
       // return;
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
                console.log('server back:'+result);
                window.location.href = str;
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}
	
	/////////////////////////////////// 发送消息
  	function sendmsg(){
	  console.log('send meet before');
	
	  /////////// 发出请求 server
	  //console.log( getTime() );
	  //$('#chattime').val( getTime() );
	  
	  var params = $('#meetBeforeForm').serialize();
	  console.log( params );
	  
	  sendmsgAjax( ctx, params );
	 
  }
	
	///////////////////////////// findone
	function viewitemRole( meetbefore_obj )
	{
		 console.log('viewitemRole ');
		 $('#userRole').val( meetbefore_obj['userRole'] );
		 $('#userName').val( meetbefore_obj['userName'] );
		
	}
	function viewresult(arr)
	{
		var str_start='';
		var str_receive='';
		var help;
		console.log(arr.length );

		if(arr == null || arr== '' || arr== undefined)
		{
			console.log('no data');
			return;
		}
		arr= $.parseJSON( arr );
		console.log(arr.length );
		for(var i=0,l=arr.length;i<l;i++){
			
// 			console.log(arr[i]['userName'] );
			  viewitemRole( arr[i] );
				
		} // end for
	}

	function getItem(ctx, id)
	{
		var serverURL=ctx+"/meetbefore_findoneJson.do?id="+id;
        
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
                console.log('success'+result);
                viewresult(result);
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}
	/////////////////////////////////
    $(function(){
        //请求参数
        var list = {};
        var ctx='/boke';
        var id = $('#id').val();
    
        //获取留言列表
        //getItem( ctx, id);
    });
</script>
 
 <script>
 
 ////////////////////////////////////////////
 $(function () {
	  console.log("set tool");
	  
	 
});
  
 	console.log("menu");
 </script>

			 
</BODY>
</HTML>
