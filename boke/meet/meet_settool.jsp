<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>开会方式</title>
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
	 &nbsp;&nbsp;开会方式设置 
	 <br>
	</div>
<!-- 	 msg_friendlist.do -->

<form id='meetBeforeForm'>
<input  type=hidden id="id"
	name="id" value="${param.id}" >
<input  type=hidden id="appointmentId" 
	name="appointmentId" value="${param.appointmentId}" >

参会者<input  type=text id="userName"  name="username" disabled >
<br>
<input  type=hidden id="userRole"   name="userRole"   disabled >
会议地址
<select id='meetAddr'  		name="meetAddr" >
			<option value="群爱会诊中心-上海">群爱会诊中心-上海</option>
			<option value="群爱会诊中心-西安">群爱会诊中心-西安</option>
			<option value="群爱会诊中心-太原">群爱会诊中心-太原</option>
			<option value="本人工作单位">本人工作单位</option>
			<option value="家里">家里</option>
			<option value="其他地址">其他地址</option>
		</select>
		
<br>
<input  type=text id="meetAddrOther"  name="meetAddrOther" >
<br>
会议软件
<select id='meetTool' 		name="meetTool" >
			<option value="亿联客户端">亿联客户端</option>
			<option value="亿联链接">亿联链接</option>
			<option value="腾讯会议">腾讯会议</option>
			<option value="钉钉">钉钉</option>
			<option value="微信群聊">微信群聊</option>
			<option value="other">其他软件</option>
		</select>
<br>
<br>
软件信息<br>
<!-- <input  type=text id="meetInfo"  name="meetInfo" 	 value=''> -->
&nbsp;
&nbsp;<textarea id="meetInfo"  name="meetInfo" rows="6" cols="35">会议软件账号/腾讯会议号等</textarea>
<br>
是否完成会前测试
<select id='meetBefore' name="meetBefore" >
			<option value="未完成">未完成</option>
			<option value="已完成">已完成</option>
			</select>
		<br>
<br>	
			入会链接<br>
<!-- <input  type=text id="meetInfo"  name="meetInfo" 	 value=''> -->
&nbsp;
&nbsp;<textarea id="meetInfo"  name="reserve1" rows="6" cols="35"></textarea>
</form>
&nbsp;
&nbsp;

<button id="subbtn" onclick="sendmsg()">提交</button>
&nbsp;
&nbsp;
<button id="cancelbtn" onclick="back()" >取消</button>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<script>
	//////////////// 2021.10.20 开会方式设置  update
	// 在地址栏，给下一个网页传递一个json对象，过滤特殊字符
	function backJson()
	{
		 var backurl={'server':'meet_findoneManage.do',
	        		'reqfrom':'app',
	        		'id': $('#appointmentId').val() };
	        
	        var backurl_str= JSON.stringify( backurl); 
	        console.log('stringify--'+backurl_str);
	        
	        backurl_str= backurl_str.replace(/{/g,'');
	        backurl_str= backurl_str.replace(/}/g,'');
	        backurl_str= backurl_str.replace(/:/g,'-');
	        backurl_str= backurl_str.replace(/,/g,'+');
	        backurl_str= backurl_str.replace(/\"/g,'');
	        
	    return backurl_str;
	}
	///////////////////////// function
 	function sendmsgAjax(ctx, form_data){
		
		var serverURL=ctx+"/meetbefore_updateoneJson.do?"+ form_data;
        //var backurl= $('#backmenu').attr( 'href');
        //backurl=backurl.substring( backurl.lastIndexOf('/')+1, backurl.length );
       
        var backurl_str= backJson();
        console.log(serverURL );
        console.log('backurl_str--'+ backurl_str );
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
	/*
	appointmentId: "f7360"
assistantId: ""
assistantName: ""
createdAt: null
createdBy: "韩余晖"
createdOrg: "3"
extprop: ""
id: "f5aafd58e60e4cb7804d545468ffb0a7"
level: ""
levelName: ""
meetAddr: "群爱会诊中心-太原"
meetBefore: "已完成"
meetInfo: "会议号125134"
meetTool: "腾讯会议"
remarks: "等待同意"
reserve1: ""
reserve2: ""
solved: 0
updatedAt: null
updatedBy: ""
updatedOrg: ""
userAccount: ""
userId: "4515"
userName: "陈柏"
userPhone: ""
userRole: "专家"
valid: ""
[[Prototype]]: Object
﻿
​*/
	function viewitemRole( meetbefore_obj )
	{
		 console.log('viewitemRole '+meetbefore_obj);
		 console.log(meetbefore_obj);
		 $('#userRole').val( meetbefore_obj['userRole'] );
		 $('#userName').val( meetbefore_obj['userName'] );
		 
		 $('#meetInfo').html( meetbefore_obj['meetInfo']==''? '会议软件账号/腾讯会议号等信息':meetbefore_obj['meetInfo']);
		 
		 $('#meetAddr').val( meetbefore_obj['meetAddr'] );
		 $('#meetTool').val( meetbefore_obj['meetTool'] );
		 $('#meetBefore').val( meetbefore_obj['meetBefore'] );
		
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
    
        getItem( ctx, id);
    });
</script>
 
 <script>
 
 ////////////////////////////////////////////
 $(function () {
	  console.log("set tool");
	  
	 
});
  
 	console.log("menu");
 	
 	var backurl_str= backJson();
    console.log('backurl_str--'+ backurl_str );
 </script>

			 
</BODY>
</HTML>
