<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<title>用户列表</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<!-- <link rel="stylesheet" type="text/css" href="css/video.css"> -->
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
</STYLE>

<script type="text/javascript">
	function selectChannel() {
		 console.log("user_list");
	}
</script>

<link href="${ctx}/css/listview_user.css" type="text/css" rel="stylesheet" />

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

</head>

<BODY onload="selectChannel();">
<!-- 2021.9.2 lvyanyang -->
<!-- 按身份选择用户列表，携带当前会议编号，编辑菜单类型 -->
	<br>
	<a href="${ctx}/meet_findoneManage.do?id=${meetid}">&nbsp;返回当前会诊&nbsp;</a>
			 	&nbsp;会诊编号：${meetid} &nbsp;菜单类型：${menutype}
	<br>
	<div>
	表头
	</div>
		<DIV >
			<s:iterator value="#userlist" var="item_data"
				status="st">
				<div class="datalist_item">
				
				<div><span id="user_item">${item_data.id}</span></div>	
								 
<%-- 				<div><span id="user_item">${item_data.usertype}</span></div>					  --%>
				<div><span id="user_item">${item_data.companyId}</span></div>					 
				<div><span id="user_item">${item_data.officeId}</span></div>					 
				<div><span id="user_item">${item_data.level}</span></div>					 
				<div><span id="user_item">${item_data.major}</span></div>					 
				
				<div><span id="user_item">${item_data.resume}</span></div>					 
				<div><span id="user_item">${item_data.loginName}</span></div>					 
				<div><span id="user_item">${item_data.password}</span></div>					 
				<div><span id="user_item">${item_data.no}</span></div>					 
				<div><span id="user_item">${item_data.name}</span></div>					 
				
				<div><span id="user_item">${item_data.email}</span></div>					 
				<div><span id="user_item">${item_data.phone}</span></div>					 
				<div><span id="user_item">${item_data.mobile}</span></div>					 
				<div><span id="user_item">${item_data.wechat}</span></div>					 
<%-- 				<div><span id="user_item">=${item_data.photo	}</span></div>					  --%>
				
<%-- 				<div><span id="user_item">-${item_data.remarks}</span></div>					  --%>
					 
<%-- 				<div><span id="user_item">=${item_data.qrcode}</span></div>					  --%>
<%-- 				<div><span id="user_item">-${item_data.extprop}</span></div>	 --%>
				<div>&nbsp;<a class="editmenu" id="${meetid},${item_data.id},${item_data.name}"
				 href="#">${menutype}</a>
				</div>	
				</div>					 
			</s:iterator>
		</DIV>
	<script type="text/javascript">
 $(function () {
	 var item_css_w="50,200,100,100,100,"
	 			+"100,100,100,80,100,"
	 			+"100,100,150,130,100";
		
	 var item_ar=$('.datalist_item div');
	 
	 console.log(item_ar);
	 
	 var i=0;
	 var item_css_w_ar = item_css_w.split(",");
	 $('.datalist_item div').each(function(){
	        $(this).css("width",item_css_w_ar[i]+"px");
	        i++;
	        if(i>= item_css_w_ar.length)
	        	i=0;
	    });
	 //////////////// css
	 //$('.main_ul').css("list-style","none");
	 //$('.datalist_item div').css("width","50px");
	 
	 // 修改UI文字
	 i=0;
	 var menutpye=$(".editmenu:first").text();
	 console.log("menutype:"+ menutpye);
	 var userRole=( menutpye=='adddoctor')?'汇报人':'专家';
	 
	 $(".editmenu").text(function(i,origText){
	        return  origText=='adddoctor'?'添加汇报人':'添加专家' ;
	    });
	
	 $(".editmenu").each(function(){
         var param=this.id.split(","); //ex: 会议ID 1001,5,张三
         this.href="/boke/meet_addrole.do?id="+param[0]+"&userId="
        		 +param[1]+"&userName="+ param[2]+"&userRole="+userRole;
	 	});
// ————————————————
// 版权声明：本文为CSDN博主「yezhiqiu_love」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
// 原文链接：https://blog.csdn.net/yezhiqiu_love/article/details/83735713
	 
// 	 alert("2021.8.27 软件会议");
});
</script>			
				 
			 
</BODY>
</HTML>
