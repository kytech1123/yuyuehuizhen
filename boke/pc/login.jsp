<%@ page language="java" contentType="text/html; charset=utf-8"
      %>

<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>群爱医疗管理信息系统</title>

<link href="../css/web0825.css" type="text/css" rel="stylesheet">
<link href="../css/index.css" type="text/css" rel="stylesheet">
<script>
function bodyScale() {
    var devicewidth = document.documentElement.clientWidth;
    var scale = devicewidth / 1440;  
    // 分母——设计稿的尺寸
    document.body.style.zoom = scale;
}
window.onload = window.onresize = function () {
//     alert('欢迎使用PC版');
    bodyScale();
};
</script>
</head>
<body>
<script>
function forget(){
	alert("请联系管理员徐经理 18234498304");
}
</script>
<!--  导航 -->


<!-- 11 -->
<div class="main">
    <div class="title">
        <span>用户登录</span>
    </div>
 
    <div class="title-msg">
        <span>请输入登录账户和密码</span>
    </div>
 
    <form action="login_login.do" class="login-form" method="post" novalidate >
        <!--输入框-->
        <div class="input-content">
            <!--autoFocus-->
            <div>
               &nbsp; <input type="text" autocomplete="off"
                        name="userName" />
            </div>
 
            <div style="margin-top: 16px">
               &nbsp; <input type="password"
                       autocomplete="off"  name="password"  maxlength="32"/>
            </div>
        </div>
 
        <!--登录按钮-->
        <div style="text-align: center;margin-top: 16px">
 			<span >${invalid_user_error }</span>
            <input type="submit" class="enter-btn"  value="登录"  />
        </div>
    </form>
 
        <div class="foor">
            <div class="left"><a href="javascript:;" onclick="forget()" >忘记密码</a></div>
 
            <div class="right"><a href="register.jsp">注册账户</a>
            </div>
        </div>
 
</div>
<!-- ———————————————— -->
<!-- 版权声明：本文为CSDN博主「cxzlp0521」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。 -->
<!-- 原文链接：https://blog.csdn.net/cxzlp12345/article/details/82802388 -->
</body>
</html>
 
