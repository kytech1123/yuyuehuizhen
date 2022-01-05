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

<%!
	String  strMeetData=
		"神经内科,神经衰弱怎样治疗,运城同德医院,2021.9.1 15:00-17:00,汇报病例2/3,会诊专家2,未开始;"
		+"神经内科,神经衰弱怎样治疗,运城同德医院,2021.9.2 15:00-17:00,汇报病例1/3,会诊专家2,未开始;"
		+"神经内科,神经衰弱怎样治疗,运城同德医院,2021.9.3 15:00-17:00,汇报病例1/3,会诊专家2,未开始"
		;
	String  reportUser=
		"李士浚,病例1.pptx,病例1-1.jpg,病例1-2.jpg#王安庆,病例2.pdf;"
		+"张菲丽;"
		+"许丽生"
		;
	String  receiverUser=
		"王贵,李工;"
		+"陈安康,陈涛,许一凡;"
		+"杨小虎,王勇,赵军"
		;%>
<%
	
	application.setAttribute("meet_data", strMeetData);
	application.setAttribute("reportUser", reportUser);
	application.setAttribute("receiverUser", receiverUser);
%>
<%=strMeetData %>
<!-- 11 -->
<!-- work2021.8.25 -->
    <div class="wrapper">
        <img class="left" width="50" src="images/banner/left.png"/>
        <img class="right" width="50" src="images/banner/right.png"/>
        <ul class="slider">
            <li><img src="images/banner/b_img1.png"></li>
            <li><img src="images/banner/b_img1.png"></li>
            <li><img src="images/banner/b_img1.png"></li>
            <li><img src="images/banner/b_img1.png"></li>
        </ul>
        <ul class="pagination-wrap">
            <li class="active">1</li><li>2</li><li>3</li><li>4</li>
        </ul>
    </div>


<script src="js/banner_index.js"></script>

<div></div>
<div class="qa_msginfo">
	<a href="#">您有新的消息，请及时处理</a>
</div>
<div class="qa_msginfo">
	系统公告：第60期会诊正在进行中，欢迎点击观看
</div>

<div class="menu1">
	<a href="experts.jsp">
	专家库</a>
</div>
<div class="menu2">
	病例库
</div>
<div class="menu_robot">
	小群机器人
</div>

<div class="row_br"></div>

<div class="menu_meet">
	<div class="menu3">
		预约会诊
	</div>
	<div class="menu4">
		会诊大厅
	</div>
	<div class="menu5">
		医助客服
	</div>
	<div class="menu6">
		我的会诊
	</div>
</div>

<div class="row_br"></div>

<div class="menu_qa">
	<div class="menu6">
		群爱资讯新闻
	</div>
	<div class="menu7">
		群爱大数据
	</div>
</div>

<div class="row_br"></div>

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
		<a href="#">首页
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
 
