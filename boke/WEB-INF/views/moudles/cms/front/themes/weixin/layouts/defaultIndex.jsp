<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<title>欢迎进入<sitemesh:title default="群爱专家病例库"/></title>
   <script src="${ctxStatic}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
	<%--<link href="${ctxStatic}/raty/demo/stylesheets/labs.css" type="text/css" rel="stylesheet" /> --%>
	<meta name="renderer" content="webkit"><meta http-equiv="X-UA-Compatible" content="IE=8,IE=9,IE=10" />
    <meta http-equiv="Expires" content="0"><meta http-equiv="Cache-Control" content="no-cache"><meta http-equiv="Cache-Control" content="no-store">
    <link href="${ctxStatic}/jquery-select2/3.4/select2.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-select2/3.4/select2.min.js" type="text/javascript"></script>
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<link href="${ctxStatic}/layui/dist/css/layui.css" type="text/css" rel="stylesheet" />
   <script src="${ctxStatic}/layui/dist/layui.js" type="text/javascript"></script>
   <script src="${ctxStatic}/layui/src/modules/layer.js" type="text/javascript"></script>
   <link href="${ctxStatic}/layui/dist/css/modules/layer/default/layer.css" type="text/css" rel="stylesheet" />
	<link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
	<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
	 <%-- <link href="${ctxStatic}/common/jeesite.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script> --%>
   <link href="${ctxStatic}/raty-master/lib/jquery.raty.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/raty-master/lib/jquery.raty.js" type="text/javascript"></script>
	<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	
	<sitemesh:head/>
</head>
<body>


	<sitemesh:body/>
</body>
</html>