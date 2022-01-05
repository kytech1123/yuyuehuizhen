<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>

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

<link href="${ctx}/css/major/major.css" type="text/css" rel="stylesheet">

<link href="css/detailview_app.css" type="text/css" rel="stylesheet">

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

#begintime,#endtime
{
	font-size: 18px;
}
#report_time
{
	font-size: 18px;
}

.a-btn-01{
	background-color: #6b6;
	color: #fff;
	margin: 5px;
	padding: 3px;
	display: block;
	text-align: center;
	width: 100px;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("meet add app");
	}
</script>

</head>

<BODY onload="selectChannel();">


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
		uid = ssUser.getId();
	}
	out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
	out.print("<input type='hidden' id='ssuserid' value='"+ uid +"'>");						
					
		
%>
<!--  导航 -->
<%@ include file="nag.jsp" %>

<br>
<br>
<br>
<script type="text/javascript">
function sel_role()
{
	var form = document.getElementById('addform');
	//再次修改input内容
	var act_param =   document.getElementById('action');
	act_param.value= 'meetadd_rolelist';
	console.log("form submit btn2");
	form.submit();
}
// 2021.10.27
// 获取上传文件名、文件类型
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

function js_checkinfoName()
{
	uname = $('#ssusername').val();
	return	 uname == null || uname== ''	|| uname== undefined || uname=='null';
}
function checknull( v )
{
	return	 v == null || v== ''	|| v== undefined || v=='null';
}
function js_addmeet()
{
	//数据修改
	 var time = $("#view_item_applyTime").val();
	 if( checknull( time) )
	 {
			alert('请填写预约时间');
			return;
	 }
	
	 time= time.substr(0,10);
	 console.log("info meet: "+time);
	 $("#view_item_applyTime").val( time);
	 
	var params = $('#addform').serializeArray();
	console.log(params);
	
	var params_str = $('#addform').serialize();
	console.log(params_str);
	
// 	var j= JSON.parse(params_str);
// 	console.log(j);

	uploadfile();	//上传文件，设置文件名、类型
	
	//检查个人信息完整状态
	if( js_checkinfoName() )
	{
		alert('您的资料还不完善，请到“我的/编辑个人资料”填写个人姓名，再发出预约');
		return;
	}
//	提交表单
	var form = document.getElementById('addform');
	form.submit();
}
</script>

	<div>
	<br>
	 &nbsp;&nbsp;发出预约：
	 <br>
	</div>
		<form id="addform" action="meet_addmeet.do"
				method="post" enctype="multipart/form-data" >
<!-- 		本表单操作方式 -->
		<input id="action" type="hidden" name="action" value="meetadd_qa">
		
		<table id="data_table_one">
		<tr>
		<td>填表人</td> <td><%=uname %>
		</td>
		</tr>
		<tr>
		<td>标题</td> <td><input type="text" name="appointment.title" />
		</td>
		</tr>
		
		<tr>
		<td>主要问题</td> <td><textarea rows="5" cols="30" name="appointment.content" >请描述主要问题</textarea>
		<br>
<td>
		</td>
		</tr>
		
		<tr>
		<td>主要科室</td> <td><input type="text" id='majorsInput' name="appointment.majors" />
		&nbsp;&nbsp;
<!-- 		<input type="button"  class="a-btn-01" onclick="choose(this,0)" value="选择科室"/> -->
			  <a href="javascript:;" class="a-btn-01" onclick="choose(this,0)">选择科室</a>
		</td>
		</tr>
		
		<tr>
		<td>预约时间</td> <td><input type="text" name="appointment.applyTime"
		id="view_item_applyTime"
		class="Wdate" onClick="WdatePicker({autoPickDate:true,dateFmt:'yyyy-MM-dd'})"
		/>
		<br>
		<br>
		<span id='begintime'>开始时间:</span>
		<select id='applyBeginTime' name="appointment.applyBeginTime" >
			<option value="08:00:00">08:00:00</option>
			<option value="08:30:00">08:30:00</option>
			<option value="09:00:00">09:00:00</option>
			<option value="09:30:00">09:30:00</option>
			<option value="10:00:00">10:00:00</option>
			<option value="10:30:00">10:30:00</option>
			<option value="11:00:00">11:00:00</option>
			<option value="11:30:00">11:30:00</option>
			<option value="12:00:00">12:00:00</option>
			<option value="14:00:00">14:00:00</option>
			<option value="14:30:00">14:30:00</option>
			<option value="15:00:00">15:00:00</option>
			<option value="15:30:00">15:30:00</option>
			<option value="16:00:00">16:00:00</option>
			<option value="16:30:00">16:30:00</option>
			<option value="17:00:00">17:00:00</option>
			<option value="17:30:00">17:30:00</option>
			<option value="18:00:00">18:00:00</option>
			<option value="18:30:00">18:30:00</option>
		</select>
		<br>
		<span id='endtime'>结束时间:</span>
		<select id='applyEndTime' name="appointment.applyEndTime" >
			<option value="08:00:00">08:00:00</option>
			<option value="08:30:00">08:30:00</option>
			<option value="09:00:00">09:00:00</option>
			<option value="09:30:00">09:30:00</option>
			<option value="10:00:00">10:00:00</option>
			<option value="10:30:00">10:30:00</option>
			<option value="11:00:00">11:00:00</option>
			<option value="11:30:00">11:30:00</option>
			<option value="12:00:00">12:00:00</option>
			<option value="14:00:00">14:00:00</option>
			<option value="14:30:00">14:30:00</option>
			<option value="15:00:00">15:00:00</option>
			<option value="15:30:00">15:30:00</option>
			<option value="16:00:00">16:00:00</option>
			<option value="16:30:00">16:30:00</option>
			<option value="17:00:00">17:00:00</option>
			<option value="17:30:00">17:30:00</option>
			<option value="18:00:00">18:00:00</option>
			<option value="18:30:00">18:30:00</option>
			<option value="18:30:00">19:00:00</option>
		</select>
		<td>
		<td>		<br>		</td>
		</tr>
		
		<tr>
		<td>病例文件</td> 
		<td><input type="file" name="appointment.report_file" id="fileinput" />
		<br>
		<input type="hidden" name="appointment.clientfilename" id="clientfilename" />
		<input type="hidden" name="appointment.clientfiletype" id="clientfiletype" />
		</td>
		</tr>
		
		<tr>
		<td>设置1</td> <td><input id="checkAddFile" type="checkbox" 
						name="appointment.setAddreport" checked/>允许添加新病例
			<br>
			<br>
			最多汇报病例数量<input  id="maxFile" type="text" 
						name="appointment.setMaxreport"  value="3"/>
		</td>
		</tr>

		<tr>
		<td>设置2</td> <td><input id="checkLive" type="checkbox" 
						name="appointment.setLive"  checked/>允许网络直播<td>
		</td>
		</tr>
		
		</table>
		<br>
		如果手机端上传文件失败，请在PC浏览器上上传文件。<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  id="sub_btn" type="button" 
			onclick="js_addmeet()" value="提交预约申请"/>
		
		</form>
		<DIV >

		</DIV>
<!-- 		弹框view组件 -->
	<div class="wrapper" style="display:none">
    </div>
    <div class="layouts" style="display:none">
        <div class="layoutsMain">
            <div class="title"></div>
            <div class="main-wrapper">
                <div class="checkboxwrapper">
                </div>
                	<br>
                	未列出出的科室，可直接输入。各个科室用英文逗号分隔。
            </div>
            <div class="btn-wrapper">
                <a href="javascript:;" class="a-btn-01" onclick="sureBtn()">确定</a>
                <a href="javascript:;" class="a-btn-02">取消</a>
            </div>
        </div>
    </div>
		<br>		<br>		<br>		<br>
 		<br>		<br>		<br>		<br>
 		
<!-- js脚本库 -->
<script src="js/major/major.js"></script>

<script type="text/javascript">
 $(function () {
	
	 var item_label="会诊编号,发起人姓名,发起人电话,预约时间,填表时间,实际开始时间,结束时间,"
	 			+"标题,主诉内容,病例文件,汇报人数量,会诊专家数量,群爱期次,状态";
		
	 var item_ar=$('.datalist_item div');
	 
	 console.log(item_ar);
	 
	 var i=0;

	 var item_label_ar = item_label.split(",");
	 
	 // 修改UI文字
	 i=0;
	
	 // CSS设置
	 // 隐藏
	 $(".datalist_item").hide();
	 $("#data_table_one tr td:first-child").css("text-align", "right");
	 $("#data_table_one tr td:first-child").css("padding", "5px");
	 $("#data_table_one tr td:first-child").css("width", "30%");
	 $("#data_table_one tr td:first-child").css("font-size", "20px");
	 
	 $("#checkAddFile").css("float", "20px");
	 $("#checkAddFile,#checkLive").css("width", "35px");
	 $("#maxFile").css("width", "40px");
	 
	 /////////// err 错误代码
	 $("#nextrole").click( function(){
		 console.log("next role select");
		 $("#action").val("meetadd_rolelist");
		 $("#addform").submit(function(){return true});
	 });
	 
	 //2021.12.27 检查个人资料
	 console.log(' ====  js_checkinfoName '+ js_checkinfoName());
	 if( js_checkinfoName() )
	 {
		alert('您的资料还不完善，请到“我的/编辑个人资料”填写个人姓名，再发出预约');
		$('#sub_btn').on("click",function(){
			alert('您的资料还不完善，请到“我的/编辑个人资料”填写个人姓名，不能预约');
		});

	 }
 });
</script>			
				 
			 
</BODY>
</HTML>
