<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"   %>
<%@ page  import="edu.ahpu.boke.util.*"   %>

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

<!-- 会诊详情 -->
<link href="css/detailview_app.css" type="text/css" rel="stylesheet">

<!-- 竖状折叠菜单 -->
<link href="css/manage_menu.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

<script src="${ctx}/js/js_meetmanage.js"></script>

<!-- 对话框 -->
<script src="${ctx}/js/js_dialog_schedule1116.js"></script>


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
.view_item_remark{
	background-color: #06e;
	color: #fff;
	margin:5px;
}
</STYLE>

<script type="text/javascript">

	function selectChannel() {
		 console.log("meet detail app");
		 //alert(window.location.href);
	}
	
// 	下载功能 代码文件 /boke/WebRoot/meet/meetlist_app.jsp
	function downfile(obj) {
		 console.log(obj.id);
		 console.log('//////////////////downfile ');
		// alert('请联系管理员');
		// $.MsgBox.Alert("消息", "请联系管理员徐芳菲18234498304或您的医助" );
		 window.location.href=obj.id;
	}
	
	function livelinkset(a_obj)
	{
		t= $('#AsetLive').attr('href');	//当前直播链接
		
		//直播链接的特殊字符处理
		t=t.replace(/&/g,'(a)');
		paramurl = a_obj.id+'&setLive=' + t;
		
		console.log(paramurl);
		window.location.href= paramurl;
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
		uid = ssUser.getId();
	}
	out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
	out.print("<input type='hidden' id='ssuserid' value='"+ uid +"'>");						
					
		
%>
	<div>
	<br>
	 &nbsp;&nbsp;<a href="${ctx}/meet_findall.do?reqfrom=app" >会诊大厅</a> &gt;会诊管理：
	 &nbsp;&nbsp;
	 <a href="${ctx}/msg/chatmsgTeam.jsp?appointmentId=${item_data.id  }&chatroom=${item_data.id  }">会诊群聊</a>
	 <br><br>
	</div>
	
	 <ul class="con_ul">
  <li>
  <div class="title">
  会诊信息
  </div>
  <div class="con">
<table id="data_table_one">
		</table>
</div>  
  </li>
  
<!--   2021.9.7 管理菜单APP 第二项 会前准备 参会者 -->
  <li>
  <div class="title">
   会前准备-参会者
  </div>
  <div class="con">
  &nbsp;<a class="item_edit_a" id='addreport_A'
	  href="${ctx}/user_roleselcet.do?meetid=${item_data.id}&menutype=adddoctor&reqfrom=app">
	  &nbsp;&nbsp;添加汇报人&nbsp;&nbsp;</a>
		&nbsp;
	 &nbsp;<a class="item_edit_a" id='addhelp_A'
	  href="${ctx}/user_roleselcet.do?meetid=${item_data.id}&menutype=addexpert&reqfrom=app">
	  &nbsp;&nbsp;添加会诊专家&nbsp;&nbsp;</a>
		
<table  id="role_table">
	<s:iterator value="#meet_rolelist" var="role_data"			status="st">
		<tr id="row<s:property value='#st.index'/>">

		<td><span id="view_item">${role_data.userRole  }</span>		
		&nbsp;
		
		<span id="view_item" >
		<a href='${ctx}/user_findone.do?id=${role_data.userId}'>${role_data.userName  }</a></span>
		<span class='view_item_meet_user_id'>${role_data.userId}</span>
<!-- 		参会者个人信息 -->
		<br> ${role_data.reserve2  }  
<%-- 		${role_data.officeId  }  --%>
			<br>
			<span class="view_item_remark" 
			id="<s:property value='#st.index'/>">${role_data.remarks  }</span>
				</td>		 
		<td>
		
<!-- 		协助TA -->
		<span id="help<s:property value='#st.index'/>">
		<a href='${ctx}/meetuser_helpone.do?id=${role_data.id  }&appointmentId=${role_data.appointmentId}'>协助TA</a>
		</span>
			
		<span id="word<s:property value='#st.index'/>">
			医助:
		</span>
		<span id="<s:property value='#st.index'/>" 
			class="view_assistantname">${role_data.assistantName  }</span>	
<!-- 			跳转聊天 -->
			<a href="${ctx }/msg/chatfriend.jsp?appointmentId=${item_data.id  }">
				<img id="icon<s:property value='#st.index'/>" 
					src='${ctx}/images/ui/ui_chatmsg.png' />
			</a>
			</td> 
			</tr>
						</s:iterator>
</table >
</div>  
  </li>
  
  <li>
  
  <script type='text/javascript'>  
            function selectFile(){  
                //触发 文件选择的click事件  
                $("#file").trigger("click");  
            //其他code如 alert($("#file").attr("value"))  
            }  
              
            /* 获取 文件的路径 ，用于测试*/  
            function getFilePath(){  
//                 alert($("#file").attr("value"));  
            }  
        </script>  
        
  <div class="title">
   会前准备-病例管理
  </div>
  <div class="con">
<!--  添加病例 onclick="selectFile()" -->

&nbsp;<a class="item_edit_a" 	
  href="${ctx}/meetfiles_findall.do?appointment_id=${item_data.id}&reqfrom=app" >
	  &nbsp;&nbsp;添加病例&nbsp;&nbsp;</a>
&nbsp;<a class="item_edit_a" 	  
	href="${ctx}/meetfiles_findall.do?appointment_id=${item_data.id}&reqfrom=app" >
	  &nbsp;&nbsp;调整顺序&nbsp;&nbsp;</a>

	  <table id="data_table_files">
	  <s:iterator value="#meet_filelist" var="vitem"
				status="st">
		<tr>
			<td><span id="view_item">${vitem.report_id  }</span>		</td>	 
			<td><span id="view_item">${vitem.filename  }</span>
			&nbsp;
			<span class="downlaod_a"
			 id="${ctx}/download.do?FileName=${vitem.filename  }&FilePath=${vitem.filepath}"
			 onclick='downfile(this)'
			 >下载</span>
			<td><span id="view_item">${vitem.user_name  }</span>		</td>	 
			<td> 
				<span id="view_item">${vitem.report_time  }</span>	</td> 
			</tr>
						</s:iterator>
		</table>
<!-- 		<input type="file" id="file" onchange="getFilePath()"    -->
<!--             style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;"/> -->
</div>  
  </li>
  
  <li>
  <div class="title">
    参会方式 会议软件
  </div>
  <div class="con">
(注意：如果点击入会链接加入会议，请使用谷歌浏览器电脑版、手机自带浏览器)
	  <table id="data_table_files">
	
	 
	 <s:iterator value="#meet_rolelist" var="role_data"			status="st">
		<tr id="before_row<s:property value='#st.index'/>">
		<td><span id="view_before"><s:property value="#st.index + 1" /> </span>		
		</td>	 
		
		<td><span id="view_before">${role_data.userRole  }</span>		:
		<span id="view_before">${role_data.userName  }</span>
			&nbsp;&nbsp;
			<span class="view_before_remark" 
			id="<s:property value='#st.index'/>">${role_data.remarks  }</span>
	<br>
		参会地点: &nbsp;<span id="view_before">${role_data.meetAddr  }</span><br>
		会议软件:&nbsp;<span id="view_before">${role_data.meetTool  }</span><br>
				软件信息:&nbsp;<span id="view_before">${role_data.meetInfo  }</span><br>
		会前测试:&nbsp;<span id="view_before">${role_data.meetBefore  }</span><br>
		入会链接:&nbsp;<a href='${role_data.reserve1  }' 
		target='_blank'
		class="view_before_meetjoin">${role_data.reserve1  }</a><br>
		
		</td>
		<td>
			<a class="btn_before_set" 	
  href="${ctx}/meet/meet_settool.jsp?id=${role_data.id  }&appointmentId=${role_data.appointmentId  }" >
	  <img src='${ctx}/images/ui/set_ui.png' width='25px'></a>
		</td>
	</tr>
	</s:iterator>	
		</table>
		
</div>  

<li>
  <div class="title">
   直播设置
  </div>
  <div class="con">
	  <table id="data_table_files">
	  <tr> <td>会议直播</td> <td>内容</td>  <td></td> </tr>

	  <tr> <td>群爱会议</td> <td>第<span id='qaMeetNum_v'>${item_data.qaMeetNum  }</span>期</td>  <td>
		<a class="btn_before_set" 	
		  href="${ctx}/meet/meet_setother.jsp?id=${item_data.id  }&qaMeetNum=${item_data.qaMeetNum  }" >
			  <img src='${ctx}/images/ui/set_ui.png' width='25px'></a>
			  </td> </tr>
	  
	  <tr> <td>二维码</td> 
	  		<td><img id='liveqacode' src="${item_data.liveqacode}" />
				  </td>
			 <td>
			<a class="btn_before_set" 	
			  href="${ctx}/meet/meet_setotherQAcode.jsp?id=${item_data.id  }&dbfield=qrcode" >
				  <img src='${ctx}/images/ui/set_ui.png' width='25px'></a>
				  </td> </tr>

	  <tr> <td>直播链接</td> 
		  <td>  <a id='AsetLive' href=${item_data.setLive } target='_blank'> 观看直播</a></td> 
				   <td>
				  	<a class="btn_before_set" 	href="javascript:;" onclick="livelinkset(this)"
			  id="${ctx}/meet/meet_setotherlive.jsp?id=${item_data.id  }&dbfield=setLive" >
				 		 <img src='${ctx}/images/ui/set_ui.png' width='25px'></a></td> </tr>
	  
	  <tr> <td>海报</td>  
	  		<td> <img id='img_liveBill' src="${item_data.liveBill}" /></td> 
 			<td>
			<a class="btn_before_set" 	
			  href="${ctx}/meet/meet_setotherQAcode.jsp?id=${item_data.id  }&dbfield=liveBill" >
				  <img src='${ctx}/images/ui/set_ui.png' width='25px'></a>
				  </td> </tr>
				  
	  <tr> <td>议程</td>  
	  		<td> <img id='img_liveSchedule' src="${item_data.liveSchedule}" /></td> 
 			<td>
			<a class="btn_before_set" 	
			  href="${ctx}/meet/meet_setotherQAcode.jsp?id=${item_data.id  }&dbfield=liveSchedule" >
				  <img src='${ctx}/images/ui/set_ui.png' width='25px'></a>
				  </td> </tr>
				  
		<tr> <td>专家简介</td>  
	  		<td> <img id='img_liveExpert' src="${item_data.liveExpert}" /></td> 
 			<td>
			<a class="btn_before_set" 	
			  href="${ctx}/meet/meet_setotherQAcode.jsp?id=${item_data.id  }&dbfield=liveExpert" >
				  <img src='${ctx}/images/ui/set_ui.png' width='25px'></a>
				  </td> </tr>
		</table>
</div>  
  </li>

</ul>
		
		<DIV >
<!-- 数据区：单条会诊信息 -->
				<div class="datalist_item">
		<div><span id="view_item">${item_data.id  }</span></div>					 
		<div><span id="view_item">${item_data.doctorName  }</span></div>					 
		<div><span id="view_item">${item_data.doctorPhone  }</span></div>					 
		<div><span id="view_item" class="applyTime" >${item_data.applyTime  }</span></div>					 
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
		<br>		<br>		<br>		<br>
 		<br>		<br>		<br>		<br>
	<script>
$(function(){
	// 预约时间
	$('.applyTime').text( function (i, t){
		//console.log(t);
		return t.slice(0,10);
	});
	
	t=$('#qaMeetNum_v').text();
	console.log('qaMeetNum_v:'+t);
	console.log( t== null);
	console.log( t== undefined);
	console.log( t== '0');
	if(	t=='0' || t== null || t==undefined )
		$('#qaMeetNum_v').text('-');
});
</script>	
<script type="text/javascript">
function AssistantChat()
{
	// 如果有医助，显示聊天图标
	$('.view_assistantname').text(function(i,origText){
			var rowid= this.id;
				
			if( origText !=""&& origText!=null&& origText!=undefined )
			{
				$('#word'+rowid).show();// 显示提示文字 医助，显示聊天图标
				$('#icon'+rowid).show();// 显示提示文字 医助，显示聊天图标
				$('#icon'+rowid).css({"width":"45px"});
			}
			else
			{
				$('#word'+rowid).hide();
				$('#icon'+rowid).hide();
			}
			
	});	
}
// 2021.12.15 设置上传图片路径
function strfind(s,target)
{
	t=target.split(',');
	for(i=s.length-1;i>=0;i--)
		if(s[i]== t[0] || s[i]==t[1])
			return i;
	///////////////
	return i;
}
function changeUploadPic(id)
{
// 	baseurl='http://192.168.1.16:8080/boke/qaserver';
	baseurl='qaserver';
	
	s= $(id)[0].src;
	 
	 s2= document.getElementById(id.substr(1, id.length)).src;

	 // 从文件的完整绝对路径中，截取右边，只留文件名.扩展名 png ，jpg
	 t=s2.slice( strfind(s2,'/,\\') );	// 从右边找 / 或 \
 	 
// 	 $(id).parent().append( '<br>t:'+t+'<br>' );
	 console.log('t:'+t);
	 
	 // 如果为空，有问号，说明src数据是空，没有图片，不显示
	 if( s2== '' || s2.indexOf('?')>-1 )
			$(id).hide();
	 else
	 {
				s2= baseurl+t ;
				$(id).attr('src', s2);	// 更新图片的src
				$(id).css({'width': '150px' });
	}
	 //output
// 	 $(id).parent().append( $(id).attr('src') );
	 console.log($(id).attr('src') );
}
function LivefilePath()
{
	// 2021.11.25 	二维码路径
	changeUploadPic( '#liveqacode'); 
	changeUploadPic( '#img_liveBill'); 	//海报
	changeUploadPic( '#img_liveSchedule'); //议程
	changeUploadPic( '#img_liveExpert'); //专家简介图片
}
function liveInfo()
{
	//直播链接
	var livelink= $('#AsetLive').attr('href');
	console.log(" -- live link -- "+ livelink );
	
	if (  livelink == ''  || livelink=='on' || livelink == undefined  )
	{
		console.log(" -- live link hide -- "  );
		$('#AsetLive').hide();
	}
	// $('#AsetLive').hide();
	//https://wx.vzan.com/live/topicguide-421903272?shareuid=null&sharetstamp=0&jumpitd=1
	///////////////////////////////////////////////////
}


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
			// 表格添加内容
		 $("#data_table_one").append("<tr><td>"+ item_label_ar[i] +"</td><td>"+origText +"</td></tr>");
		 	
			
			console.log("text"+i);
	        return  item_label_ar[i]+":"+origText ; 
	        i++;
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
	 //////////////// download 修改下载路径符合
	$('.downlaod_a').each(function(){
			// this.href= this.href.replace(/\\/g,'/');
		this.id= this.id.replace(/\\/g,'/');
	});	
	 
	 //2021.9.25 隐藏已拒绝
	$('.view_item_remark').text(function(i,origText){
		if( origText =='已拒绝' )
			{
				var rowid= this.id;
				$('#row'+rowid).hide();
				$('#before_row'+rowid).hide();	//会前使用信息，隐藏 2021.10.20
			}
	});	
	 
	 // 2021.10.20 控制按钮显示 协助TA
	access_check_helpBtn($('#ssusertype').val()  );
	access_check_setMeetBtn( $('#ssusertype').val() );
	 
	AssistantChat();
	liveInfo();
	LivefilePath();
	
	// 2021.12.22  遍历参会id, 判断当前用户是不是参会者
	$('.view_item_meet_user_id').text(function(i,origText){
			console.log('view_item_meet_user_id');
		// 当前用户已经是参会者之一
		if( origText == $('#ssuserid').val() )
		{
			d = $('#addreport_A').attr('href');
			console.log(d);
			$('#addreport_A').attr('href', d+'&userin=1');
			
			urlhelp = $('#addhelp_A').attr('href');
			$('#addhelp_A').attr('href', urlhelp+'&userin=1');
			console.log(  $('#addreport_A').attr('href') );
		}
		
		$(this).hide();
	});
	
	// 2021.12.29
	meetjoin();
});
 
function meetjoin()
{
	 $('.view_before_meetjoin').text(function(i, t){
		console.log(" -- meetjoin "+i+","+t); 
	 });
	}
</script>			

 <script>
 	// 折叠菜单
  $('.con_ul li .title').click(function(){    
  		console.log("click");
	  	$(this).toggleClass('act');//获取当前点击对象，切换act类，达到切换背景箭头的效果
  		$(this).next().slideToggle();//获取当前点击对象的下一个兄弟级，实现折叠效果切换  
  });
 	console.log("menu");
 </script>

			 
</BODY>
</HTML>
