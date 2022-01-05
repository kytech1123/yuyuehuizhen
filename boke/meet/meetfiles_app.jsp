<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>文件管理</title>
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

#data_table_files
{
	padding:5px;
	margin：5px;
	border-collapse:collapse;
	width: 98%;
}
#data_table_files td
{
	border:1px solid #6b6;
	padding:3px;
}
.formsubmit
{
	border:1px solid #6b6;
	background-color: #6b6;
	
	color: #000;
}
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("meet detail app");
	}
	function uploadfile() {
		 console.log("upload file app");
		 
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
		
		//表单提交
		form.submit();
	}
	
	function downfile(obj) {
		 console.log(obj.id);
		 console.log('//////////////////downfile ');
		 alert('请联系管理员');
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
	 &nbsp;&nbsp;<a href="${ctx}/meet_findoneManage.do?reqfrom=app&id=${appointment_id}" >会诊管理</a> &gt;
	 病例文件管理：
	 <br>
	</div>
	
		 					 <br>
	<table id="data_table_files">
	<tr>
	<td>汇报<br>顺序</td>
	<td> 病例文件</td>
	<td>汇报人 </td>
	<td> 汇报时间</td>
	<td> 操作</td>
	</tr>
	  <s:iterator value="#meet_filelist" var="vitem"
				status="st">
		<tr>
		
		<td><span id="view_item">${vitem.report_id  }</span>		</td>	 
		<td><span id="view_item" class='view_file_name'>${vitem.filename  }</span>
		<br><a class="downlaod_a"
		 id="${ctx}/download.do?FileName=${vitem.filename  }&FilePath=${vitem.filepath}"
		 onclick='downfile(this)'
		 >下载</a>
		</td>
				<td><span id="view_item">${vitem.user_name  }</span>		</td>	 
		<td> 
		<span id="view_item">${vitem.report_time  }</span>	</td> 
		<td> 
<div ><a href='${ctx}/meetfiles_updatefile.do?id=${vitem.id}&appointment_id=${vitem.appointment_id}'>
	<img width='25px' src='${ctx}/images/ui/setfile.png'></a></div>
	
<div ><br>
<a href='${ctx}/meetfiles_delfile.do?id=${vitem.id}&appointment_id=${vitem.appointment_id}'>
	<img width='25px' src='${ctx}/images/ui/delfile.png'></a></div>
</td>
			</tr>
						</s:iterator>
	  
		</table>

		<br>
		<div class="title_item">&nbsp;&nbsp;添加病例</div>
		
		<form id="addfile" action="meetfiles_addfile.do"
			method="post" enctype="multipart/form-data" >

		<input type="hidden" name="appointment_id" value="${appointment_id}" />

		病例文件:
		<input type="file" name="report_file" id="fileinput" />
		<br><br>
		顺序编号:
		<select name="report_id" >
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		<br><br>
		汇报时间:
<!-- 		<input type="text" name="report_time"  /> -->
		<select name="report_time" >
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
		<br>
		<br>
		<input type="hidden" name="clientfilename" id="clientfilename" />
		<input type="hidden" name="clientfiletype" id="clientfiletype" />
		
		&nbsp;&nbsp;&nbsp;&nbsp;<a  class="formsubmit"  onclick="uploadfile()" >添加病例 </a>
		&nbsp;&nbsp;<input type="button" value="取消"/>
		</form>
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
	 
	 $('#addfile').css("font-size", "18px");
	 $('input').css("font-size", "18px");
	 $('select').css("font-size", "18px");
	 $('option').css("font-size", "18px");
	 $('.title_item').css({"font-size":"18px","background-color":"#096"
		 ,"color":"#fff","height":"30px"
		 ,"margin-top":"5px"
		 });
	 
	 $('.downlaod_a').css({"font-size":"18px","background-color":"#096"
		 ,"color":"#fff","height":"30px"
		 ,"margin-top":"5px"
		 });
	 //////////////// download 2021.9.25 特殊字符替换
		$('.downlaod_a').each(function(){
				this.href= this.href.replace(/\\/g,'/');
		});	
	 
	 ////
	 $('.view_file_name').text(function(i, origin){
		 		console.log( origin+ ","+ origin.length );
		 		console.log( origin.slice(-20));
				if(origin.length >20)
					$(this).text( origin.slice(-20));
	 	});
});
</script>			
				 
			 
</BODY>
</HTML>
