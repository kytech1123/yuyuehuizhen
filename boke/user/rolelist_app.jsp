<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="edu.ahpu.boke.domain.SysUser" %>
<%@ page import="edu.ahpu.boke.util.*" %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>用户列表</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" type="text/css" href="css/video.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">

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
.usermenu, a{
	margin: 0px;
	padding：0px;
	background-color: #6b6;
	color: #fff;
	text-decoration: none;
	font-size:18px;
}
.data_table_role_select 
{
	width: 98%;
}
.data_table_role_select tr td
{
	border-collapse: collapse;
	border-bottom: #5a5 1px dashed;
	border-top: #5a5 1px dashed;
}
.span_title 
{
	font-size:18px;
}
.div_addme
{
	font-size:18px;
	margin:10px;
}
.div_addme a
{
	background-color: #6b6;
	color: #fff;
	font-size:18px;
	padding:3px;
	border-bottom: 2px solid #252;
	border-right: 2px solid #252;
}
.div_addme input
{
	background-color: #6b6;
	color: #fff;
	font-size:18px;
	padding:3px;
	border-bottom: 2px solid #252;
	border-right: 2px solid #252;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("user list app");
	}
</script>

<link href="css/banner.css" type="text/css" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">
<!-- 2021.9.2 app 医生列表 -->
<link href="css/listview_app.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
<!-- 2021.10.22 对话框 -->
<script src="${ctx}/js/js_dialog_schedule.js"></script>

</head>

<BODY onload="selectChannel();">

<!-- top导航 -->
<div class="top_nag">
	<div class="top_p1">
		<a href="index.jsp">
		<img src="images/top/back.png">
		</a>
	</div>
	<div class="top_p2">
	<a href="index.jsp">
	<img src="images/top/set.png">
	</a>
	</div>
</div>
<!-- top导航 fixed, 加换行 -->
<br>
<br>
<br>
<br>
<%
	// 添加会诊专家
	// 读取当前登录用户信息 
	SysUser ssUser=SessionUtils.getUserFormSession(request);
	String utype="err";
	String uid="errid";
	String uname="errname";
	if(ssUser!=null )
	{
		utype=ssUser.getUsertype();
		uid=ssUser.getId();
		uname= ssUser.getName();
	}
	out.print("<input type='hidden' id='ssuserid' value='"+ uid +"'>");						
	out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
	out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	
	out.print("<input type='hidden' id='ssmenutype' value='"+ 
		SessionUtils.ctxget("menutype") +"'>");						
		
%>
<script type="text/javascript">

// ok cancel
function ConfirmBtnPro(){
	// $.MsgBox.param  按钮id， 存放目的地址
	if($.MsgBox.ret_val == 'ok')
	{
		window.location.href=$.MsgBox.param  +'&remarks=已同意';
	}
	else
	{
		window.location.href=$.MsgBox.param  +'&remarks=等待同意';
	}
}

function jsaddrole(btn)
{
	var menutype=$("#ssmenutype").val();
	
	console.log('role list ss menutype:'+ menutype);
	
	if(  menutype == 'adddoctor')
	{
		//添加汇报人	remarks 不填
		window.location.href=btn.id;
		return;
	}
	////////////////////////////// 添加会诊专家
	console.log("btn.id "+btn.id);
// 	alert("456");

	var ssuserType=$("#ssusertype").val();
	
	console.log('login usertype:'+ ssuserType);
	//如果当前用户是医生
// 	if( ssuserType== 'doctor' )
// 	{
// 		 window.location.href=btn.id+'&remarks=等待同意';
// 	}
	 if( ssuserType== 'doctor' || ssuserType== 'assistant' )
	{
		// 界面优化 2021.10.22
		$.MsgBox.param = btn.id;
		$.MsgBox.ConfirmBtn("消息", "专家是否已确定参会?", '确定','待定', ConfirmBtnPro);
	}
	else
	{
		alert('请您先登录');
		console.log('login usertype:'+ ssuserType+ ' please login');
	}
}
</script>
<!-- 按身份选择用户列表，携带当前会议编号，编辑菜单类型 -->
	<br>
	<br>
	<input type='hidden' id='meetid' value='${meetid}'> 	
	<input type='hidden' id='userin' value='${param.userin}'> 	
	<div class="user_menu">
		<a href="${ctx}/meet_findoneManage.do?id=${meetid}&reqfrom=app">
		&nbsp;返回当前会诊&nbsp;</a>&nbsp;&nbsp;<span class='span_title'> 选择医生：</span>
		
			<br>
			
<%-- 		&nbsp;会诊编号：${meetid} &nbsp;	菜单类型：${menutype} --%>
	</div>



<div class="div_addme"> 
	&nbsp;&nbsp;本人入会，请点击：
	<input id='addme_btn' type='button' value='添加本人'> <br> </div>

		<DIV >
		<table class="data_table_role_select">
			<s:iterator value="#userlist" var="item_data"
				status="st">
				<tr class="datalist_item">
				<td>
						<a href='${ctx}/user_findone.do?id=${item_data.id}'>
						<img class="index_icon" src="images/user_icon.png">
						</a>
				</td>

				<td>
					<%-- 				${item_data.loginName}					  --%>
									<div><span id="user_item">${item_data.name}</span>
					&nbsp;&nbsp;<span id="user_item">182********</span>
						&nbsp;&nbsp;
						<br> <span id="user_item">${item_data.companyId}</span>
						
						<br> <span id="user_item">${item_data.officeId}</span>&nbsp;&nbsp;
					
										<span id="user_item">${item_data.level}</span>
					<br><span id="user_item">${item_data.major}</span></div>					 
								
				</td>
				
				<td class='col_edit'>
					<!-- 				操作链接 -->
					${item_data.extprop}
					<div><span id="user_item">
					<a class="editmenu" id="${meetid},${item_data.id},${item_data.name},${item_data.extprop}"
					 href="#" onclick="jsaddrole(this)">${menutype}</a>
					 </span>
					</div>
				</td>
			</s:iterator>
			</table>
		</DIV>
		
<!-- 底部加换行		 -->
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
	// 修改UI文字
	 i=0;
	 var menutpye=$(".editmenu:first").text();
	 console.log("menutype:"+ menutpye);
	 
	 var userRole=( menutpye=='adddoctor')?'汇报人':'专家';
	 
// 	 $('.span_title').text( $('#ssmenutype').val() );
	 $('.span_title').text( '添加'+userRole );
	 
	 
	 //2021.9.23
	 var ssuserType=$("#ssusertype").val();
	 // 如果是医助，隐藏本人添加
	 if ( ssuserType=='assistant')
	 {
		 $('#addme_btn').parent().hide();
	 }
	 
	 $(".editmenu").text(function(i,origText){
	        return  origText='添加' ;
	    });
	
	 $(".editmenu").each(function(){
         var param=this.id.split(","); //ex: 会议ID 1001,5,张三
         this.id="/boke/meet_addrole.do?reqfrom=app&id="+param[0]+"&userId="
        		 +param[1]+"&userName="+ param[2]+"&userRole="+userRole;
        
         if( param[3] == '有约')
         { 
        	 console.log( param[2]+param[3]);
        	 $(this).hide(); //隐藏编辑按钮，不能点"添加"
         }
         // 2021.12.22 判断当前用户时有约、未约
         // 找到当前用户
         if( param[1] == $("#ssuserid").val() &&  $('#userin').val() == '1')
         {
        	 $(this).hide();	//隐藏编辑按钮，不能点"添加"
         }
         
     	 // 找到当前用户
         if( param[1] == $("#ssuserid").val())
         { 
        	 var allow= (param[3] !=null && param[3] !='')? '['+param[3] +']':'';
			 var bText = $("#ssusername").val();
			 
			 console.log(bText+":"+bText.length);
        	 
        	 if( param[3] != '有约')
             { 
        		 // 汇报人 可以加入， 未约的专家 可加入
        		 console.log('check 可加入');
    			 $('#addme_btn').val(bText+allow + '加入');
            	 
            	 $("#addme_btn").bind("click",function(){
            		 	targeturl ="/boke/meet_addrole.do?reqfrom=app&id="
     					   +$("#meetid").val()
    			   			+"&userId="
    	        		 +$("#ssuserid").val()+"&userName="
    	        		 + $("#ssusername").val()+"&userRole="+userRole+'&remarks=已同意';
            		 	
            		 	console.log("#addme_btn "+ targeturl);
            		   if(confirm('是否确定参加'))
            			{
            			   console.log("#addme_btn click");
            			   window.location.href= targeturl;
            			}
            		  });
             }
        	 else
        	 {	//有约 不能加入
        		 $('#addme_btn').val(bText+allow );
        		 $('#addme_btn').attr({"disabled":"disabled"});
        		 $('#addme_btn').css({"background-color":"#fff",
        			 	"color":"#666"});
        	 }
        	 
        	 // 用户已加入
        	 if( $('#userin').val() == '1')
        	 {	//有约 不能加入
        		 $('#addme_btn').val(bText+'已加入' );
        		 $('#addme_btn').attr({"disabled":"disabled"});
        		 $('#addme_btn').css({"background-color":"#fff",
        			 	"color":"#666"});
        	 }
         }
         
	 	}); 
	 
	 ////////////////
	 $('.occupied').css({ 'float': 'right',
		 	'margin-right': '5px' });
	 $('.col_edit').css({ 'border-left': '2px solid green',
		 	'padding-left' : '5px' });
 });
	 </script>
</BODY>
</HTML>
