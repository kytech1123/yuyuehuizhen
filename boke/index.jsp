<%@ page language="java" contentType="text/html; charset=utf-8"      %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>群爱医疗管理信息系统</title>
<link href="css/banner.css" type="text/css" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<!-- 2021.10.7-->
<!--  我发起的、我接收的，进入管理 
bug改正： 后添加的汇报人，在“我发起的”看不到会诊
-->
<!--  发起预约，添加汇报人，添加病例文件 
	  文件下载
	  
	  医助：添加专家，是否已确认同意
	  专家：拒绝原因
	  		已同意，再次取消
	  发起人：拒绝专家
	 给专家添加医助
	 消息聊天UI
	 
	 
	 2021.10.22
	 医生详情
	医生时间
	 病例下载access
	 会前准备
	 会议设置,会议设置access...
	 评价和投票
	 
	患者，私聊，未读消息提醒
	各种类型的文件上传、大文件上传
	病例下载的限制条件
	////////////////////////////
	重复数据判断
	
	删除功能
	
	注册医生，医生头像设置
	
	患者数据，普通用户数据
	
	查询、筛选、排序
	预约单的填单日期
	
	10.27
	<mapping resource="edu/ahpu/boke/domain/Msginfosys.hbm.xml" />
	
	医疗OA
	
	2021.11.16
	已约时间段设置
	
	请医生设置出诊时间表
		
	2021.11.24
		<base href="http://localhost:8080/boke/"></base>
		
		2021.11.26
		http://localhost:8080/boke/user/reportallshow.jsp
		打开网页 http://localhost:8080/boke/user/reportallshow.jsp
		查看所有人提交的反馈建议，服务器重启一次，内容消失。（把所有人的建议保存一个txt文件，永久保存）
		
		
唐子奇,doctor,4,1,辛苦的码农;
唐子奇,doctor,4,null,JSP/javaee做后台，真辛苦;
唐子奇,doctor,4,null,下拉列表value;
唐子奇,doctor,4,2,表单提交;
唐子奇,doctor,4,2,表单提交;
唐子奇,doctor,4,6,费劲;
唐子奇,doctor,4,消息聊天,改行;
唐子奇,doctor,4,首页,填建议;
唐子奇,doctor,4,首页,填建议;

	建表、写后台
	
	上传文件夹
	/boke/src/edu/ahpu/boke/filter/LoginChecker.java
	
	Const.UPLOAD_REAL_PATH =  "D:\\qaserver";
	Const.UPLOAD_REAL_PATH =  "qaserver";  //去掉盘符，工程的当前文件夹下
	
	实际运行的文件夹
	D:\jspwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\boke
	
	qaserver\qa112988e93.pptx
	
	部署连接数据库
	 <property name="driverClass" value="com.mysql.jdbc.Driver" />
        <property name="jdbcUrl" value="jdbc:mysql://localhost:3306/boke?useUnicode=true&amp;characterEncoding=utf-8" />
        <property name="user" value="root" />
        <property name="password" value="123456" />
        
        
     tomcat/conf/server.xml
     
        <Host appBase="webapps" autoDeploy="true" name="localhost" unpackWARs="true">

       
        <Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs" pattern="%h %l %u %t &quot;%r&quot; %s %b" prefix="localhost_access_log" suffix=".txt"/>
        
       <Context docBase="D:\qaserver" path="qaserver/" reloadable="false"/>
       
       <Context docBase="/usr/locatl/f1/" path="fa/" reloadable="false"/>
       放静态资源LINUX：/usr/locatl/f1/haibao.png   <img src='fa/haibao.png'>
       放静态资源：D:\qaserver\haibao.png   <img src='qaserver/haibao.png'>
       
       后台代码：java创建文件new File('qaserver/bingli.ppt'),是否能在D:\qaserver\bingli.ppt??? 

      <Context docBase="D:\jspwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ROOT" path="" reloadable="false"/>
      <Context docBase="D:\jspwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\boke" path="/boke" reloadable="true" source="org.eclipse.jst.jee.server:boke"/></Host>
     
-->

<!--
	2021.12.8
 LoginChecker--init--D:\jspwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\boke\qaserver\ -->
<%
	response.sendRedirect("user_index.do");
%>
</body>
</html>
 
