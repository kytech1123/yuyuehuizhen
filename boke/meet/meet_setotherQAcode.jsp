<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>直播设置</title>
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
href='${ctx}/meet_findoneManage.do?reqfrom=app&id=${param.id}'>返回会诊管理</a>
	 &nbsp;&nbsp;群爱会议设置 
	 <br>
<!-- 	没有选择文件的情况下，点击提交，会清除原有数据。 -->
	 <br>
	</div>
<!-- 	private String liveqacode;
	private String 	liveBill;
	private String liveSchedule;
	private String liveExpert; -->

<!-- 	上传文件表单 -->
	<form id="meetBeforeForm" action="${ctx}/meetbefore_updateOtherFile.do"
				method="post" enctype="multipart/form-data" >
<input  type=hidden id="id"
	name="id" value="${param.id}" >

<input  type=hidden id="dbfield"
	name="dbfield" value="${param.dbfield}" >
	
<span id="filelabel">直播二维码</span> 
<input type="file" name="report_file" id="fileinput" />
		<br>
		<input type="hidden" name="clientfilename" id="clientfilename" />
		<input type="hidden" name="clientfiletype" id="clientfiletype" />

</form>
<br>
&nbsp;
&nbsp;

<button id="subbtn" onclick="sendmsg()">提交</button>
&nbsp;
&nbsp;
<button id="cancelbtn" onclick="back()" >取消</button>


<script>
// D:\jspwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\boke\qaserver
var setlabel = function(){
	var labels={
		"qrcode": "设置二维码",
		"liveBill": "设置海报",
		"liveSchedule": "设置议程",
		"liveExpert": "设置专家简介"
		}
	
	dbfield =  $('#dbfield').val();
	
	console.log('labels[dbfield ]:'+labels[dbfield ]);
	$('#filelabel').html( labels[dbfield ]);
};
setlabel();

//2021.10.27
//获取上传文件名、文件类型
function uploadfile() {
	 console.log("///// addmeet ///// upload file app");
	 
	 var form = document.getElementById('addfile');
	//再次修改input内容
	fname= $('#fileinput').val()
	console.log( fname );
	
	var index1=fname.lastIndexOf(".");    // .pdf .pptx
	var index2= fname.lastIndexOf("\\");    //  d:\123.pdf
	
	var typestr= fname.substring(index1, fname.length );
	var namestr= fname.substring(index2+1, index1 );
	$('#clientfilename').val(namestr);
	$('#clientfiletype').val( typestr);
	console.log( '///////// file info' );
	console.log( typestr+","+ namestr);
	
}
	//////////////// 2021.10.20 开会方式设置  update
	// 在地址栏，给下一个网页传递一个json对象，过滤特殊字符
	function backJson()
	{
		 var backurl={'server':'meet_findoneManage.do',
	        		'reqfrom':'app',
	        		'id': $('#id').val() };
	        
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
		
		var serverURL=ctx+"/meetbefore_updateOtherJson.do?"+ form_data;
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
	  
	  //设置文件名、文件类型
	  uploadfile();
	  // 提交表单
	  form=document.getElementById('meetBeforeForm');
	  form.submit();
  }
	
	
	/////////////////////////////////
    $(function(){
        //请求参数
        var list = {};
        var ctx='/boke';
        var id = $('#id').val();
    
        //不获取
        //getItem( ctx, id);
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
