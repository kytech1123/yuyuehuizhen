<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="edu.ahpu.boke.domain.*"  %>
<%@ page  import="edu.ahpu.boke.util.*"  %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>管理系统 ——后台管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link href="${ctx}/css/css.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${ctx }/js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="${ctx }/js/jquery-migrate-1.2.1.js"></script>
		<script language="javascript" type="text/javascript"> 
			$(function(){
				/** 给左侧功能菜单绑定点击事件  */
				$("td[id^='navbg']").click(function(){
				   	 /** 获取一级菜单的id */
				   	 var navbgId = this.id;
				   	 /** 获取对应的二级菜单id */
				   	 var submenuId = navbgId.replace('navbg','submenu');
				   	 /** 控制二级菜单显示或隐藏  */
				   	 $("#"+submenuId).toggle();
				   	 /** 控制关闭或者开启的图标*/
				   	 $("#"+navbgId).toggleClass("left_nav_expand");
				   	 
				   	 /** 控制其他的一级菜单的二级菜单隐藏按钮都关闭  */
				   	 $("tr[id^='submenu']").not("#"+submenuId).hide();
				   	 /** 控制其他一级菜单的图片显示关闭  */
				   	 $("td[id^='navbg']").not(this).removeClass().addClass("left_nav_closed");
				   	 
				   	 
				})
			});
			
			$(function(){
				$('#addmeetbtn').on("click",function(){
// 				    alert("段落被点击了。");
					if( $("#ssuserid").val() != null &&  $("#ssuserid").val() != 'errid' )
    				{
						
    				}else
    				{
    					alert("请您先登录");
    					return false;
    				}
				});
			});
		</script>
	</head>
<body>

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
	out.print("<input type='hidden' id='ssusertype' value='"+ utype +"'>");						
	out.print("<input type='hidden' id='ssusername' value='"+ uname +"'>");						
	out.print("<input type='hidden' id='ssuserid' value='"+ uid +"'>");						
					
		
%>
	<div style="margin:10px;background-color:#FFFFFF; text-align:left;">
		<table width="200" height="100%" border="0" cellpadding="0" cellspacing="0" class="left_nav_bg">
		  <tr><td class="left_nav_top"><div class="font1">用户管理</div></td></tr>
		  <tr valign="top">
		    <td class="left_nav_bgshw" height="50">
			  <p class="left_nav_link"><img src="${ctx}/images/left_nav_arrow.gif">&nbsp;&nbsp;
			  <a href="${ctx}/user_findall.do" target="main">用户查询</a></img></p>
			  
<%-- 			  <p class="left_nav_link"><img src="${ctx}/images/left_nav_arrow.gif">&nbsp;&nbsp; --%>
<%-- 			  <a href="${ctx}/register.jsp" target="main">添加用户</a></img></p> --%>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
		  
		  <tr><td id="navbg1" class="left_nav_closed" ><div class="font1">预约会诊</div></td></tr>
		  <tr valign="top" id="submenu1" style="display: none">
		    <td class="left_nav_bgshw" height="50">
			  <p class="left_nav_link">
			  <img src="${ctx}/images/left_nav_arrow.gif">&nbsp;&nbsp;
			  <a href="${ctx}/meet_findall.do" target="main">会诊大厅</a></img></p>

			  <p class="left_nav_link"><img src="${ctx}/images/left_nav_arrow.gif">&nbsp;&nbsp;
			  	<a href="${ctx}/meetadd_app.jsp?reqfrom=app" id="addmeetbtn"
			  	 target="main">发出预约</a></img></p>
			  	 
			  <p class="left_nav_link"><img src="${ctx}/images/left_nav_arrow.gif">&nbsp;&nbsp;
			  	<a href="${ctx}/meet_findall.do?reqfrom=app&handle=myreceive" 
			  	 target="main">我的会诊</a></img></p>
			  	 
			  	
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
		  
		  
		  <tr><td id="navbg4" class="left_nav_closed" ><div class="font1">使用帮助</div></td></tr>
		  <tr valign="top" id="submenu4" style="display: none">
		    <td class="left_nav_bgshw tdbtmline" height="50">
			  <p class="left_nav_link"><img src="${ctx}/images/left_nav_arrow.gif">&nbsp;&nbsp;
			  <a href="${ctx }/cms2/cmshelp.jsp" target="main">视频演示</a></img></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
		  
		  
		  <tr valign="top"><td height="100%" align="center">
		  <div class="copycct"><br /><strong>服务大众健康<br> 放大优质医疗资源</strong>
		  <br>
		  <br><strong>群爱软件开发部</strong>
		  <br>
		  <br>
		  医疗热线:
		  <br>
		 &nbsp;400-610-9777
		 <br>
		 客服热线:<br>
		 &nbsp;18234498304 徐秋兰	  
</div></td></tr>
		  <tr><td height="10"><img src="${ctx}/images/left_nav_bottom.gif" height="10"></img></td></tr>
		  <tr><td height="10" bgcolor="#e5f0ff">&nbsp;</td></tr>
		</table>
	</div>
</body>
</html>