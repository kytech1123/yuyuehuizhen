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
	<script type="text/javascript">
	$(document).ready(function(){
		var logo=""
		$.ajax({ url: "${ctx}/wexin/doctorData/islogin", 
	    	 type: "get", 
	    		success: function(data){
	    			if(data.Message!="OK"){
	    				$("li[id^='islogin']").attr('style','');
	    			}else{
	    				var text="<a href='${ctx}/wexin/doctorData/userinfo?id="+data.doctorId+"'><img alt='' class='logo' src='"+data.img+"'>"+data.username+"个人资料</a>";
	    				var te="<a href='${ctx}/wexin/doctorData/userinfo?id="+data.doctorId+"'><img alt='' class='logo' src='${ctxStatic}/qunaikeji.jpg'>"+data.username+"个人资料</a>";
	    				$('#login').attr('style','')
	    				if(data.img!="" && data.img!=null){$('#login').children().html(text);}
	    				else{$('#login').html(te);}
	    			}
	    		}});
	});
	function register(){
		layer.confirm('请选择用户类型？', {
			  btn: ['医生专家','普通用户'] //按钮
			}, function(){
				location="${ctx}/wexin/doctorData/register";
			}, function(){
				location="${ctx}/wexin/doctorData/register?userType=2";
			});
	}
	
	</script>
	
	<sitemesh:head/>
	<style type="text/css">
	
	.myimg{
	width: 60px;
	height: 60px;
	border-radius: 50%;
	overflow: hidden;
	object-fit: cover; 
	    object-position: center;
	   } 
	   .myimg2{
	width: 40px;
	height: 40px;
	border-radius: 50%;
	overflow: hidden;
	object-fit: cover; 
	    object-position: center;
	   } 
	   .logo{
	width: 30px;
	height: 30px;
	border-radius: 50%;
	overflow: hidden;
	object-fit: cover; 
	    object-position: center;
	   } 
	
	</style>
	<style>
            *{
                padding: 0;
                margin: 0;
            }
            dl{
                padding: 0;
                padding: 10vw;
            }
        </style>
</head>
<body>

<div class="layui-container" style="background-color: #FCFCFC;">
<div class="row">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     <a class="navbar-brand" href="#">
        <img alt="" class="logo" src="${ctxStatic}/qunaikeji.jpg">
      </a>
   <p class="navbar-text"><font size="4">陕西群爱生物科技有限公司</font></p>
    </div>
 
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">菜单 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${ctx}/weixin/viewdoctor">专家库</a></li>
            <li><a href="${ctx}/weixin/meetingData">会议库</a></li>
            <li id="login" style="display: none;"></li>
            <li id="islogin" style="display: none;"><a href="${ctx}/wexin/doctorData/tologin">登录</a></li>
            <li id="islogin" style="display: none;"><a href="#" onclick="register()">注册</a></li>
         <li role="separator" class="divider"></li> 
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>
<div class="row" style="height: 70px;"></div>
	<sitemesh:body/>
	 <div class="row" style="height: 90px;"></div>
</div>
</body>
</html>