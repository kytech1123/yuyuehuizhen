<%@ page language="java" contentType="text/html; charset=utf-8"      %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>专家库</title>
<link href="css/banner.css" type="text/css" rel="stylesheet">
<link href="css/index.css" type="text/css" rel="stylesheet">
<link href="css/bottom_navig.css" type="text/css" rel="stylesheet">

<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<!-- top导航 -->
<div class="top_nag">
	<div class="top_p1">
		<a href="index.jsp">
		<img src="images/top/back.png">
		</a>
	</div>
	<div class="top_p2">
	<a href="index.jsp">
	<img src="images/top/set.png">
	</a>
	</div>
</div>
<!-- top导航 fixed, 加换行 -->
<br>
<br>
<br>

<div class="row_br">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

<div class="dui-container">
<div>--------- 群爱名医 ---------</div>
	<div class="main_user">
	
	</div>
</div>
<!-- 添加群爱名医列表 -->
<script type="text/javascript">
 $(function () {
	 var user_list="刘医生,山西医科大学第一医院,心内科;\
		 秦卓珈,山西医科大学第一医院,心内科;\
		 韩一芳,山西医科大学第一医院,心内科;\
		 刘志宝,山西医科大学第一医院,心内科;\
		 申莹洋,山西医科大学第一医院,心内科;\
		 周岚青,山西医科大学第一医院,心内科;\
		 徐如华,山西医科大学第一医院,心内科;\
		 张淑馨,山西医科大学第一医院,心内科;\
		 郭银汝,山西医科大学第一医院,心内科;\
		 屈语盼,山西医科大学第一医院,心内科;\
		 柳泳辉,山西医科大学第一医院,心内科;\
		 王语勇,山西医科大学第一医院,心内科;\
		 尤亿,山西医科大学第一医院,心内科;\
		 陶颢瑶,山西医科大学第一医院,心内科;\
		 许丽生,山西医科大学第一医院,心内科;\
		 张欣盛,山西医科大学第一医院,心内科;\
		 李士浚,山西医科大学第一医院,心内科;\
		 王瑜铭,山西医科大学第一医院,心内科;\
		 邹家轩,山西医科大学第一医院,心内科;\
		 向靖辉,山西医科大学第一医院,心内科;\
		 肖浩平,山西医科大学第一医院,心内科;\
		 张菲丽,山西医科大学第一医院,心内科;\
		 王安青,山西医科大学第一医院,心内科";
		 
	user_list = user_list.replace(/\s+/g, "");
	console.log(user_list);
	var user_list_sub=user_list.split(";");
	console.log(user_list_sub.length);
	console.log(user_list_sub);
	
	var i=0;
	var oneInfo;
	 for(i=0;i< user_list_sub.length ;i++)
	 {
		 oneInfo= user_list_sub[i].split(",");
       $('.main_user').append('<div class="index_item">'
    		   +'<div><img class="index_icon" src="images/user_icon.png"></div>'
    		   +"<div class='p2'>"
    		   +oneInfo[0]
    		   +"<br>"
    		   +oneInfo[1]
    		   +","+oneInfo[2]
    		   +"<br>&nbsp;</div>"
       +'</div><br><br>'
      );
 	}  
	 
	 //////////////// css
	 //$('.main_ul').css("list-style","none");
	 $('.index_icon').css("width","50px");
	 $('.index_icon').css("height","50px");
	 $('.index_icon').css("margin-right","15px");
	 $('.index_item').css({"float":"none","width":"300px"});
	 $('.main_user div div').css({"float":"left"});
	 $('.index_item p2').css({"float":"right","height":"50px"});
});
</script>


<div class="bottom_nag">
<ul class="navig_menu">
	<li>
		<a href="index.jsp">首页
	</a>
	</li>
	<li><a href="meet.jsp">会诊
	</a>
	</li>
	<li><a href="#">消息
	</a>
	</li>
	<li><a href="#">我的
	</a>
	</li>
	
</ul></div>

</body>
</html>
 
